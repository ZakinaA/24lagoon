<%-- 
    Document   : listerTypeVehicule
    Created on : 7 avr. 2024, 16:52:28
    Author     : alexi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.TypeVehicule"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="PompierPage.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    <style>
        
.container {
    margin-left: 35px;
    margin-top: 30px;
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start; /* Aligne les cartes à gauche */
}

.card {
    display: flex;
    align-items: flex-start;
    position: relative;
    width: 440px;
    height: 75px;
    margin-right: 20px;
    margin-bottom: 20px;
    padding: 20px;
    background-color: white;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}


.text {
    flex: 1;
    position: relative;
}

.titre {
    font-size: 16px;
    color: #666;
    font-weight: bold;
}

.para {
    margin-top: 10px;
    width: 370px;
    font-size: 14px;
    color: #666;
    font-weight: 400;
}

p {
    margin-top: 5px;
    font-size: 15px;
    color: #666;
}

.titrecarac {
    font-weight: 600;
    font-size: 14px;
}


.arrow {
    color: black;
    text-decoration: none;
    font-size: 25px;
    position: absolute;
    top: 20px;
    right: 10px;
}

.titreentete {
    margin-left: 35px;
    font-weight: 400;
}

.surgrade {
    font-weight: 200;
}

.underline {
    text-decoration: underline;
}

    </style>
    <body>
          <%
            ArrayList<TypeVehicule> lesTypesVehicules = (ArrayList)request.getAttribute("vLesTypesVehicules");
         %>
 
                <div class="main-content">
                    <h1 class="titreentete">Types Véhicules</h1>
                    <div class="container">
                        <% for (TypeVehicule tv : lesTypesVehicules) { %>
                            <div class="card">
                                <div class="text">
                                    <h1 class="titre"><span class="underline"><%= tv.getNom() %></span></h1>
                                    <p class="para"><%= tv.getCaracteristiques() %></p>
                                    <a href="../ServletTypeVehicule/consulter?idTypeVehicule=<%= tv.getId() %>" class="zmdi zmdi-arrow-forward arrow"></a>
                                </div>
                            </div>
                        <% } %>
                    </div>
                </div>
    </body>
</html>