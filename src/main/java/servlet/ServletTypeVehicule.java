/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import database.DaoTypeVehicule;
import database.DaoVehicule;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.TypeVehicule;
import model.Vehicule;

/**
 *
 * @author alexi
 */
@WebServlet(name = "ServletTypeVehicule", urlPatterns = {"/ServletTypeVehicule"})
public class ServletTypeVehicule extends HttpServlet {
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
            out.println("<title>Servlet ServletTypeVehicule</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletTypeVehicule at " + request.getContextPath() + "</h1>");
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
            ArrayList<TypeVehicule> lesTypesVehicules = DaoTypeVehicule.getLesTypesVehicules(cnx);
            request.setAttribute("vLesTypesVehicules", lesTypesVehicules);
            
            System.out.println("lister véhicules - nombres de véhicules récupérés" + lesTypesVehicules.size());
            getServletContext().getRequestDispatcher("/vues/pompier/listerTypeVehicule.jsp").forward(request, response);
        }
        
        if(args[3].equals("consulter"))
        {  
            // tout paramètre récupéré de la request Http est de type String
            // Il est donc nécessaire de caster le paramètre idPompier en int
            
            int idTypeVehicule = Integer.parseInt((String)request.getParameter("idTypeVehicule"));
            System.out.println( "Type Vehicule à afficher = " + idTypeVehicule);

            
            ArrayList<Vehicule> lesVehicules = DaoVehicule.getLesVehiculesTypeVehiculeById(cnx, idTypeVehicule);
            request.setAttribute("vLesVehicules", lesVehicules);
            
            
            getServletContext().getRequestDispatcher("/vues/pompier/consulterTypeVehicule.jsp").forward(request, response);       
           
           
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
