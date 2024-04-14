<%-- 
    Document   : consulterPompier
    Created on : 18 mars 2024, 12:03:07
    Author     : zakina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pompier"%>
<%@page import="model.Fonction"%>
<%@page import="model.Intervention"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="PompierPage.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SDIS WEB</title>
    <style>
        body {
            overflow-y: hidden;
        }

        .card {
            position: relative;
            height: 600px;
            width: 510px;
            margin: 90px auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgb(0 0 0 / 11%);
            padding: 20px;
            text-align: left; 
            background-color:white;
            background-size: cover;
            z-index: -1;
        }

        .profile-img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            margin: 0 auto 10px;
            display: block;
        }
        .info {
            font-weight: 300;
            margin-top: 40px;
            margin-left: 30px;
            font-size: 14px;
        }
        .info .gras {
            font-weight: 600;
            display: inline-block;
            width: 120px;
        }
        .info-list {
            margin-left: 30px;
            display: inline-block;
            vertical-align: top; 
        }
        .titre {
            font-weight:500;
            font-size: 17px;
            text-align: center;
        }        

        #arrow {
            text-decoration: none;
            color: black;
            position: absolute;
            font-size: 25px;
            margin-left: 20px;
            margin-top: 20px;
        }
        
        .red {
            font-weight: 100;
            color: red;
        }
       
        .noir {
            font-weight: 100;
            text-decoration: underline;
        }
        
        .green {
            font-weight: 100;
            color: green;
            text-decoration: underline;
        }
    </style>
</head>
<body>

<%
    ArrayList<Fonction> lesFonctions = (ArrayList)request.getAttribute("pLesFonctions");
%>

<%
    ArrayList<Intervention> lesInterventions = (ArrayList)request.getAttribute("pLesInterventions");
%>

<%
    Pompier p = (Pompier)request.getAttribute("pPompier");
%>

<div class="main-content">
    <a href="/sdisweb/ServletPompier/lister" class="zmdi zmdi-arrow-back" id="arrow"></a>
    <div class="card">
        <img src="https://i.ibb.co/8jL1m1v/inconnu.jpg" alt="Photo de profil" class="profile-img">
        <h1 class="titre"><%  out.println(p.getPrenom());%>  <%  out.println(p.getNom());%></h1>
        <div class="info">
            <span class="gras">N° Bip</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%  out.println(p.getBip());%><br>
            <br>
            <span class="gras">Caserne</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="red"><%  out.println(p.getUneCaserne().getNom());%></span><br>
            <br>
            <span class="gras">Grade</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%  out.println(p.getUnGrade().getLibelle());%><br>
            <br>
            <span class="gras">Date Naissance</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="green"><%  out.println(p.getDateNaiss());%></span><br>
            <br>
            <span class="gras">Indice</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%  out.println(p.getIndice());%><br>
            <br>
            <br>
            <br>

            <span class="gras">Fonctions</span>
            <div class="info-list">
                <% if (lesFonctions != null && !lesFonctions.isEmpty()) { %>
                    <% for (Fonction f : lesFonctions) { %>
                    <span class="noir"> <%= f.getLibelle() %></span><br><br>
                    <% } %>
                <% } else { %>
                    Aucune fonction trouvée<br>
                <% } %>
            </div>
            <br>
            <br>
            <br>

            <span class="gras">Interventions</span>
            <div class="info-list">
                <% if (lesInterventions != null && !lesInterventions.isEmpty()) { %>
                    <% for (Intervention i : lesInterventions) { %>
                        <%= i.getLieu() %>&nbsp; |
                        <%= i.getDate() %>&nbsp; |
                        <%= i.getHeureAppel() %>&nbsp; |
                        <%= i.getHeureArrivee() %>&nbsp; |
                        <%= i.getDuree() %><br><br>
                    <% } %>
                <% } else { %>
                    Aucune intervention trouvée<br>
                <% } %>
            </div>
        </div>
    </div>
</div>
</body>
</html>
