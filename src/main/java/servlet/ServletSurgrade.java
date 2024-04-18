/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import database.DaoSurgrade;
import form.FormSurgrade;
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
import model.Surgrade;

/**
 *
 * @author ts1sio
 */
@WebServlet(name = "ServletSurgrade", urlPatterns = {"/ServletSurgrade"})
public class ServletSurgrade extends HttpServlet {
    
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
            out.println("<title>Servlet ServletSurgrade</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletSurgrade at " + request.getContextPath() + "</h1>");
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
                    ArrayList<Surgrade> lesSurgrades = DaoSurgrade.getLesSurgrades(cnx);
                    request.setAttribute("pLesSurgrades", lesSurgrades);
                    //System.out.println("lister eleves - nombres d'élèves récupérés" + lesEleves.size() );
                   getServletContext().getRequestDispatcher("/vues/pompier/listerSurgrade.jsp").forward(request, response);
                }
                
                if(args[3].equals("ajouter"))
            {       
                this.getServletContext().getRequestDispatcher("/vues/pompier/ajouterSurgrade.jsp" ).forward( request, response );
                return;
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
        
         FormSurgrade form = new FormSurgrade();

                /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
                Surgrade s = form.ajouterSurgrade(request);

                /* Stockage du formulaire et de l'objet dans l'objet request */
                request.setAttribute("form", form);
                request.setAttribute("sSurgrade", s);

                if (form.getErreurs().isEmpty()) {
                    Surgrade surgradeInsere = DaoSurgrade.addSurgrade(cnx, s);
                    if (surgradeInsere != null) {
                        
                        ArrayList<Surgrade> lesSurgrades = DaoSurgrade.getLesSurgrades(cnx);
                        request.setAttribute("pLesSurgrades", lesSurgrades);
                        request.setAttribute( "sSurgrade", surgradeInsere );
                        
                        this.getServletContext().getRequestDispatcher("/vues/pompier/listerSurgrade.jsp").forward(request, response);
                    } else {
                       
                    }

                } else {
                    // il y a des erreurs. On réaffiche le formulaire avec des messages d'erreurs
                    this.getServletContext().getRequestDispatcher("/vues/pompier/ajouterSurgrade.jsp").forward(request, response);
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
