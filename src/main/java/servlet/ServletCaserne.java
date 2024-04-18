/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import database.DaoCaserne;
import database.DaoIntervention;
import form.FormCaserne;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.util.ArrayList;
import model.Caserne;
import model.Intervention;
import model.Pompier;

/**
 *
 * @author ts1sio
 */
@WebServlet(name = "ServletCaserne", urlPatterns = {"/ServletCaserne"})
public class ServletCaserne extends HttpServlet {

    
    Connection cnx ;
            
    @Override
    public void init()
    {     
        ServletContext servletContext=getServletContext();
        cnx = (Connection)servletContext.getAttribute("connection");     
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletCaserne</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletCaserne at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url = request.getRequestURI().toLowerCase();
        
        String[] args = url.split("/");

                 
        if(args[3].equals("lister"))
        {              
            ArrayList<Caserne> lesCasernes = DaoCaserne.getLesCasernes(cnx);
            request.setAttribute("clesCasernes", lesCasernes);
            System.out.println("lister casernes - nombres de casernes récupérés" + lesCasernes.size() );
           getServletContext().getRequestDispatcher("/vues/pompier/listerCasernes.jsp").forward(request, response);
        }
        
        if(args[3].equals("consulter")) {  
            String idCaserneParam = request.getParameter("idCaserne");
            
            if (idCaserneParam != null) {
                int idCaserne = Integer.parseInt(idCaserneParam);
                System.out.println("pompier à afficher = " + idCaserne);
                ArrayList<Pompier> c = DaoCaserne.getLesPompiersCaserneById(cnx, idCaserne);
                request.setAttribute("pCasernePompier", c);
                
                Caserne nom = DaoCaserne.getNomCaserneById(cnx, idCaserne);
                request.setAttribute("CaserneNom", nom);
                
                ArrayList<Intervention> i = DaoIntervention.getInterventionCaserneById(cnx, idCaserne);
                request.setAttribute("pCaserneIntervention", i);
                
                getServletContext().getRequestDispatcher("/vues/pompier/consulterCasernePompier.jsp").forward(request, response);             
                } 
            }
        if(args[3].equals("ajouter"))
        {       
            this.getServletContext().getRequestDispatcher("/vues/pompier/ajouterCaserne.jsp" ).forward( request, response );
        }
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override

        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            FormCaserne form = new FormCaserne();

            /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
            Caserne c = form.ajouterCaserne(request);

            /* Stockage du formulaire et de l'objet dans l'objet request */
            request.setAttribute("form", form);
            request.setAttribute("pCaserne", c);

            if (form.getErreurs().isEmpty()) {
                Caserne caserneInsere = DaoCaserne.addCaserne(cnx, c);
                if (caserneInsere != null) {

                    request.setAttribute("CaserneNom", caserneInsere);
                    request.setAttribute( "pCaserne", caserneInsere );
                    this.getServletContext().getRequestDispatcher("/vues/pompier/consulterCasernePompier.jsp").forward(request, response);
                } else {
                    // Cas où l'insertion en bdd a échoué
                    // renvoyer vers une page d'erreur 
                }

            } else {
                // il y a des erreurs. On réaffiche le formulaire avec des messages d'erreurs
                this.getServletContext().getRequestDispatcher("/vues/pompier/ajouterCaserne.jsp").forward(request, response);
            }
        }



    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
