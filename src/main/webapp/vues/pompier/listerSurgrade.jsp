<%-- 
    Document   : listerSurgrade
    Created on : 4 avr. 2024, 11:07:25
    Author     : ts1sio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Surgrade"%>
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
    margin-top: 50px;
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start; /* Aligne les cartes à gauche */
}

.card {
    display: flex;
    align-items: flex-start;
    position: relative;
    width: 240px;
    height: 150px;
    margin-right: 20px;
    margin-bottom: 20px;
    padding: 20px;
    background-color: white;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}


.text {
    margin-top: 10px;
    text-align: center;
    flex: 1;
    position: relative;
}

.titre {
    margin-top:25px;
    font-size: 18px;
    color: #666;
    font-weight: 400;
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

.zmdi-view-dashboard {
    font-size: 70px;
}
    </style>
    <body>
          <%
                ArrayList<Surgrade> lesSurgrades = (ArrayList)request.getAttribute("pLesSurgrades");
            %>
                <div class="main-content">
                    <h1 class="titreentete">Surgrades</h1>
                    <div class="float">
                        <a class="button" href="/sdisweb/ServletSurgrade/ajouter" style="display: inline;">+ &nbsp Ajouter<a>
                    </div>
                    <div class="container">
                        <% for (Surgrade s : lesSurgrades) { %>
                            <div class="card">
                                <div class="text">
                                    <i class="zmdi zmdi-view-dashboard"></i>
                                    <h1 class="titre"><%= s.getLibelle() %></h1>
                                </div>
                            </div>
                        <% } %>
                    </div>
                </div>
    </body>
</html>

