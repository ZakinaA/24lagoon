/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import database.DaoGrade;
import database.DaoSurgrade;
import form.FormGrade;
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
import model.Grade;
import model.Pompier;
import model.Surgrade;

/**
 *
 * @author ts1sio
 */
@WebServlet(name = "ServletGrades", urlPatterns = {"/ServletGrades"})
public class ServletGrade extends HttpServlet {
    
       
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
            out.println("<title>Servlet ServletGrades</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletGrades at " + request.getContextPath() + "</h1>");
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
            ArrayList<Grade> lesGrades = DaoGrade.getLesGrades(cnx);
            request.setAttribute("gLesGrades", lesGrades);
            System.out.println("lister grades - nombres de grades récupérés" + lesGrades.size());
            getServletContext().getRequestDispatcher("/vues/pompier/listerGrade.jsp").forward(request, response);
        }
        
        if(args[3].equals("consulter")) {  
            String idGradeParam = request.getParameter("idGrade");
            
            if (idGradeParam != null) {
                int idGrade = Integer.parseInt(idGradeParam);
                System.out.println("pompier à afficher = " + idGrade);
                ArrayList<Pompier> c = DaoGrade.getLesPompiersGradeById(cnx, idGrade);
                request.setAttribute("pGradePompier", c);
                
                Grade nom = DaoGrade.getNomGradeById(cnx, idGrade);
                request.setAttribute("GradeNom", nom);
                
                getServletContext().getRequestDispatcher("/vues/pompier/consulterGrade.jsp").forward(request, response);             
                } 
            }
        if(args[3].equals("ajouter"))
        {                   
            ArrayList<Surgrade> lesSurgrades = DaoSurgrade.getLesSurgrades(cnx);
            request.setAttribute("pLesSurgrades", lesSurgrades);
            
            this.getServletContext().getRequestDispatcher("/vues/pompier/ajouterGrade.jsp" ).forward( request, response );
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
        
        FormGrade form = new FormGrade();
		
        /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
        Grade g = form.ajouterGrade(request);
        
        /* Stockage du formulaire et de l'objet dans l'objet request */
        request.setAttribute( "form", form );
        request.setAttribute( "pGrade", g );
		
        if (form.getErreurs().isEmpty()){
            Grade gradeInsere =  DaoGrade.addGrade(cnx, g);
            if (gradeInsere != null ){
                
                request.setAttribute("GradeNom", gradeInsere);
                request.setAttribute( "pGrade", gradeInsere );
                this.getServletContext().getRequestDispatcher("/vues/pompier/consulterGrade.jsp" ).forward( request, response );
            }
            else 
            {
                // Cas oùl'insertion en bdd a échoué
                //renvoyer vers une page d'erreur 
            }
           
        }
        else
        { 
            // il y a des erreurs. On réaffiche le formulaire avec des messages d'erreurs
            ArrayList<Surgrade> lesSurgrades = DaoSurgrade.getLesSurgrades(cnx);
            request.setAttribute("pLesSurgrades", lesSurgrades);
            this.getServletContext().getRequestDispatcher("/vues/pompier/ajouterGrade.jsp" ).forward( request, response );
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
