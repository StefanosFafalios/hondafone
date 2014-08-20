package user.admin;

import java.util.Date;

public class SalesRep extends Admin{

    public SalesRep() {
    }

    public SalesRep(String fname, String lname, Date birthDate, boolean gender, String homeAddress, String password, boolean married, String afm, String bankAccount) {
        super(fname, lname, birthDate, gender, homeAddress, bankAccount, password, married, afm);
    }
    
    @Override
    public void giveAccount(){
    
    }
}
