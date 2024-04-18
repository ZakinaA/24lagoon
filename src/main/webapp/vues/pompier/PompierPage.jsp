<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pompier"%>
<%@ page import="database.ConnexionBdd" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mini Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
</head>

<style>    
    body {
    margin: 0;
    padding: 0;
    font-family: "Poppinss", sans-serif;
    background-color: rgba(89, 83, 83, 0.138);
    font-family: "Poppins", sans-serif;
}

nav {
    margin-top: 50px;
}

.sidebar {
    width: 260px;
    height: 100vh;
    background-color: white;
    color: #fff;
    position: fixed;
    top: 0;
    left: 0;
    padding: 20px;
}

.logo {
    margin-left: -20px;
    margin-top: -20px;
    position: absolute;
    width: 300px;
    height: 80px;
    background-color: #f5f5f5;
    text-align: center;
    box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.121);
}

.sidebar nav ul {
    list-style: none;
    padding: 0;
    margin: 0;
    margin-left: -60px;
}

.sidebar nav ul li {
    padding-top: 20px;
    padding-bottom: 20px;
    width: 300px;
    height: 25px;
    position: relative; 
}

.sidebar nav ul li a {
    display: flex; 
    align-items: center; 
    position: absolute; 
    top: 0;
    left: 0; 
    height: 100%; 
    margin-left: 100px;
    text-decoration: none;
    color: #555;
}

.sidebar nav ul li a:hover {
    color: #3d63b7;
    transition: .4s;
}

.sidebar nav ul li a.active {
    color: #4272d7;
}

.topbar {
        z-index:1;
    border-left: 1px solid rgba(0, 0, 0, 0.09);
    box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.121);
    width: calc(100% - 250px);
    height: 40px;
    background-color: #f5f5f5;
    color: #fff;
    position: fixed;
    top: 0;
    right: 0;
    left: 300px;
    padding: 20px;
}

.main-content {
    padding-top: 80px;
    padding-left: 300px;
    min-height: 100vh;
}

.navcontent {
    margin-top: 60px;
    height: 100%;
    left: 0;
    position: absolute;
    width: 300px;
}

.account-wrap {
    margin-top: -55px;
    margin-right: 90px;
    float: right;
    position: relative;
}

.account-item {
    cursor: pointer;
}

.account-item .image {
    width: 45px;
    height: 45px;
    float: left;
    overflow: hidden;
    border-radius: 3px;
}

.account-item .image img {
    width: 100%;
}

.account-item .content {
    padding: 14px 0;
    padding-left: 65px;
}

.account-item .content a {
    color: #333;
    text-transform: capitalize;
    font-weight: 500;
    text-decoration: none;
}

.account-item .content a:after {
    font-family: "Material-Design-Iconic-Font";
    font-weight: 500;
    content: '\f2f9';
    display: inline-block;
    font-size: 16px;
    margin-left: 10px; /* Ajuster la marge pour coller l'icône à droite */
}

.sub-menu {
    margin-left: -100px;
    width: 400px;
    display: none;
    position: absolute;
    top: 130%;
    left: 0;
    background-color: #fff;
    box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.2);
    text-align: left;
}

.sub-menu.show {
    display: block;
}

.sub-menu ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.sub-menu ul li {
    display: flex;
    align-items: center;
    margin-top: 20px;
    width: 100%; 
    position: relative; /* Ajoutez une position relative */
}

.sub-menu ul li .link-container {
    display: flex;
    align-items: center;
    justify-content: space-between; /* Pour étendre le contenu sur toute la largeur */
    width: 100%; /* Ajustez la largeur pour occuper toute la largeur */
}

.sub-menu ul li .link-container a {
    flex-grow: 1;
    font-size: 14px;
    padding: 13px 20px;
    text-decoration: none;
    color: #555;
}

.sub-menu ul li .link-container:hover {
    background-color: #425d97;
}

.sub-menu ul li .link-container:hover a {
    color: white;
}

.sub-menu ul li .link-container:hover i.zmdi {
    color: white; /* Couleur de l'icône au survol */
}

.sub-menu ul li .link-container i.zmdi {
    margin-left: 10px;
    margin-right: -10px; /* Ajuster la marge à droite de l'icône */
    color: #333;
}

.bordure {
    border-top: 1px solid #e0e0e074;
}

.logo img {
    margin-top: -25px;
    max-width: 170%;
    max-height: 170%;
    object-fit: contain;
}

.zmdi-fire {
    margin-right: 10px;
}

.zmdi-car {
    margin-right: 10px;
}

.zmdi-directions {
    margin-right: 10px;
}

.zmdi-face {
    margin-right: 10px;
}

.zmdi-graduation-cap {
    margin-right: 10px;
}

.zmdi-home {
    margin-right: 10px;
}

.zmdi-info {
    margin-right: 10px;
}

.zmdi-wrench {
    margin-right: 10px;
}

.zmdi-toll {
    margin-right: 10px;
}


.textbot {
    color: #555;
    font-size: 12px;
    text-decoration:none;
    position:absolute;
    bottom: 50px; 
    left: 70px;
}

.textbot:hover {
    text-decoration: underline;
}
</style>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var subMenu = document.getElementById("subMenu");
        var accountWrap = document.querySelector(".account-wrap");

        // Fonction pour basculer l'affichage du sous-menu
        function toggleSubMenu() {
            subMenu.classList.toggle("show");
        }
        
        accountWrap.addEventListener("click", function(event){
            event.stopPropagation();
            toggleSubMenu();
        });

        // Ajouter un écouteur d'événements pour fermer le sous-menu en cliquant à l'extérieur
        document.addEventListener("click", function(event) {
            if (!accountWrap.contains(event.target)) {
                subMenu.classList.remove("show");
            }
        });
    });
</script>

<body>
    <%
        String email = (String) session.getAttribute("utilisateurConnecte");
        String nomPrenomPompier = ConnexionBdd.recuperNomPrenom(email);
    %>
    <div class="sidebar">
        <div class="logo">
            <img src="https://i.ibb.co/XLJcLBh/Logo.png" alt="logo"/>
        </div>
        <div class="navcontent">
            <nav>
                <ul>
                    <li><a href="../ServletPompier/lister"><i class="zmdi zmdi-fire" style="font-size: 22px;"></i>Pompiers</a></li>
                    <li><a href="../ServletVehicule/lister"><i class="zmdi zmdi-car" style="font-size: 22px;"></i>Véhicules</span></a></li>
                    <li><a href="../ServletSituation/lister"><i class="zmdi zmdi-directions" style="font-size: 22px;"></i>Situations</a></li>
                    <li><a href="../ServletIntervention/lister"><i class="zmdi zmdi-face" style="font-size: 22px;"></i>Interventions</a></li>
                    <li><a href="../ServletGrade/lister"><i class="zmdi zmdi-graduation-cap" style="font-size: 22px;"></i>Grade</a></li>
                    <li><a href="../ServletCaserne/lister"><i class="zmdi zmdi-home" style="font-size: 22px;"></i>Caserne</a></li>
                    <li><a href="../ServletFonction/lister"><i class="zmdi zmdi-info" style="font-size: 22px;"></i>Fonction</a></li>
                    <li><a href="../ServletTypeVehicule/lister"><i class="zmdi zmdi-wrench" style="font-size: 22px;"></i>Type Véhicule</a></li>
                    <li><a href="../ServletSurgrade/lister"><i class="zmdi zmdi-toll" style="font-size: 22px;"></i>Surgrade</a></li>
                </ul>
            </nav>
        </div>
        <a href="#" class="textbot">Politique de confidentialité</a>
    </div>
    <div class="topbar">
        <nav>
            <div class="account-wrap" onclick="toggleSubMenu()">
                <div class="account-item">
                    <div class="image">
                        <img src="https://i.ibb.co/8jL1m1v/inconnu.jpg" alt="John Doe" />
                    </div>
                    <div class="content">
                        <a><%= nomPrenomPompier %></a>
                    </div>
                </div>
                <div class="sub-menu" id="subMenu">
                    <ul>
                        <li>
                            <div class="link-container">
                                <i class="zmdi zmdi-account"></i>
                                <a href="#">Information</a>
                            </div>
                        </li>
                        <li class="bordure">
                            <div class="link-container">
                                <i class="zmdi zmdi-power"></i>
                                <a href="${pageContext.request.contextPath}/logout">Déconnecter</a>
                            </div>
                        </li>             
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</body>
</html>
