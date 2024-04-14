<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Intervention"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="PompierPage.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SDIS WEB</title>
    <script>
        function submitForm() {
            document.getElementById("triForm").submit();
        }

        window.onload = function() {
            var selectElement = document.getElementById('triSelect');
            selectElement.onchange = function() {
                submitForm();
            };
        };
        
    </script>
</head>
<style>
    /*
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/CascadeStyleSheet.css to edit this template
*/
/* 
    Created on : 12 avr. 2024, 17:55:36
    Author     : alexi
*/

.table {
    margin-left:30px;
    width: 96%;
    border-collapse: collapse;
}

.table th, .table td {
    padding: 25px;
    text-align: center;
}


.spacer {
    height: 5px;
    background: transparent;
}

.row {
    background-color: white;
    box-shadow: 0px 10px 20px 0px rgba(0, 0, 0, 0.103);
    color: rgb(105, 105, 105);
}

.table-data-feature {
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: end;
    -webkit-justify-content: flex-end;
    -moz-box-pack: end;
    -ms-flex-pack: end;
    justify-content: flex-end;
}

.table-data-feature {
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: end;
    -webkit-justify-content: flex-end;
    -moz-box-pack: end;
    -ms-flex-pack: end;
    justify-content: flex-end;
}

.table-data-feature .item a {
    text-decoration: none;
    color: rgb(94, 94, 94);
}

.table-data-feature .item {
    display: block;
    height: 30px;
    width: 30px;
    position: relative;
    -webkit-border-radius: 100%;
    -moz-border-radius: 100%;
    border-radius: 100%;
    border: none;
    background: #e5e5e5;
    margin-right: 5px;
}

.table-data-feature .item:last-child {
    margin-right: 0;
}

.table-data-feature .item i {
    font-size: 20px;
    color: #808080;
    position: absolute;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    -moz-transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
    -o-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
}


.block {
    font-size: 15px;
    color: #808080;
    display: inline-block;
    background: #f2f2f2;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    line-height: 30px;
    padding: 0 14px;
}

th {
    color: rgb(49, 49, 49);
    font-weight: 100;
    font-size: 12px;
    text-transform: uppercase;
}

.green {
    color: green;
}

.underline {
    text-decoration: underline;
}

.blue {
    color: #4272d7;
}

.bold {
    font-weight: bold;
}

.zmdi {
    font-size: 20px;
}

.button {
    padding-right: 10px;
    padding-left: 10px;
    cursor: pointer;
    font-size: 15px;
    border-radius: 4px;
    border: none;
    background-color: #425d97;
    padding:11.5px;
    color: white;
    text-decoration:none;
}

select {
    padding-right: 10px;
    padding-left: 10px;
    cursor: pointer;
    font-size: 15px;
    border-radius: 4px;
    border: none;
    background-color: rgb(94, 94, 94);
    width: 110px;
    height: 40px;
    color: white;
}

.float {
    position:absolute;
    top:100px;
    right: 30px;
}

.none {
    text-decoration : none;
    color : rgb(105, 105, 105);
}

h1 {
    font-weight : 100;
    margin-left: 30px;
}

</style>
<body>
    <div class="main-content">
        <h1>Interventions</h1>
        <%
            ArrayList<Intervention> lesInterventions = (ArrayList)request.getAttribute("iLesInterventions");
        %>
    <div class="float">
        <form  id="triForm" action="<%= request.getContextPath() %>/ServletIntervention/lister" method="GET" style="display: inline;">
            <select name="tri" id="triSelect">
                <option value="" selected disabled>Filtrer par</option>
                <option value="recentes" <% if ("recentes".equals(request.getParameter("tri"))) out.print("selected"); %>>Décroissant</option>
                <option value="anciennes" <% if ("anciennes".equals(request.getParameter("tri"))) out.print("selected"); %>>Croissant</option>
            </select>
        </form>
        <a class="button" href="/sdisweb/ServletIntervention/ajouter" style="display: inline;">+ &nbsp Ajouter<a>
    </div>
       
        <table class="table">  
        <thead>
            <tr>             
                <th>Lieu</th>
                <th>Date</th>
                <th>Heure d'appel</th>   
                <th>Heure d'arrivée</th> 
                <th>Duree</th> 
            </tr>
        </thead>
        <tbody>
            <% if (lesInterventions != null && !lesInterventions.isEmpty()) { %>
                <% for (Intervention i : lesInterventions) { %>
                    <tr class="row">
                        <td><span class="block"><a class="none" href="../ServletIntervention/consulter?idIntervention=<%= i.getId() %>"><%= i.getLieu() %></a></span></td>
                        <td><span class="bold"><%= i.getDate() %></span></td>
                        <td><span class="blue"><%= i.getHeureAppel() %></span></td>
                        <td><span class="underline"><%= i.getHeureArrivee() %></span></td>
                        <td><span class="green"><%= i.getDuree() %></span></td>
                        <td>
                                    <div class="table-data-feature">
                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Send">
                                            <a href="#"  class="zmdi zmdi-edit"></a>
                                        </button>
                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                            <a href="#"  class="zmdi zmdi-archive"></a>
                                        </button>
                                    </div>
                                </td>
                    </tr>
                    <tr class="spacer"></tr>
                <% } %>
            <% } else { %>
                <tr>
                    <td colspan="6">Aucune intervention trouvée</td>
                </tr>
            <% } %>
    </tbody>
    </table>
    </div>
</body>
</html>
