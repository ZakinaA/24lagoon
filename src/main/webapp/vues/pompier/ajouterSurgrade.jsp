<%-- 
    Document   : ajouterSurgrade
    Created on : 8 avr. 2024, 22:48:08
    Author     : alexi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="form.FormSurgrade"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    <body>
        <h1>NOUVELLE FONCTION</h1>
        
            <%
                FormSurgrade form = (FormSurgrade)request.getAttribute("form");
            %>
        
        <form class="form-inline" action="ajouter" method="POST">
              
                <label for="libelle">Libelle : </label>
                <input id="libelle" type="text" name="libelle"  size="30" maxlength="30">
                </br>
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>

    </body>
</html>