package utilities;

import database.DBconnection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GeneratePassword {
    
    private final int[] symbols = {33, 35, 36, 37, 38, 42, 63, 64}; //ascii numbers for symbols used in paswords
    
    private int randInt(int Min, int Max){
        Integer rand;
        rand = Min + (int)(Math.random() * ((Max - Min) + 1));
        return rand;
    }
    
    public String genPass(){
        
        String pass = Integer.toString(randInt(0, 9));
        
        for(int i=0; i<5; i++){ //generate 5 random numbers
            pass += randInt(0,9);
        }
        
        for(int i=0; i<2; i++){ //generate 2 random letters
            pass += (char) randInt((int)'a', (int)'z');
        }
        
        for(int i=0; i<2; i++){ //generate 2 random symbols
            pass += (char) symbols[randInt(0, 7)];
        }
        
        //check if password is unique
        String checkPass = "SELECT password FROM users WHERE password='"+pass+"'";
        ResultSet res = new DBconnection().getDBdata(checkPass);
        try {
            if(res.next() == true) {
                pass = genPass(); //if not unique generate another one
            }
            
            return pass;
        } catch (SQLException ex) {
            Logger.getLogger(GeneratePassword.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
}
