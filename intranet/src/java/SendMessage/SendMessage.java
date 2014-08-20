/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SendMessage;

import database.DBconnection;
import java.util.ArrayList;
import java.util.Properties;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author user
 */
@WebService(serviceName = "SendMessage")
public class SendMessage {

    @WebMethod(operationName = "sendMessage")
    public boolean sendMessage(@WebParam(name = "receiverMail") ArrayList<String> receiverMail, @WebParam(name = "content") String content, @WebParam(name = "subject") String subject) {
        //TODO write your implementation code here:
        String from = "hondafonedist";
        String pass = "11016006";
        String body = content;

        return sendFromGMail(from, pass, receiverMail, subject, body);
        
    }

    private boolean sendFromGMail(String from, String pass, ArrayList<String> to, String subject, String body) {
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.size()];


           
            // To get the array of addresses
            for( int i = 0; i < to.size(); i++ ) {
                toAddress[i] = new InternetAddress(to.get(i));
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            return false;
        }
        catch (MessagingException me) {
            return false;
        }
        return true;
        
    }

    /**
     * Web service operation
     * @param fname
     * @param lname
     * @param afm
     * @param account
     * @return 
     */
    @WebMethod(operationName = "sendRequest")
    public boolean sendRequest(@WebParam(name = "fname") final String fname, @WebParam(name = "lname") final String lname, @WebParam(name = "afm") final String afm, @WebParam(name = "account") final String account) {
        DBconnection db = new DBconnection();
        return db.sendRequest(fname, lname, afm, account);
    }
}
