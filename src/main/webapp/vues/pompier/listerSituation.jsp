<%-- 
    Document   : listerSituation
    Created on : 6 avr. 2024, 20:01:08
    Author     : Minh-Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Situation"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="PompierPage.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    <body>
        
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
        height: 190px;
        margin-right: 20px;
        margin-bottom: 20px;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        background-color: white;
        position: relative;
    }

    .text {
        width: 400px ;
        right: 44px;
        text-align: center;
        top: 20px;
        flex: 1;
        position: absolute;
    }

    .titrecard {
        font-size: 16px;
        font-weight: bold;
    }

    .sous-titre {
        margin-bottom: 35px;
        margin-top: 20px;
        font-size: 14px;
        color: #666;
        font-weight: 400;
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
   
    h1 {
        font-weight: 400;
    }

</style>
<div class="main-content">
      <h1>Situations</h1>
         <%
            ArrayList<Situation> lesSituations = (ArrayList)request.getAttribute("sLesSituations");
         %>
         <div class="container">
                    <%
                    for (Situation s : lesSituations)
                    {              
                    %>
                        <div class="card">
                            <div class="text">
                                <h1 class="titrecard"><%= s.getLibelle() %></h1>
                                <p class="sous-titre"><%= s.getDescription() %></p>
                                <a href="/sdisweb/ServletSituation/consulter?idSituation=<%= s.getId() %>" class="button">Voir les interventions</a>
                            </div>
                        </div>
                    <%
                    }
                    %>
         </div>
    
</div>
      

   </body>
</html>