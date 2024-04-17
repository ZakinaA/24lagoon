<%-- 
    Document   : ajouterGrade
    Created on : 9 avr. 2024, 13:03:47
    Author     : alexi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Surgrade"%>
<%@page import="form.FormGrade"%>
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
    height: 340px;
    top: 200px;
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
    margin-top: 30px;
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

input {
    margin-bottom: 10px;
    margin-top: 10px;
}

select {
    margin-top: 10px;
}
</style>
    <body>
    <div class="main-content">
        <div class="custom-form">
            <%
                FormGrade form = (FormGrade)request.getAttribute("form");
            %>
        
            <form class="form-inline" action="ajouter" method="POST">
                <div class="card-header">Grade</div>
                <div class="deplacement">
                <label for="libelle">Libelle</label>
                <input id="libelle" type="text" name="libelle"  size="30" maxlength="30" class="form-control">
                <br>

                <label for="description">Description</label>
                <input id="description" type="text" name="description"  size="50" maxlength="50" class="form-control">
                <br>

                <label for="surgrade">Surgrade</label>
                <select name="idSurgrade" class="form-control">
                    <%
                        ArrayList<Surgrade> lesSurgrades = (ArrayList)request.getAttribute("pLesSurgrades");
                        for (int i=0; i<lesSurgrades.size(); i++){
                            Surgrade s = lesSurgrades.get(i);
                            out.println("<option value='" + s.getId() + "'>" + s.getLibelle() + "</option>");
                        }
                    %>
                </select>
                <br>
                
                <input type="submit" name="valider" id="valider" value="Valider" class="btn">
                </div>
            </form>
        </div>
    </div>
</body>
</html>