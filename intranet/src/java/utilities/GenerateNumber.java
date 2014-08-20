package utilities;

import database.DBconnection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GenerateNumber {
    
    private String number= "696"; //phone starting number
    private Random gen = new Random();
    
    
    
    public String generateNumber() {
        
        int Max = 9;
        int Min = 0;
        Integer rand;

        for(int i=0; i<7; i++){
            rand = Min + (int)(Math.random() * ((Max - Min) + 1));
            number += rand.toString();
        }

        //check if number is unique
        String checkNum = "SELECT phoneNumber FROM accounts WHERE phoneNumber = '"+number+"'";
        ResultSet res = new DBconnection().getDBdata(checkNum);
        
        try {
            
            if(res.next() == true){
                number = generateNumber(); //if not unique generate another one
            }
            
            return number;
        } catch (SQLException ex) {
            Logger.getLogger(GenerateNumber.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
}
