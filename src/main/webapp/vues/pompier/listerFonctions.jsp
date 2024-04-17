<%-- 
    Document   : listerFonctions
    Created on : 28 mars 2024, 13:10:27
    Author     : ts1sio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Fonction"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="PompierPage.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    <body>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>APPLICATION DE GESTION SDIS CALVADOS</title>
    </head>
    
        <style>
        
.container {
    margin-left: 35px;
    margin-top: 50px;
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start; /* Aligne les cartes à gauche */
}

.card {
    display: flex;
    align-items: flex-start;
    position: relative;
    width: 440px;
    height: 50px;
    margin-right: 20px;
    margin-bottom: 20px;
    padding: 20px;
    background-color: white;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}


.text {
    margin-top:5px;
    margin-left: 70px;
    flex: 1;
    position: relative;
}

.titre {
    font-size: 16px;
    color: #666;
    font-weight: bold;
}

p {
    margin-top: 5px;
    font-size: 15px;
    color: #666;
}


.arrow {
    color: black;
    text-decoration: none;
    font-size: 25px;
    position: absolute;
    top: 7px;
    right: 0px;
}

.titreentete {
    margin-left: 35px;
    font-weight: 400;
}


.underline {
    font-weight: 400;
}

.float {
    position: absolute;
    top: 115px; 
    right: 85px;
        }

.button {
    padding: 10px 20px;
    cursor: pointer;
    font-size: 15px;
    border-radius: 4px;
    border: none;
    background-color: #425d97;
    color: white;
    text-decoration: none;
}

.zmdi-tag-more {
    margin-top: -3px;
    margin-left: -70px;
    color: #3f3d3d;
    position: absolute;
    font-size: 50px;
}
    </style>
    <body>
         <%
            ArrayList<Fonction> lesFonctions = (ArrayList)request.getAttribute("fLesFonctions");
         %>
 
                <div class="main-content">
                    <h1 class="titreentete">Fonctions</h1>
                    <div class="float">
                        <a class="button" href="/sdisweb/ServletFonction/ajouter" style="display: inline;">+ &nbsp Ajouter<a>
                    </div>
                    <div class="container">
                        <% for (Fonction f : lesFonctions) { %>
                            <div class="card">
                                <div class="text">
                                    <i class="zmdi zmdi-tag-more"></i>
                                    <h1 class="titre"><span class="underline"><%= f.getLibelle() %></span></h1>
                                    <a href="../ServletFonction/consulter?idFonction=<%= f.getId() %>" class="zmdi zmdi-arrow-forward arrow"></a>
                                </div>
                            </div>
                        <% } %>
                    </div>
                </div>
    </body>
</html>
