<%-- 
    Document   : ajouterFonction
    Created on : 8 avr. 2024, 17:20:08
    Author     : alexi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="form.FormFonction"%>
<%@ include file="PompierPage.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    <body>
        <style>
        body {
    overflow-y: hidden;
}
    
.custom-form {
    height: 170px;
    top: 100px;
    background-color: white;
    width: 600px; 
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 10px;
    position: relative; 

}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    font-size: 17px;
    display: block;
    margin-bottom: 10px;
}

.form-control {
    width: 100%; 
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    box-sizing: border-box;
}

.btn {
    margin-top: 20px;
    padding: 13px 0; 
    background-color: #425d97;
    color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    width: 100%;
}

.card-header {
    width: 94%;
    padding: .75rem 1.25rem;
    background-color: rgba(0, 0, 0, .03);
    border-bottom: 1px solid rgba(0, 0, 0, .125);
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    position: absolute;
    top: 0;
    left: 0;
    margin: 0;
}

.deplacement {
    margin-top: 40px;
}

#immatriculation {
    text-transform: uppercase;
}

input {
    margin-bottom: 10px;
    margin-top: 10px;
}

    </style>
            <%
                FormFonction form = (FormFonction)request.getAttribute("form");
            %>
        
            <div class="main-content">
               <div class="custom-form">
                <form class="form-inline" action="ajouter" method="POST">
                    <div class="card-header">Fonction</div>
                    <div class="deplacement">
                        <label for="libelle">Libelle : </label>
                        <input id="libelle" type="text" name="libelle" size="30" maxlength="30" class="form-control">
                        <br>
                        <input type="submit" name="valider" id="valider" value="Valider" class="btn">
                    </div>
                </form>
                </div>
                </div>
    </body>
</html>