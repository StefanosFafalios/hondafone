<jsp:useBean id="sessionInfo" class="misc.SessionInfo" scope="session" />
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
<title>About Hondafone</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<script src="../jquery-1.10.2.min.js"></script>
<link href="../style.css" rel="stylesheet" type="text/css" media="screen" />
<script>
    $(document).ready(function() {
        if(<%= !sessionInfo.getClientInfo().isEmpty() %>) {
            $(".afterlogin").css("display", "inline");
            $("#logreg").html('<a id="profile_name"><%= !sessionInfo.getClientInfo().isEmpty() ? sessionInfo.getClientInfo().get(0) : "" %></a><div id="profile_details"><% 
                    if(!sessionInfo.getClientInfo().isEmpty()) { //check is needed again because this code is executed in the server
                        out.print("Όνομα χρήστη: " + sessionInfo.getClientInfo().get(0));
                        out.print("</br>Όνομα: " + sessionInfo.getClientInfo().get(2));
                        out.print("</br>Επίθετο: " + sessionInfo.getClientInfo().get(3));
                        out.print("</br>Ημερομηνία γένησης: " + sessionInfo.getClientInfo().get(4));
                        out.print("</br>ΑΦΜ: " + sessionInfo.getClientInfo().get(9));
                        out.print("</br>Τραπεζικός λογαριασμός: " + sessionInfo.getClientInfo().get(10));
                    }
                %></div> | <a href="logout.jsp">Έξοδος</a>');
        }
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
<hr />
<!-- start page -->
<div id="page">
    <div class="post">
        <h2 class="title">Μάθετε για εμάς</h2>
        <div class="entry">
            <h3>Σχετικά με την εταιρία μας</h3>
            <p>Η εταιρία Hondafone, ιδρύθηκε το 2014 από τους : Γ. Βασάλο, Σ. Φαφαλιό και Κ. Δρακωνάκη.   Είναι μια εταιρία κινήτης τηλεφωνίας η οποία ασχολείται κυρίως και με την μαζική παραγωγή και προμήθευση της πρωτοπορειακής εφεύρεσης "Μηχανή-κινητό".</p>
            <p><i>Δραστηριότητες</i> :</br>
            Υποστηρίζoυμε οικονομικά μη κερδοσκοπικές οργανώσεις όπως : "Save the dragons of middle earth : Stop the killing", "Anomimous", " Hunt down the unicorns"κ.α.</br>
Επίσης έχουμε υποστηρίξει μη κυβερνητικές δραστήριότητες όπως  :"Free Obama bin Landen"  η οποία απέτυχε και την  επιτυχημένη "Kill The Kennedys".</br>
    Επιπλέων η Hondafone είναι ο ιδρυτής της Ελληνικής μη κερδοσκοπικής οργάνωσης Μ.Κ.Ο.(ΜΠΙΖΝΕΣ ΚΑΛΑ ΟΡΓΑΝΩΜΕΝΗ).
    Για περισσότερες πληροφορείες όσων αφορά τις δραστηριότητες επικοινωνίστε μαζί μας στο : 2310-52-1010. Όλο το εικοστετράωρο</p>
            <p><i>Που θα μας βρείτε (Καταστήματα)</i> :</br>
            Κτήριο πληροφορικής εργαστήριο 2ου ορόφου 11:00 - 20:00. Διεύθυνση: Ομήρου 9, Ταύρος</br></br>
            
     Shisha coffee 21:00 - 07:00. Διεύθυνση: Πλατέια Nέας Σμύρνης</br></br>
     
     Κυλικείο Χαροκοπείου Πανεπιστημίου 12:00 - 16:00. Διεύθυνση: Θησέως(Ελ. Βενιζέλου) 70, Καλλιθέα</br></br>

     Υποκατάστημα Ομόνοιας 13:00 - 19:00. Διεύθυνση: Πανεπιστημίου 128, Ομόνοια </br></br>
</p>
            <p><i>Επικοινωνία</i> :</br>
            email : hondafonedist@gmail.com</br>
τηλέφωνο : 699-102-100-3α</br>
    Ώρες επικοινωνίας : 03:00-06:30</p>
        </div>
        <p class="meta">Αν θες να ενημερώνεσαι για τα νέα της Hondafone κάνε <a href="newsletterReg.jsp">εγγραφή</a> στο newsletter μας!</p>
    </div>
</div>
<!-- end page -->
<div id="footer">
    <p class="legal">Copyright (c) 2014 hondafone.gr All rights reserved.</p>
    <p class="credit">Designed by <a href="http://www.nodethirtythree.com/">NodeThirtyThree</a> + <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a></p>
</div>
</body>
</html>


