<%-- 
    Document   : listerVehicule
    Created on : 31 mars 2024, 17:06:45
    Author     : alexi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Vehicule"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="PompierPage.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
<style>
        body{
            display: inline-flex;
            height: 100vh;
            padding: 20px; /* Espacement autour du contenu */
        }

        .main-content {
            margin-top: -20px;
            margin-left:15px;
        }
        
        .container {
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
            height: 200px;
            margin-right: 20px;
            margin-bottom: 20px;
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .image {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            overflow: hidden;
            margin-right: 20px;
        }

        .image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .text {
            margin-top: -5px;
            flex: 1;
            position: relative;
        }

        .titrecard {
            font-weight: bold;
            font-size: 15px;
        }

        .sous-titre {
            margin-top: -5px;
            font-size: 14px;
            color: #666;
            font-weight: 200;
        }

        p {
            margin-top: 5px;
            font-size: 15px;
            color: #666;
        }

        .titrecarac {
            font-weight: bold;
            font-size: 14px;
        }

        .paragraphe {
            margin-left: -55px;
            margin-top: 18px;
        }

        .date {
            font-size: 15px;
        }

        .paraend {
            margin-top: 28px;
            margin-left: -55px;
            display: flex;
            align-items: center;
        }

        .monter {
            margin-top: 17px;
        }

        .blue {
            font-weight: 100;
            text-decoration: underline;
            color: #4272d7;
        }

        .green {
            font-weight: 100;
            text-decoration: underline;
            color: green;
        }

        .arrow {
            color: black;
            text-decoration: none;
            font-size: 25px;
            position: absolute;
            top: 0px;
            right: 10px;
        }
        h1 {
            font-weight: 100;
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
        <div class="main-content">
            
         <%
            ArrayList<Vehicule> lesVehicules = (ArrayList)request.getAttribute("vLesVehicules");
         %>
         
            <h1>Véhicules</h1>
            <div class="float">
                <a class="button" href="/sdisweb/ServletVehicule/ajouter" style="display: inline;">+ &nbsp Ajouter<a>
            </div>
            <div class="container">
                <% for (Vehicule v : lesVehicules) { %>
                <div class="card">
                    <div class="image">
                        <img src="https://i.ibb.co/8jL1m1v/inconnu.jpg" alt="Image 1">
                    </div>
                    <div class="text">
                        <h1 class="titrecard"><%= v.getImmatriculation() %></h1>
                        <h2 class="sous-titre"><%= v.getTypeVehicule().getNom() %></h2>
                        <div class="paragraphe">
                            <h1 class="titrecarac">Caractéristiques</h1>
                            <p><%= v.getTypeVehicule().getCaracteristiques() %></p>
                        </div>
                        <div class="paraend">
                            <h1 class="date"><span class="blue">Date Origine</span> :</h1>
                            <p class="monter">&nbsp;<%= v.getDateOrigine() %></p>&nbsp;&nbsp;&nbsp;&nbsp;
                            <h1 class="date"><span class="green">Date Revision</span> :</h1>
                            <p class="monter">&nbsp;<%= v.getDateRevision() %></p>
                        </div>
                        <a href="/sdisweb/ServletVehicule/consulter?idVehicule=<%= v.getId() %>" class="zmdi zmdi-arrow-forward arrow"></a>
                    </div>
                </div>
                <% } %>
            </div>
        </div>

    </body>
</html>