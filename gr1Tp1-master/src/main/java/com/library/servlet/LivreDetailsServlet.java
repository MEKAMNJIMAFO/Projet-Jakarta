package com.library.servlet;

import com.library.dao.LivreDAO;
import com.library.model.Livre;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/livres/details")
public class LivreDetailsServlet extends HttpServlet {
    private LivreDAO livreDAO = new LivreDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String isbnStr = request.getParameter("isbn");
        if (isbnStr != null) {
            long isbn = Long.parseLong(isbnStr);
            Livre livre = livreDAO.findByIsbn(isbn);
            request.setAttribute("livre", livre);
            request.getRequestDispatcher("/WEB-INF/views/livres/details.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/livres");
        }
    }
}