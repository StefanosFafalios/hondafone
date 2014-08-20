package user.admin;

import java.util.Date;

public class Manager extends Admin{

    public Manager() {
    }

    public Manager(String fname, String lname, Date birthDate, boolean gender, String homeAddress, String password, boolean married, String afm, String bankAccount) {
        super(fname, lname, birthDate, gender, homeAddress, bankAccount, password, married, afm);
    }
    
    public void deleteClientInfo(){
    
    }
    
    @Override
    public void giveAccount(){
    
    }
}
