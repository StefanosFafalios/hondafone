package account;

import java.util.Date;

public class AccountInfo {
    private Date dateTime;
    private int credit;
    private Account account;

    public AccountInfo() {
    }
    
    public AccountInfo(Date dateTime, int credit, Account account) {
        this.dateTime = dateTime;
        this.credit = credit;
        this.account = account;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public int getCredit() {
        return credit;
    }

    public void setCredit(int credit) {
        this.credit = credit;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
    
}
