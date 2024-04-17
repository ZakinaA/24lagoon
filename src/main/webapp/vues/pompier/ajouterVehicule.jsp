<%-- 
    Document   : ajouterVehicule
    Created on : 9 avr. 2024, 16:55:45
    Author     : alexi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Caserne"%>
<%@page import="model.TypeVehicule"%>
<%@page import="form.FormVehicule"%>
<%@ include file="PompierPage.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
<style>
body {
    overflow-y: hidden;
}
    
.custom-form {
    height: 520px;
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

#immatriculation {
    text-transform: uppercase;
}


</style>
    <body>
       <div class="main-content">
        <div class="custom-form">
            <%
                FormVehicule form = (FormVehicule)request.getAttribute("form");
            %>
        
        <form action="ajouter" method="POST">
            <div class="card-header">Véhicule</div>
               <div class="deplacement">
                <div class="form-group">
                    <label for="immatriculation">Immatrucation</label>
                    <input id="immatriculation" type="text" name="immatriculation" size="30" maxlength="30" class="form-control">
                </div>

                <div class="form-group">
                    <label for="dateOrigine">Date Origine</label>
                    <input id="dateOrigine" type="date" name="dateOrigine" size="30" maxlength="30" class="form-control">
                </div>

                <div class="form-group">
                    <label for="dateRevision">Date Revision</label>
                    <input id="dateRevision" type="date" name="dateRevision" class="form-control">
                </div>

                <div class="form-group">
                    <label for="typevehicule">Type Vehicule</label>
                    <select name="idTypeVehicule" class="form-control">
                        <%
                            ArrayList<TypeVehicule> lesTypesVehicules = (ArrayList)request.getAttribute("vLesTypesVehicules");
                            for (int i=0; i<lesTypesVehicules.size(); i++) {
                                TypeVehicule tv = lesTypesVehicules.get(i);
                                out.println("<option value='" + tv.getId() + "'>" + tv.getNom() + "</option>");
                            }
                        %>
                    </select>
                </div>

                <div class="form-group">
                    <label for="caserne">Caserne</label>
                    <select name="idCaserne" class="form-control">
                        <%
                            ArrayList<Caserne> lesCasernes = (ArrayList)request.getAttribute("cLesCasernes");
                            for (int i=0; i<lesCasernes.size(); i++) {
                                Caserne c = lesCasernes.get(i);
                                out.println("<option value='" + c.getId() + "'>" + c.getNom() + "</option>");
                            }
                        %>
                    </select>
                </div>

                <input type="submit" name="valider" id="valider" value="Ajouter" class="btn">
            </form>
            </div>
        </div>
       </div>

    </body>
</html>