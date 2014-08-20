
package sendmessage;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the sendmessage package. 
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

    private final static QName _SendRequestResponse_QNAME = new QName("http://SendMessage/", "sendRequestResponse");
    private final static QName _SendRequest_QNAME = new QName("http://SendMessage/", "sendRequest");
    private final static QName _SendMessageResponse_QNAME = new QName("http://SendMessage/", "sendMessageResponse");
    private final static QName _SendMessage_QNAME = new QName("http://SendMessage/", "sendMessage");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: sendmessage
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link SendMessage_Type }
     * 
     */
    public SendMessage_Type createSendMessage_Type() {
        return new SendMessage_Type();
    }

    /**
     * Create an instance of {@link SendMessageResponse }
     * 
     */
    public SendMessageResponse createSendMessageResponse() {
        return new SendMessageResponse();
    }

    /**
     * Create an instance of {@link SendRequest }
     * 
     */
    public SendRequest createSendRequest() {
        return new SendRequest();
    }

    /**
     * Create an instance of {@link SendRequestResponse }
     * 
     */
    public SendRequestResponse createSendRequestResponse() {
        return new SendRequestResponse();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SendRequestResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://SendMessage/", name = "sendRequestResponse")
    public JAXBElement<SendRequestResponse> createSendRequestResponse(SendRequestResponse value) {
        return new JAXBElement<SendRequestResponse>(_SendRequestResponse_QNAME, SendRequestResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SendRequest }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://SendMessage/", name = "sendRequest")
    public JAXBElement<SendRequest> createSendRequest(SendRequest value) {
        return new JAXBElement<SendRequest>(_SendRequest_QNAME, SendRequest.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SendMessageResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://SendMessage/", name = "sendMessageResponse")
    public JAXBElement<SendMessageResponse> createSendMessageResponse(SendMessageResponse value) {
        return new JAXBElement<SendMessageResponse>(_SendMessageResponse_QNAME, SendMessageResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SendMessage_Type }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://SendMessage/", name = "sendMessage")
    public JAXBElement<SendMessage_Type> createSendMessage(SendMessage_Type value) {
        return new JAXBElement<SendMessage_Type>(_SendMessage_QNAME, SendMessage_Type.class, null, value);
    }

}
