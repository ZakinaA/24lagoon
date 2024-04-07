<%-- 
    Document   : consulterIntervention
    Created on : 7 avr. 2024, 02:47:28
    Author     : alexi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Intervention"%>
<%@page import="model.Pompier"%>
<%@page import="model.Vehicule"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    <body>
        <%
            Intervention i = (Intervention)request.getAttribute("iIntervention");
        %>
        
        <%
            ArrayList<Pompier> lesPompiers = (ArrayList)request.getAttribute("pLesPompiers");
        %>
        
        <%
            ArrayList<Vehicule> lesVehicules = (ArrayList)request.getAttribute("iLesVehicules");
        %>
        
        <h1>Information sur l'invertention <%  out.println(i.getId());%></h1>
        <table>
            <tr>
                <td>Lieu : </td><td><%  out.println(i.getLieu());%></td>
            </tr>
            <tr>
                <td>Date : </td><td><%  out.println(i.getDate());%></td>
            </tr>
             <tr>
                <td>Heure d'appel : </td><td><%  out.println(i.getHeureAppel());%></td>
            </tr>
            <tr>
                <td>Heure d'arrivée : </td><td><%  out.println(i.getHeureArrivee());%></td>
            </tr>
            <tr>
                <td>Durée : </td><td><%  out.println(i.getDuree());%></td>
            </tr>
            <tr>
                <td>Caserne : </td><td><%  out.println(i.getCaserne().getNom());%></td>
            </tr>
        </table>   
            
            <table>  
            <thead>
                <tr>             
                    <th>Id</th>
                    <th>Bip</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Date de naissance</th>
                    <th>Indice</th>

                </tr>
            </thead>
            <tbody>
                <% if (lesPompiers != null && !lesPompiers.isEmpty()) { %>
                    <% for (Pompier p : lesPompiers) { %>
                        <tr>
                            <td><%= p.getId() %></td>
                            <td><%= p.getBip() %></td>    
                            <td><%= p.getNom() %></td>                 
                            <td><%= p.getPrenom() %></td>                 
                            <td><%= p.getDateNaiss() %></td>                 
                            <td><%= p.getIndice() %></td>                 
                        </tr>
                    <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="2">Aucun pompiers trouvés</td>
                    </tr>
                <% } %>
        </tbody>    
        </table>
        
        <table>  
            <thead>
                <tr>             
                    <th>Id</th>
                    <th>Immatriculation</th>
                    <th>Date Origine</th>
                    <th>Date Revision</th>
                </tr>
            </thead>
            <tbody>
                <% if (lesVehicules != null && !lesVehicules.isEmpty()) { %>
                    <% for (Vehicule v : lesVehicules) { %>
                        <tr>
                            <td><%= v.getId() %></td>
                            <td><%= v.getImmatriculation() %></td>    
                            <td><%= v.getDateOrigine() %></td>                 
                            <td><%= v.getDateRevision() %></td>                              
                        </tr>
                    <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="2">Aucun véhicules trouvés</td>
                    </tr>
                <% } %>
        </tbody>    
        </table>
    </body>
</html>

