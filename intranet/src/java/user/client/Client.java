package user.client;

import account.Account;
import user.User;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

public class Client extends User{
    String workAddress;
    private HashMap<String, String> relations;
    private ArrayList<Account> accounts;

    public Client() {
    }

    public Client(String workAddress, String bankAccount, 
            HashMap<String, String> relations, ArrayList<Account> accounts,
            String fname, String lname, Date birthDate, boolean gender,
            String homeAddress, String password, boolean married,
            String afm) {

        super(fname, lname, birthDate, gender, homeAddress, password,
                married, afm, bankAccount);
        this.relations = relations;
        this.accounts = accounts;
        this.workAddress = workAddress;
    }

    public Client(String workAddress, String bankAccount, HashMap<String, String> relations, String fname, String lname, Date birthDate, boolean gender, String homeAddress, String password, boolean married, String afm) {
        super(fname, lname, birthDate, gender, homeAddress, password, married, afm, bankAccount);
        this.relations = relations;
        this.workAddress = workAddress;
    }

    public void setRelations(HashMap<String, String> relations) {
        this.relations = relations;
    }

    public void setAccounts(ArrayList<Account> accounts) {
        this.accounts = accounts;
    }

    public HashMap<String, String> getRelations() {
        return relations;
    }

    public ArrayList<Account> getAccounts() {
        return accounts;
    }

    public String getWorkAddress() {
        return workAddress;
    }

    public void setWorkAddress(String workAddress) {
        this.workAddress = workAddress;
    }
        
    public void addTime(){

    }
    
    public void register(){
        
    }
    
    public void newAccount(){
        
    }
    
    public void deleteAccount(String number) {
        for(int i=0; i<accounts.size(); i++) {
            if(accounts.get(i).getNumber().equals(number)) {
                accounts.remove(i);
                return;
            }
        }
    }
    
    public Account getAccount(String number) {
        for(Account acc : accounts) {
            if(acc.getNumber().equals(number)) {
                return acc;
            }
        }
        return null;
    }
}
