
package hs;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for updateCreditTime complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="updateCreditTime">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="creditToAdd" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="timeToAdd" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="number" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="timeInAcc" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "updateCreditTime", propOrder = {
    "creditToAdd",
    "timeToAdd",
    "number",
    "timeInAcc"
})
public class UpdateCreditTime {

    protected String creditToAdd;
    protected String timeToAdd;
    protected String number;
    protected String timeInAcc;

    /**
     * Gets the value of the creditToAdd property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCreditToAdd() {
        return creditToAdd;
    }

    /**
     * Sets the value of the creditToAdd property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCreditToAdd(String value) {
        this.creditToAdd = value;
    }

    /**
     * Gets the value of the timeToAdd property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTimeToAdd() {
        return timeToAdd;
    }

    /**
     * Sets the value of the timeToAdd property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTimeToAdd(String value) {
        this.timeToAdd = value;
    }

    /**
     * Gets the value of the number property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNumber() {
        return number;
    }

    /**
     * Sets the value of the number property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNumber(String value) {
        this.number = value;
    }

    /**
     * Gets the value of the timeInAcc property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTimeInAcc() {
        return timeInAcc;
    }

    /**
     * Sets the value of the timeInAcc property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTimeInAcc(String value) {
        this.timeInAcc = value;
    }

}
