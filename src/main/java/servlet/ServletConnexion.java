/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import database.ConnexionBdd;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/connexion")
public class ServletConnexion extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        boolean authentifie = ConnexionBdd.verifierAuthentification(email, password);
        
        if(authentifie){
            HttpSession session = request.getSession();
            session.setAttribute("utilisateurConnecte", email);
            
            String nomPrenomPompier = ConnexionBdd.recuperNomPrenom(email);
            session.setAttribute("nomPrenompompier", nomPrenomPompier);
            
            response.sendRedirect(request.getContextPath() + "/ServletPompier/lister");
            
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
    }
}