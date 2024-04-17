<%-- 
    Document   : ajouterPompier
    Created on : 18 mars 2024, 13:30:47
    Author     : zakina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Caserne"%>
<%@page import="model.Grade"%>
<%@page import="form.FormPompier"%>
<%@ include file="PompierPage.jsp" %>

<!DOCTYPE html>
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
    height: 600px;
    top: 50px;
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
    margin-top: 10px;
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
    margin-top: 50px;
}

#nom {
    text-transform: uppercase;
}

</style>
            <%
                FormPompier form = (FormPompier)request.getAttribute("form");
            %>
  
        <div class="main-content">
        <form class="custom-form" action="ajouter" method="POST">
            <div class="card-header">Pompier</div>
            <div class="deplacement">
                <div class="form-group">
                    <label for="nom">Nom</label>
                    <input id="nom" type="text" name="nom" size="30" maxlength="30" class="form-control">
                </div>
            
                <div class="form-group">
                    <label for="prenom">Prenom</label>
                    <input id="prenom" type="text" name="prenom" size="30" maxlength="30" class="form-control">
                </div>
            
                <div class="form-group">
                    <label for="dateNaiss">Date Naissance</label>
                    <input id="dateNaiss" type="date" name="dateNaiss" class="form-control">
                </div>
            
                <div class="form-group">
                    <label for="indice">Indice</label>
                    <input id="indice" type="number" name="indice" pattern="[0-9]{1,2,3}" class="form-control">
                </div>
            
                <div class="form-group">
                    <label for="caserne">Caserne</label>
                    <select name="idCaserne" class="form-control">
                        <%
                            ArrayList<Caserne> lesCasernes= (ArrayList)request.getAttribute("pLesCasernes");
                            for (int i=0; i<lesCasernes.size();i++){
                                Caserne c = lesCasernes.get(i);
                                out.println("<option value='" + c.getId()+"'>" + c.getNom()+"</option>" );
                            }
                        %>
                    </select>
                </div>
            
                <div class="form-group">
                    <label for="grade">Grade</label>
                    <select name="idGrade" class="form-control">
                        <%
                            ArrayList<Grade> lesGrades= (ArrayList)request.getAttribute("pLesGrades");
                            for (int i=0; i<lesGrades.size();i++){
                                Grade g = lesGrades.get(i);
                                out.println("<option value='" + g.getId()+"'>" + g.getLibelle()+"</option>" );
                            }
                        %>
                    </select>
                </div>
            
                <input type="submit" name="valider" id="valider" value="Ajouter" class="btn btn-primary btn-block">
            </div>
        </form>
        
    </div>
        
        
    </body>
</html>
