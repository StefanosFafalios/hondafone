package HS;

import database.DBconnection;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import utilities.GenerateNumber;

/**
 *
 * @author wagen
 */
@WebService(serviceName = "HondafoneServices")
public class HondafoneServices {

    /**
     * Web service operation
     * @param creditToAdd
     * @param timeToAdd
     * @param number
     * @param timeInAcc
     * @return 
     */
    @WebMethod(operationName = "updateCreditTime")
    public int updateCreditTime(@WebParam(name = "creditToAdd") String creditToAdd, @WebParam(name = "timeToAdd") String timeToAdd, @WebParam(name = "number") String number, @WebParam(name = "timeInAcc") String timeInAcc) {
        int credit;
        if(creditToAdd != null) {
            credit = Integer.parseInt(creditToAdd);
        }
        else {
            int time = Integer.parseInt(timeToAdd);
            credit = time/60;
        }

        DBconnection db = new DBconnection();
        if(db.updateTimeCredit(number, Integer.parseInt(timeInAcc), credit)) {
            return credit*60;
        }
        else{
            return -1;
        }
    }

    /**
     * Web service operation
     * @param afm
     * @param numOfAccs
     * @param master
     * @return 
     */
    @WebMethod(operationName = "createAccount")
    public String createAccount(@WebParam(name = "afm") final String afm, @WebParam(name = "numOfAccs") final int numOfAccs, @WebParam(name = "master") final boolean master) {
        if(numOfAccs >= 6 && !master){
            return "approval";
        }
        else {
            
            String number = new GenerateNumber().generateNumber(); //generate unique phone number
            if(number == null) return null;
            
            String createAcc = "INSERT INTO accounts (credit, time, owner1, owner2, phoneNumber) VALUES(0, 0, '"+afm+"', null, '"+number+"');";
            DBconnection db = new DBconnection();
            if(db.setDBdata(createAcc)) return number;
            else return null;
        }
    }

    
}
