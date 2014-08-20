<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : FronzenAge
Description: A two-column, fixed-width template suitable for business sites and blogs.
Version    : 1.0
Released   : 20071108

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Εγγραφείτε</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<script src="../jquery-1.10.2.min.js"></script>
<link href="../style.css" rel="stylesheet" type="text/css" media="screen" />
<script>
    $(document).ready(function() {        
        $("#registerForm").submit(function(e) {
            if($("#usernameReg").val() == "" || $("#fnameReg").val() == "" || $("#lnameReg").val() == "" || $("#bday").val() == "00" || $("#bmonth").val() == "00" || $("#byear").val() == "00" || ($("#maleRadio").is(":checked") && $("#femaleRadio").is(":checked")) || $("#haddReg").val() == "" || $("#waddReg").val() == "" || ($("#marriedRadio").is(":checked") && $("#singleRadio").is(":checked")) || $("#afmReg").val() == "" || $("#baccReg").val() == "") {
                e.preventDefault();
                $("#errorMsg").html("Παρακαλώ εισάγετε όλα τα πεδία!");
            }
        });
        
    });
</script>
<!--[if IE]>
<style type="text/css">
#sidebar #calendar {
	background-position: 0px 20px;
}
</style>
<![endif]-->
</head>
    <body>
    <div id="logo">
        <img alt="logo" src="../images/img11.png" />
        <h1>HondaFone</h1>
    </div>
    <div id="langBtns">
        <ul>
            <li><a href="/it211030935_DistSys2_Client/en/" ><img src="../images/englishBtn30.png" /></a></li>
            <li><a href="/it211030935_DistSys2_Client/el/" ><img src="../images/greekBtn30.png" /></a></li>
        </ul>
    </div>
    <div id="menu">
        <ul>
            <li class="first"><a href="index.jsp" accesskey="1" title="Home">Αρχική Σελίδα</a></li>
            <li><a href="news.jsp" accesskey="2" title="News">Νέα</a></li>
            <li><a href="aboutUs.jsp" accesskey="3" title="About Us">Σχετικά με εμάς</a></li>
            <li class="afterlogin" style="display: none;"><a href="myaccounts.jsp" accesskey="4" title="My Accounts">Οι λογαριασμοί μου</a></li>
        </ul>
        <div id="logreg">
            <a href="login.jsp">Είσοδος</a> &nbsp;|&nbsp; <a href="register.jsp">Εγγραφή</a>
        </div>
    </div>
    <!-- start page -->
    <div id="page">
        <p id="errorMsg">
            <%= request.getParameter("registered") != null ? "Έχετε εγγραφεί με επιτυχία στη Hondafone. Ελέγξτε τη διεύθυνση ηλεκτρονικού ταχυδρομείου σας για τον κωδικό σας" : "" %>
            <%= request.getParameter("error") != null ? "Σφάλμα κατά την εγγραφή. Δοκιμάστε ξανά!" : "" %>
            <%= request.getParameter("nomail") != null ? "Έχετε εγγραφεί με επιτυχία στη Hondafone, αλλά μήνυμα με τον κωδικό πρόσβασης δεν εστάλη! Παρακαλώ επικοινωνήστε μαζί μας για να λύσουμε το πρόβλημα." : "" %>
        </p>
        <form action="registerbyWS.jsp" method="post" id="registerForm">
            <table id="lrform">
                <tbody>
                    <tr>
                        <td class="rowtitle">Όνομα χρήστη:</td>
                        <td class="rowinput"><input type="text" name="usernameReg" id="usernameReg" /></td>
                    </tr>
                    <tr>
                        <td class="rowtitle">Όνομα:</td>
                        <td class="rowinput"><input type="text" name="fnameReg" id="fnameReg" /></td>
                    </tr>
                    <tr>
                        <td class="rowtitle">Επώνυμο</td>
                        <td class="rowinput"><input type="text" name="lnameReg" id="lnameReg" /></td>
                    </tr>
                    <tr>
                        <td class="rowtitle">Διεύθυνση Email:</td>
                        <td class="rowinput"><input type="email" name="emailReg" id="emailReg" /></td>
                    </tr>
                    <tr>
                        <td class="rowtitle"> Ημερομηνία Γέννησης:</td>
                        <td class="rowinput">
                            <select name="bday" id="bday">
                                <option value="00">επιλέξτε ημέρα</option>
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                        </select>

                        <select name="bmonth" id="bmonth">
                                <option value="00">επιλέξτε μήνα</option>
                                <option value="01">January</option>
                                <option value="02">February</option>
                                <option value="03">March</option>
                                <option value="04">April</option>
                                <option value="05">May</option>
                                <option value="06">June</option>
                                <option value="07">July</option>
                                <option value="08">August</option>
                                <option value="09">September</option>
                                <option value="10">October</option>
                                <option value="11">November</option>
                                <option value="12">December</option>
                        </select>

                        <select name="byear" id="byear">
                                <option value="00">επιλέξτε έτος</option>
                                <option value="1910">1910</option>
                                <option value="1911">1911</option>
                                <option value="1912">1912</option>
                                <option value="1913">1913</option>
                                <option value="1914">1914</option>
                                <option value="1915">1915</option>
                                <option value="1916">1916</option>
                                <option value="1917">1917</option>
                                <option value="1918">1918</option>
                                <option value="1919">1919</option>
                                <option value="1920">1920</option>
                                <option value="1921">1921</option>
                                <option value="1922">1922</option>
                                <option value="1923">1923</option>
                                <option value="1924">1924</option>
                                <option value="1925">1925</option>
                                <option value="1926">1926</option>
                                <option value="1927">1927</option>
                                <option value="1928">1928</option>
                                <option value="1929">1929</option>
                                <option value="1930">1930</option>
                                <option value="1931">1931</option>
                                <option value="1932">1932</option>
                                <option value="1933">1933</option>
                                <option value="1934">1934</option>
                                <option value="1935">1935</option>
                                <option value="1936">1936</option>
                                <option value="1937">1937</option>
                                <option value="1938">1938</option>
                                <option value="1939">1939</option>
                                <option value="1940">1940</option>
                                <option value="1941">1941</option>
                                <option value="1942">1942</option>
                                <option value="1943">1943</option>
                                <option value="1944">1944</option>
                                <option value="1945">1945</option>
                                <option value="1946">1946</option>
                                <option value="1947">1947</option>
                                <option value="1948">1948</option>
                                <option value="1949">1949</option>
                                <option value="1950">1950</option>
                                <option value="1951">1951</option>
                                <option value="1952">1952</option>
                                <option value="1953">1953</option>
                                <option value="1954">1954</option>
                                <option value="1955">1955</option>
                                <option value="1956">1956</option>
                                <option value="1957">1957</option>
                                <option value="1958">1958</option>
                                <option value="1959">1959</option>
                                <option value="1960">1960</option>
                                <option value="1961">1961</option>
                                <option value="1962">1962</option>
                                <option value="1963">1963</option>
                                <option value="1964">1964</option>
                                <option value="1965">1965</option>
                                <option value="1966">1966</option>
                                <option value="1967">1967</option>
                                <option value="1968">1968</option>
                                <option value="1969">1969</option>
                                <option value="1970">1970</option>
                                <option value="1971">1971</option>
                                <option value="1972">1972</option>
                                <option value="1973">1973</option>
                                <option value="1974">1974</option>
                                <option value="1975">1975</option>
                                <option value="1976">1976</option>
                                <option value="1977">1977</option>
                                <option value="1978">1978</option>
                                <option value="1979">1979</option>
                                <option value="1980">1980</option>
                                <option value="1981">1981</option>
                                <option value="1982">1982</option>
                                <option value="1983">1983</option>
                                <option value="1984">1984</option>
                                <option value="1985">1985</option>
                                <option value="1986">1986</option>
                                <option value="1987">1987</option>
                                <option value="1988">1988</option>
                                <option value="1989">1989</option>
                                <option value="1990">1990</option>
                                <option value="1991">1991</option>
                                <option value="1992">1992</option>
                                <option value="1993">1993</option>
                                <option value="1994">1994</option>
                                <option value="1995">1995</option>
                                <option value="1996">1996</option>
                                <option value="1997">1997</option>
                                <option value="1998">1998</option>
                                <option value="1999">1999</option>
                                <option value="2000">2000</option>
                                <option value="2001">2001</option>
                                <option value="2002">2002</option>
                                <option value="2003">2003</option>
                                <option value="2004">2004</option>
                                <option value="2005">2005</option>
                                <option value="2006">2006</option>
                                <option value="2007">2007</option>
                                <option value="2008">2008</option>
                                <option value="2009">2009</option>
                                <option value="2010">2010</option>
                                <option value="2011">2011</option>
                                <option value="2012">2012</option>
                                <option value="2013">2013</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="rowtitle">Φύλο:</td>
                        <td class="rowinput">
                            <input class="radio" type="radio" name="genderReg" value="1" id="maleRadio">Άνδρας&nbsp;&nbsp;
                            <input class="radio" type="radio" name="genderReg" value="0" id="femaleRadio">Γυναίκα
                        </td>
                    </tr>
                    <tr>
                        <td class="rowtitle">Διεύθυνση Κατοικίας:</td>
                        <td class="rowinput"><input type="text" name="haddReg" id="haddReg"/></td>
                    </tr>
                    <tr>
                        <td class="rowtitle">Διεύθυνση Εργασίας:</td>
                        <td class="rowinput"><input type="text" name="waddReg" id="waddReg"/></td>
                    </tr>
                    <tr>
                        <td class="rowtitle">Οικογενειακή Κατάσταση:</td>
                        <td class="rowinput">
                            <input class="radio" type="radio" name="marriedReg" value="1" id="marriedRadio">παντρεμένος/η&nbsp;&nbsp;
                            <input class="radio" type="radio" name="marriedReg" value="0" id="singleRadio">ελεύθερος/η
                        </td>
                    </tr>
                    <tr>
                        <td class="rowtitle">AFM:</td>
                        <td class="rowinput"><input type="text" name="afmReg" id="afmReg"/></td>
                    </tr>
                    <tr>
                        <td class="rowtitle">Τραπεζικός Λογαριασμό:</td>
                        <td class="rowinput"><input type="text" name="baccReg" id="baccReg"/></td>
                    </tr>
                    <tr><td colspan="2" id="lrSubTD"><button type="submit" name="lrSub" id="lrSub" >Εγγραφή</button></td></tr>
                </tbody>
            </table>
        </form>
    </div>
    <!-- end page -->
    <div id="footer">
        <p class="legal">Copyright (c) 2014 hondafone.gr All rights reserved.</p>
        <p class="credit">Designed by <a href="http://www.nodethirtythree.com/">NodeThirtyThree</a> + <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a></p>
    </div>
    </body>
</html>
