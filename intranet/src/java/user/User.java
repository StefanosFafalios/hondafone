package user;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public abstract class User {
    private String fname;
    private String lname;
    private Date birthDate;
    private boolean gender; //true->male, false->female
    private String homeAddress;
    private String password;
    private boolean married; //true->yes, false->no
    private String afm;
    private String bankAccount;

    public User() {
    }

    public User(String fname, String lname, Date birthDate, boolean gender, String homeAddress, String password, boolean married, String afm, String bankAccount) {
        this.fname = fname;
        this.lname = lname;
        this.birthDate = birthDate;
        this.gender = gender;
        this.homeAddress = homeAddress;
        this.password = password;
        this.married = married;
        this.afm = afm;
        this.bankAccount = bankAccount;
    }

    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public Date getBirthDate() {
        return birthDate;
    }
    
    public String getStringBirthDate() {
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        String bdate = df.format(birthDate);
        return bdate;
    }

    public boolean isMale() {
        return gender;
    }

    public String getHomeAddress() {
        return homeAddress;
    }

    public String getPassword() {
        return password;
    }

    public boolean isMarried() {
        return married;
    }

    public String getAfm() {
        return afm;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public void setHomeAddress(String homeAddress) {
        this.homeAddress = homeAddress;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setMarried(boolean married) {
        this.married = married;
    }

    public void setAfm(String afm) {
        this.afm = afm;
    }

    public String getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(String bankAccount) {
        this.bankAccount = bankAccount;
    }
    
}
