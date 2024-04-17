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
            
            a {
                font-weight: 250;


            }
        body {
            overflow-y: hidden;
        }

        .main-content {
            margin-top: -80px;
            display: flex;
            justify-content: center; 
            align-items: center; 
        }

        .card {
            color: #4c4c4c;
            font-family: "Poppinss", sans-serif;
            font-family: "Poppins", sans-serif;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1) ;
            border-radius: 5px;
            height: 380px;
            width: 790px;
            background-color: white;
            padding: 10px;
            display: flex;
          }

          .profile-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin-right: 10px;
            margin-top: 10px;
            margin-left: 10px;
          }

          .gauche {
            margin-top: 130px;
            margin-left: -110px;
          }

          .para {
            width: 310px;
            font-size: 18px;
            font-weight: 300;
        }

        .droite {
            margin-left: 60px;
            font-weight: 300;
        }

        .contenu {
            margin-bottom: 20px;
            width: 380px;
            border: 1px solid black;
            padding: 10px;
        }

        .border {
            padding-top:2px;
            padding-bottom: 2px;
            border: 1px solid black;
            padding-left: 4px;
            padding-right: 4px;
        }

        .logodroite {
            margin-top: 290px;
            width: 250px;
            position: absolute;
            margin-left: 640px;
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
    <div class="card">
        <img src="https://i.ibb.co/b6q44p2/inconnu.jpg" alt="Profile picture" class="profile-image">
        <div class="gauche">
            <p class="para">Nom : &nbsp;<span class="border" style="font-size: 16px;"><%  out.println(p.getNom());%></spanph1>
            <p class="para">Prénom : &nbsp;<span class="border" style="font-size: 16px;"><%  out.println(p.getPrenom());%></span></p>
            <p class="para">Date de naissance : &nbsp;<span class="border" style="font-size: 16px;"><%  out.println(p.getDateNaiss());%></span></p>
            <p class="para">Grade : &nbsp;<span class="border" style="font-size: 16px;"><%  out.println(p.getUnGrade().getLibelle());%></span></p>
            <p class="para">Caserne : &nbsp;<span class="border" style="font-size: 16px;"><%  out.println(p.getUneCaserne().getNom());%></span></p>
            <p class="para">Numéro de Bip : &nbsp;<span class="border" style="font-size: 16px;"><%  out.println(p.getBip());%></span></p>
        </div>
        <div class="droite">
            <h1 class="para">Fonctions :</h1>
            <div class="fonctions contenu">
                <% if (lesFonctions != null && !lesFonctions.isEmpty()) { %>
                    <% for (Fonction f : lesFonctions) { %>
                        <span ><%= f.getLibelle() %></span>
                        <br>
                    <% } %>
                <% } else { %>
                    <span> Aucune fonction trouvée</span><br>
                <% } %>
            </div>
            <h1 class="para">Interventions :</h1>
            <div class="interventions contenu">
                <% if (lesInterventions != null && !lesInterventions.isEmpty()) { %>
                    <% for (Intervention i : lesInterventions) { %>
                        <span> <%= i.getLieu() %>&nbsp; |
                            <%= i.getDate() %>&nbsp; |
                            <%= i.getHeureAppel() %>&nbsp; |
                            <%= i.getHeureArrivee() %>&nbsp; |
                            <%= i.getDuree() %></span>
                            <br>
                    <% } %>
                <% } else { %>
                    <span>Aucune intervention trouvée</span>
                <% } %>
            </div>
        </div>
        <img src="https://i.ibb.co/gFzgDjQ/LOGOOO.png" class="logodroite">
    </div>
</div>

</body>
</html>
