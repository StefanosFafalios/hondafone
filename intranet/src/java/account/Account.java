package account;

import java.util.ArrayList;

public class Account {
    private String number;
    private int time;
    private String ownerAFMs[] = new String[2];
    private ArrayList<AccountInfo> info;

    public Account() {
    }
    
    public Account(String number, String client, int time) {
        this.number = number;
        this.ownerAFMs[0]=client;
        this.time = time;
    }
    
    public Account(String number, String client1, String client2, int time) {
        this.number = number;
        this.ownerAFMs[0]=client1;
        this.ownerAFMs[1]=client2;
        this.time = time;
    }
    
    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String[] getOwners() {
        return ownerAFMs;
    }

    public void setOwners(String[] owners) {
        this.ownerAFMs = owners;
    }
    
    public void setOwner(String owner) {
        if(this.ownerAFMs[0].isEmpty()) {
            this.ownerAFMs[0] = owner;
        }
        else {
            this.ownerAFMs[1] = owner;
        }
    }

    public ArrayList<AccountInfo> getInfo() {
        return info;
    }

    public void setInfo(ArrayList<AccountInfo> info) {
        this.info = info;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }
}
