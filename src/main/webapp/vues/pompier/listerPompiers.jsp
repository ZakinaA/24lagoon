<%-- 
    Document   : lister_pompiers.jsp
    Created on : 15 mars 2024, 16:50:49
    Author     : zakina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pompier"%>
<%@page import="model.Caserne"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="PompierPage.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    <style>
    *{
        margin: 0px;
        padding: 0px;
        font-family: sans-serif;
    }

    body{
        display: flex;
        height: 100vh;
    }

    .container{
        z-index:0;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap; 
    }

    .card {
        height: 200px;
        width: 200px; 
        margin: 20px; 
        box-shadow: 5px 5px 20px rgb(0 0 0 / 35%);
        overflow: hidden;
        border-radius: 5px;
        position: relative; 

    }

    .imgpompier {
         height: 200px;
         width: 200px;
         border-radius: 5px;
         transition: all 0.5s; /* Applique la transition à toutes les propriétés */
     }

    .intro {
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        height: 25px;
        width: 100%; 
        padding: 6px;
        box-sizing: border-box;
        position: absolute;
        bottom: 0; 
        left: 0;
        right: 0; 
        background: rgb(94 94 94 / 82%);
        color: white;
    }

    .nom {
        text-align: center;
        font-size: 12px;
        font-weight: 100;
    }

    .card:hover{
        cursor: pointer;
    }

    .imgpompier:hover{      
        transform: scale(1.2);
        transition: .5s;
    }

    @media screen and (max-width: 200px) {
        .card {
            width: calc(100% - 40px); 
            margin: 10px; 
        }
    }
    
    .titre {
        margin-left: 97px;
        font-weight: 100;
        margin-bottom:20px;
    }
    
    .main-content {
        margin-top:20px;
    }
    
    .float {
            position: absolute;
            top: 115px; 
            right: 100px;
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
            ArrayList<Pompier> lesPompiers = (ArrayList) request.getAttribute("pLesPompiers");
        %>

        <div class="main-content">
            <h1 class="titre">Pompiers</h1>
            <div class="float">
                <a class="button" href="../ServletPompier/ajouter" style="display: inline;">+ &nbsp Ajouter<a>
            </div>
            <% if (lesPompiers != null && !lesPompiers.isEmpty()) { %>
                <div class="container">
                    <% for (Pompier p : lesPompiers) { %>
                        <div class="card" onclick="window.location.href='../ServletPompier/consulter?idPompier=<%= p.getId() %>'">
                            <img class="imgpompier" src="https://i.ibb.co/8jL1m1v/inconnu.jpg" alt="photo"/>
                            <div class="intro">
                                <h1 class="nom"><%= p.getNom() %> <%= p.getPrenom() %></h1>
                            </div>
                        </div>
                    <% } %>
                </div>
            <% } else { %>
                <h1>Aucun pompier trouvé</h1>
            <% } %>
        </div>
    </body>
</html>
