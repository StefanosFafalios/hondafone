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
<title>Hondafone Νέα</title>
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
        <li><a href="news.jsp" accesskey="2" title="News">Nέα</a></li>
        <li><a href="aboutUs.jsp" accesskey="3" title="About Us">Σχετικά με εμάς</a></li>
        <li class="afterlogin" style="display: none;"><a href="myaccounts.jsp" accesskey="4" title="My Accounts">Οι λογαριασμοί μου</a></li>
    </ul>
    <div id="logreg">
        <a href="login.jsp">Είσοδος</a> &nbsp;|&nbsp; <a href="register.jsp">Εγγραφή</a>
    </div>
</div>
<hr />
<div id="banner"><img src="../images/img04.jpg" alt="" width="960" /></div>
<!-- start page -->
<div id="page">
    <div class="post">
        <h2 class="title">Hondafone 2every1</h2>
        <div class="entry">
            <h3>Νέα προγράμματα συμβολαίου Hondafone που απελευθερώνουν την επικοινωνία προς όλα τα δίκτυα!</h3>
            <p>Τα νέα προγράμματα Hondafone προσφέρουν ακόμα περισσότερα λεπτά ομιλίας προς όλα τα δίκτυα για να μιλάς ξέγνοιαστα και περισσότερα SMS</p>

            <p>2every1 200: 35&euro;, 200' προς όλα τα δίκτυα, 10 SMS προς όλους</br>
                2every1 400: 55&euro;, 400' προς όλα τα δίκτυα, 30 SMS προς όλους</p>
        </div>
        <p class="meta">Posted on January 17, 2014 </p>
    </div>
    <div class="post">
        <h2 class="title">Hondafone φιλανθρωπία</h2>
        <div class="entry">
            <h3>Σώζουμε τους δράκους της Μέσης Γης!</h3>
            <p>Η HONDAFONE συνεχίζει να είναι έμπρακτα ενάντια στη εξαφάνιση των δράκων από τη Μέση Γή. Μπορείτε και εσείς να βοηθήσετε με δωρεές σε κάθε κατάστημα HONDAFONE. Για περισσότερες πληροφορίες κάντε εγγραφή στο mail service μας και θα σας ενημερώσουμε ηλεκτρονικά με email</p>
        </div>
        <p class="meta">Posted on January 17, 2014 </p>
    </div>
    <div class="post">
        <h2 class="title">Hondafone μιχανή-κινητό</h2>
        <div class="entry">
            <h3>Κάνε δικό σου ένα από τα ολοκαίνουργια μοντέλα μηχανές-κινητά!</h3>
            <p>Αγόρασε πρώτος τη νέα λέξη της τεχνολογίας Hondafone μηχανή-κινητό με όποιο μοντέλο Honda&reg; και ενσωματωμένα ηλεκτρονικά για ομιλία κατά την οδήγηση χωρίς ενοχλήσεις με τιμές από 700&euro;</p>
        </div>
        <p class="meta">Posted on January 17, 2014 </p>
    </div>
    <div class="post">
        <h2 class="title">Hondafone δώρα</h2>
        <div class="entry">
            <h3>Μετάφερε τον αριθμό σου στην HONDAFONE και κέρδισε!</h3>
            <p>
Έλα στην HONDAFONE, με μεταφορά του αριθμού σου (φορητότητα) ή νέα σύνδεση online και κέρδισε:   
</p>

            <p>&nbsp;&nbsp;&nbsp;έως 50% έκπτωση στο πάγιο</br>

            ή εναλλακτικά</br>

    &nbsp;&nbsp;&nbsp;έως 20% έκπτωση σε μια πρωτοπορειακή μηχανή-κινητό από τη συλλογή HONDAFONE SCOOTERS</p>
        </div>
        <p class="meta">Posted on January 17, 2014 </p>
    </div>
    <div class="post">
        <h2 class="title">HONDAFONE + Intenet</h2>
        <div class="entry">
            <h3>Απόλαυσε υπηρεσίες internet στα ταξίδια σου!</h3>
            <p>Έλα σε ένα κατάστημα HONDAFONE και προμηθεύσου κεραία για 3G internet ώστε να σερφάρεις ανενόχλητος ακόμα και στα ταξίδια σου με μηχανές-κινητά απεριόριστα μόνο με 25&euro;/μήνα. Η κεραία είναι συμβατή με όλα τα μοντέλα μηχανών-κινητών</p>
        </div>
        <p class="meta">Posted on January 17, 2014 </p>
    </div>
</div>
<!-- end page -->
<div id="footer">
    <p class="legal">Copyright (c) 2014 hondafone.gr All rights reserved.</p>
    <p class="credit">Designed by <a href="http://www.nodethirtythree.com/">NodeThirtyThree</a> + <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a></p>
</div>
</body>
</html>


