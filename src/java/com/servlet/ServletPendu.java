package com.servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.beans.Pendu;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Spleen
 */
@WebServlet(urlPatterns = {"/MyServlet"})
public class ServletPendu extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            Pendu pendu = null;
            HttpSession session = request.getSession(true);
            
            String newgame = request.getParameter("newgame");
            if (newgame != null && newgame.equals("true")) {
                session.removeAttribute("instancePendu");
            }
            pendu = (Pendu) session.getAttribute("instancePendu");

            if (pendu == null) {
                pendu = new Pendu();
                session.setAttribute("instancePendu", pendu);
                pendu.getRandomWord();
            } else {
                if (request.getParameter("inputLetter") != null) {
                    pendu.refresh(request.getParameter("inputLetter").charAt(0));
                }
            }

            /* Stockage du message et du bean dans l'objet request */
            request.setAttribute("pendu", pendu);

            this.getServletContext().getRequestDispatcher("/WEB-INF/VuePendu.jsp").forward(request, response);

        } catch (ServletException e) {
            out.println("Erreur Servlet : " + e.getMessage());
        } catch (IOException e) {
            out.println("Erreur IO : " + e.getMessage());
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
        processRequest(request, response);
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
