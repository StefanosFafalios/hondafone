/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package logreg;

import database.DBconnection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import utilities.GeneratePassword;

/**
 *
 * @author wagen
 */
@WebService(serviceName = "logreg")
public class logreg {

    /**
     * Web service operation
     * @param username
     * @param password
     * @return 
     */
    @WebMethod(operationName = "login")
    public ArrayList<String> login(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
        try {
            DBconnection db = new DBconnection();
            String query = "SELECT * FROM users WHERE password = '"+password+"'";
            ResultSet res = db.getDBdata(query);
            
            if(!res.next()){ //if wasn't found
                return null;
            }
            else if(res.getString("username").equals(username)){
                ArrayList<String> sessionVars = new ArrayList<String>();
                sessionVars.add(res.getString("username"));
                sessionVars.add(res.getString("password"));
                sessionVars.add(res.getString("name"));
                sessionVars.add(res.getString("surname"));
                sessionVars.add(res.getString("birthDate"));
                sessionVars.add(res.getString("gender"));
                sessionVars.add(res.getString("homeAddress"));
                sessionVars.add(res.getString("workAddress"));
                sessionVars.add(res.getString("isMarried"));
                sessionVars.add(res.getString("afm"));
                sessionVars.add(res.getString("bankAccount"));
                sessionVars.add(res.getString("instanceof"));
                query = "SELECT * FROM accounts WHERE owner1 = '"+res.getString("afm")+"' OR owner2 = '"+res.getString("afm")+"'";
                ResultSet res1 = db.getDBdata(query);
                int i = 1;
                while(res1.next()) {
                    sessionVars.add("account"+i);
                    sessionVars.add(res1.getString("phoneNumber"));
                    sessionVars.add(res1.getString("owner1"));
                    sessionVars.add(res1.getString("owner2") == null ? "" : res1.getString("owner2"));
                    sessionVars.add(res1.getString("credit"));
                    sessionVars.add(res1.getString("time"));
                    query = "SELECT date, credit FROM accountInfo WHERE account = '"+res1.getString("phoneNumber")+"'";
                    ResultSet res2 = db.getDBdata(query);
                    int j = 1;
                    while(res2.next()) {
                        sessionVars.add("accountInfo"+i+"."+j);
                        sessionVars.add(res2.getString("date"));
                        sessionVars.add(res2.getString("credit"));
                        j++;
                    }
                    i++;
                }
                sessionVars.add("no more accounts!");
                return sessionVars;
            }
            else {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(logreg.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    /**
     * Web service operation
     * @param username
     * @param fname
     * @param lname
     * @param email
     * @param bdate
     * @param gender
     * @param hadd
     * @param wadd
     * @param married
     * @param afm
     * @param bacc
     * @return 
     */
    @WebMethod(operationName = "register")
    public String register(@WebParam(name = "username") String username, @WebParam(name = "fname") String fname, @WebParam(name = "lname") String lname, @WebParam(name = "email") String email, @WebParam(name = "bdate") String bdate, @WebParam(name = "gender") String gender, @WebParam(name = "hadd") String hadd, @WebParam(name = "wadd") String wadd, @WebParam(name = "married") String married, @WebParam(name = "afm") String afm, @WebParam(name = "bacc") String bacc) {
        
        GeneratePassword generator = new GeneratePassword();
        String password = generator.genPass(); //generate unique password
        
        String query = "INSERT INTO users (username, password, name, surname, email, birthDate, gender, homeAddress, workAddress, isMarried, afm, bankAccount) VALUES('"+username+"', '"+password+"', '"+fname+"', '"+lname+"', '"+email+"', '"+bdate+"', "+gender+", '"+hadd+"', '"+wadd+"', "+married+", '"+afm+"', '"+bacc+"');";
        
        DBconnection db = new DBconnection();
        if(db.setDBdata(query)){
            return password; 
        }
        else{
            return null;
        }
    }

    /**
     * Web service operation
     * @param fname
     * @param lname
     * @param email
     * @return 
     */
    @WebMethod(operationName = "subscribe")
    public boolean subscribe(@WebParam(name = "fname") final String fname, @WebParam(name = "lname") final String lname, @WebParam(name = "email") final String email) {
        
        String query = "INSERT INTO subscribers (Fname, Lname, email) VALUES('"+fname+"', '"+lname+"', '"+email+"');";
        
        DBconnection db = new DBconnection();
        return db.setDBdata(query);
    }
}
