package user.admin;

import user.User;
import java.util.Date;

abstract class Admin extends User{

    protected static final String workAddress = "DistSysProj 2";
    
    public Admin() {
    }

    public Admin(String fname, String lname, Date birthDate, boolean gender, String homeAddress, String bankAccount, String password, boolean married, String afm) {
        super(fname, lname, birthDate, gender, homeAddress, password, married, afm, bankAccount);
    }

    public static String getWorkAddress() {
        return workAddress;
    }
    
    public void createNewClient(){}
    
    public void modifyClientInfo(){}
    
    public void addCredit(){}
    
    public void registerClient(){}
    
    public void checkInfo(){}
    
    abstract void giveAccount();
    
    public void createCard(){}
    
    public void registerAccount(){}
}
