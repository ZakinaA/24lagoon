<%-- 
    Document   : listerCasernes
    Created on : 28 mars 2024, 15:13:08
    Author     : ts1sio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Caserne"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="PompierPage.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
<style>

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
    font-weight: 300;
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


.float {
    position:absolute;
    top:111px;
    right: 30px;
}

.none {
    text-decoration : none;
    color : rgb(105, 105, 105);
}

h1 {
    font-weight : 400;
    margin-left: 30px;
}

</style>
    <body>
          <%
            ArrayList<Caserne> lesCasernes = (ArrayList)request.getAttribute("clesCasernes");
         %>
    <div class="main-content">
        <h1>Casernes</h1>
        <div class="float">
            <a class="button" href="/sdisweb/ServletCaserne/ajouter" style="display: inline;">+ &nbsp Ajouter<a>
        </div>

        <table class="table">  
            <thead>
                <tr>             
                    <th>Nom</th>
                    <th>Rue</th>
                    <th>Code Postal</th>
                    <th>Ville</th>
                </tr>
            </thead>
            <tbody>
                <% if (lesCasernes != null && !lesCasernes.isEmpty()) { %>
                    <% for (Caserne c : lesCasernes) { %>
                        <tr class="row">
                            <td><span class="block"><a class="none" href="../ServletCaserne/consulter?idCaserne=<%= c.getId() %>"><%= c.getNom() %></a></span></td>
                            <td><span class="underline"><%= c.getRue() %></span></td>
                            <td><span class="bold"><%= c.getCopos() %></span></td>
                            <td><span class="blue"><%= c.getVille() %></span></td>
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
                        <td colspan="4">Aucune caserne trouvée</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
