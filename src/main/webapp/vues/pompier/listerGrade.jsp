<%-- 
    Document   : listerGrade
    Created on : 28 mars 2024, 15:04:15
    Author     : ts1sio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Grade"%>
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
    height: 70px;
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

    </style>
    <body>
         <%
            ArrayList<Grade> lesGrades = (ArrayList)request.getAttribute("gLesGrades");
         %>
 
                <div class="main-content">
                    <h1 class="titreentete">Grades</h1>
                    <div class="float">
                        <a class="button" href="/sdisweb/ServletGrade/ajouter" style="display: inline;">+ &nbsp Ajouter<a>
                    </div>
                    <div class="container">
                        <% for (Grade g : lesGrades) { %>
                            <div class="card">
                                <div class="text">
                                    <h1 class="titre"><span class="underline"><%= g.getLibelle() %></span> - <span class="surgrade"><%= g.getUnSurgrade().getLibelle() %></span></h1>
                                    <p class="para"><%= g.getDescription() %></p>
                                    <a href="../ServletGrade/consulter?idGrade=<%= g.getId() %>" class="zmdi zmdi-arrow-forward arrow"></a>
                                </div>
                            </div>
                        <% } %>
                    </div>
                </div>
    </body>
</html>
