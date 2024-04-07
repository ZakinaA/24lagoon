<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Intervention"%>
<%@page import="java.util.ArrayList"%>
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
<body>
    <h1>Liste des interventions</h1>
    <%
        ArrayList<Intervention> lesInterventions = (ArrayList)request.getAttribute("iLesInterventions");
    %>
    
    <form id="triForm" action="<%= request.getContextPath() %>/ServletIntervention/lister" method="GET">
        <select name="tri" id="triSelect">
            <option value="" selected disabled>Filtrer par</option>
            <option value="recentes" <% if ("recentes".equals(request.getParameter("tri"))) out.print("selected"); %>>Décroissant</option>
            <option value="anciennes" <% if ("anciennes".equals(request.getParameter("tri"))) out.print("selected"); %>>Croissant</option>
        </select>
    </form>

    <table>  
    <thead>
        <tr>             
            <th>Id</th>
            <th>Lieu</th>
            <th>Date</th>
            <th>Heure d'appel</th>   
            <th>Heure d'arrivée</th> 
            <th>Duree</th> 
        </tr>
    </thead>
    <tbody>
        <%
            for (Intervention i : lesInterventions)
            {              
                out.println("<tr><td>");
                out.println(i.getId());
                out.println("</a></td>");

                out.println("<td><a href ='../ServletIntervention/consulter?idIntervention="+ i.getId()+ "'>");
                out.println(i.getLieu());
                out.println("</td>");

                out.println("<td>");
                out.println(i.getDate());
                out.println("</td>");

                out.println("<td>");
                out.println(i.getHeureAppel());
                out.println("</td>");

                out.println("<td>");
                out.println(i.getHeureArrivee());
                out.println("</td>");

                out.println("<td>");
                out.println(i.getDuree());
                out.println("</td>");   
            }
        %>
    </tbody>
</table>
</body>
</html>
