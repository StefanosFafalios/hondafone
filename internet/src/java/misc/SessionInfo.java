package misc;

import java.util.ArrayList;

public class SessionInfo {

    ArrayList<String> clientInfo = new ArrayList<String>();
//  position-value
//    0 -   username
//    1 -   password
//    2 -   name
//    3 -   surname
//    4 -   birth date
//    5 -   gender
//    6 -   home address
//    7 -   work address
//    8 -   is married
//    9 -   afm
//   10 -   bank account
//   11 -   instance of
    ArrayList<ArrayList<String>> accounts = new ArrayList<ArrayList<String>>();
//    0 -   phone number
//    1 -   owner 1 afm
//    2 -   owner 2 afm
//    3 -   credit
//    4 -   time
//    5 -   history date   |\
//    6 -   history credit |/=> repeat
//  ... -   ...
    
    
    public SessionInfo() {
    }

    public ArrayList<String> getClientInfo() {
        return clientInfo;
    }

    public void setClientInfo(ArrayList<String> clientInfo) {
        this.clientInfo = clientInfo;
    }

    public ArrayList<ArrayList<String>> getAccounts() {
        return accounts;
    }

    public void setAccounts(ArrayList<ArrayList<String>> accounts) {
        this.accounts = accounts;
    }
    
}
