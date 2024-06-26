/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import database.DaoIntervention;
import database.DaoPompier;
import database.DaoVehicule;
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
import model.Intervention;
import model.Pompier;
import model.Vehicule;

/**
 *
 * @author alexi
 */
@WebServlet(name = "ServletIntervention", urlPatterns = {"/ServletIntervention"})
public class ServletIntervention extends HttpServlet {
    
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
            out.println("<title>Servlet ServletIntervention</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletIntervention at " + request.getContextPath() + "</h1>");
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
            ArrayList<Intervention> lesInterventions = DaoIntervention.getLesInterventions(cnx);
            String tri = request.getParameter("tri");
        
            if (tri != null && tri.equals("anciennes")) {
                lesInterventions = DaoIntervention.getLesInterventionsTrieesParDateAsc(cnx); 
            } else {
                lesInterventions = DaoIntervention.getLesInterventionsTrieesParDateDesc(cnx);
            }
            
            request.setAttribute("iLesInterventions", lesInterventions);
            System.out.println("lister intervention - nombres d'interventions récupérés" + lesInterventions.size());
            getServletContext().getRequestDispatcher("/vues/pompier/listerIntervention.jsp").forward(request, response); 
        }
        
        if(args[3].equals("consulter")) {  

            int idIntervention = Integer.parseInt((String)request.getParameter("idIntervention"));
            System.out.println( "intervention à afficher = " + idIntervention);
            Intervention i = DaoIntervention.getInterventionById(cnx, idIntervention);
            request.setAttribute("iIntervention", i);
            
            ArrayList<Pompier> lesPompiers = DaoPompier.getLesPompiersInterventionById(cnx, idIntervention);
            request.setAttribute("pLesPompiers", lesPompiers);
            
            ArrayList<Vehicule> lesVehicules = DaoVehicule.getLesVehiculesInterventionById(cnx, idIntervention);
            request.setAttribute("iLesVehicules", lesVehicules);
            
            getServletContext().getRequestDispatcher("/vues/pompier/consulterIntervention.jsp").forward(request, response);  
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
        processRequest(request, response);
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
