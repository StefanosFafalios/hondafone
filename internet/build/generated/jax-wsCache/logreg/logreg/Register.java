
package logreg;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for register complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="register">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="username" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="fname" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="lname" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="email" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="bdate" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="gender" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="hadd" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="wadd" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="married" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="afm" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="bacc" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "register", propOrder = {
    "username",
    "fname",
    "lname",
    "email",
    "bdate",
    "gender",
    "hadd",
    "wadd",
    "married",
    "afm",
    "bacc"
})
public class Register {

    protected String username;
    protected String fname;
    protected String lname;
    protected String email;
    protected String bdate;
    protected String gender;
    protected String hadd;
    protected String wadd;
    protected String married;
    protected String afm;
    protected String bacc;

    /**
     * Gets the value of the username property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUsername() {
        return username;
    }

    /**
     * Sets the value of the username property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUsername(String value) {
        this.username = value;
    }

    /**
     * Gets the value of the fname property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFname() {
        return fname;
    }

    /**
     * Sets the value of the fname property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFname(String value) {
        this.fname = value;
    }

    /**
     * Gets the value of the lname property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getLname() {
        return lname;
    }

    /**
     * Sets the value of the lname property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setLname(String value) {
        this.lname = value;
    }

    /**
     * Gets the value of the email property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getEmail() {
        return email;
    }

    /**
     * Sets the value of the email property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setEmail(String value) {
        this.email = value;
    }

    /**
     * Gets the value of the bdate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBdate() {
        return bdate;
    }

    /**
     * Sets the value of the bdate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBdate(String value) {
        this.bdate = value;
    }

    /**
     * Gets the value of the gender property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getGender() {
        return gender;
    }

    /**
     * Sets the value of the gender property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setGender(String value) {
        this.gender = value;
    }

    /**
     * Gets the value of the hadd property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getHadd() {
        return hadd;
    }

    /**
     * Sets the value of the hadd property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setHadd(String value) {
        this.hadd = value;
    }

    /**
     * Gets the value of the wadd property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getWadd() {
        return wadd;
    }

    /**
     * Sets the value of the wadd property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setWadd(String value) {
        this.wadd = value;
    }

    /**
     * Gets the value of the married property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMarried() {
        return married;
    }

    /**
     * Sets the value of the married property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMarried(String value) {
        this.married = value;
    }

    /**
     * Gets the value of the afm property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAfm() {
        return afm;
    }

    /**
     * Sets the value of the afm property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAfm(String value) {
        this.afm = value;
    }

    /**
     * Gets the value of the bacc property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBacc() {
        return bacc;
    }

    /**
     * Sets the value of the bacc property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBacc(String value) {
        this.bacc = value;
    }

}
