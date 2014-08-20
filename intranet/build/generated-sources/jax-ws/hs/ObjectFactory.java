
package hs;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the hs package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _CreateAccountResponse_QNAME = new QName("http://HS/", "createAccountResponse");
    private final static QName _UpdateCreditTime_QNAME = new QName("http://HS/", "updateCreditTime");
    private final static QName _UpdateCreditTimeResponse_QNAME = new QName("http://HS/", "updateCreditTimeResponse");
    private final static QName _CreateAccount_QNAME = new QName("http://HS/", "createAccount");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: hs
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link UpdateCreditTimeResponse }
     * 
     */
    public UpdateCreditTimeResponse createUpdateCreditTimeResponse() {
        return new UpdateCreditTimeResponse();
    }

    /**
     * Create an instance of {@link CreateAccount }
     * 
     */
    public CreateAccount createCreateAccount() {
        return new CreateAccount();
    }

    /**
     * Create an instance of {@link CreateAccountResponse }
     * 
     */
    public CreateAccountResponse createCreateAccountResponse() {
        return new CreateAccountResponse();
    }

    /**
     * Create an instance of {@link UpdateCreditTime }
     * 
     */
    public UpdateCreditTime createUpdateCreditTime() {
        return new UpdateCreditTime();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CreateAccountResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://HS/", name = "createAccountResponse")
    public JAXBElement<CreateAccountResponse> createCreateAccountResponse(CreateAccountResponse value) {
        return new JAXBElement<CreateAccountResponse>(_CreateAccountResponse_QNAME, CreateAccountResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link UpdateCreditTime }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://HS/", name = "updateCreditTime")
    public JAXBElement<UpdateCreditTime> createUpdateCreditTime(UpdateCreditTime value) {
        return new JAXBElement<UpdateCreditTime>(_UpdateCreditTime_QNAME, UpdateCreditTime.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link UpdateCreditTimeResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://HS/", name = "updateCreditTimeResponse")
    public JAXBElement<UpdateCreditTimeResponse> createUpdateCreditTimeResponse(UpdateCreditTimeResponse value) {
        return new JAXBElement<UpdateCreditTimeResponse>(_UpdateCreditTimeResponse_QNAME, UpdateCreditTimeResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CreateAccount }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://HS/", name = "createAccount")
    public JAXBElement<CreateAccount> createCreateAccount(CreateAccount value) {
        return new JAXBElement<CreateAccount>(_CreateAccount_QNAME, CreateAccount.class, null, value);
    }

}
