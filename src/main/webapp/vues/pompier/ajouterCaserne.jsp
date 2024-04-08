<%-- 
    Document   : ajouterCaserne
    Created on : 8 avr. 2024, 00:19:40
    Author     : alexi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Caserne"%>
<%@page import="form.FormCaserne"%>
<%@page import="model.Pompier"%>
<%@page import="model.Intervention"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    <body>
        <h1>NOUVEAU CASERNE</h1>
        
            <%
                FormCaserne form = (FormCaserne)request.getAttribute("form");
            %>
        
        <form class="form-inline" action="ajouter" method="POST">
              
                <label for="nom">NOM : </label>
                <input id="nom" type="text" name="nom"  size="30" maxlength="30">
                </br>
                
                <label for="rue">RUE : </label>
                <input id="rue"  type="text"  name="rue" size="30" maxlength="30">      
                 </br>
                 
                 <label for="copos">CODE POSTAL : </label>
                 <input id="copos" type="number" name="copos" pattern="[0-9]{1,2,3,4,5}">
                 </br>
                 
                <label for="ville"> VILLE : </label>
                <input id="ville" type="text" name="ville" >
                 </br>
                 
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>

    </body>
</html>