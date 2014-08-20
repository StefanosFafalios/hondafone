
package hs;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for createAccount complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="createAccount">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="afm" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="numOfAccs" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="master" type="{http://www.w3.org/2001/XMLSchema}boolean"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "createAccount", propOrder = {
    "afm",
    "numOfAccs",
    "master"
})
public class CreateAccount {

    protected String afm;
    protected int numOfAccs;
    protected boolean master;

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
     * Gets the value of the numOfAccs property.
     * 
     */
    public int getNumOfAccs() {
        return numOfAccs;
    }

    /**
     * Sets the value of the numOfAccs property.
     * 
     */
    public void setNumOfAccs(int value) {
        this.numOfAccs = value;
    }

    /**
     * Gets the value of the master property.
     * 
     */
    public boolean isMaster() {
        return master;
    }

    /**
     * Sets the value of the master property.
     * 
     */
    public void setMaster(boolean value) {
        this.master = value;
    }

}
