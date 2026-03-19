package com.library.servlet;

import com.library.dao.LivreDAO;
import com.library.model.Livre;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/livres")
public class LivreListServlet extends HttpServlet {

    private LivreDAO livreDAO;

    @Override
    public void init() throws ServletException {
        livreDAO = new LivreDAO();
    }

   @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String searchTitre = request.getParameter("titre");
    String searchAuteur = request.getParameter("auteur");
    String searchDate = request.getParameter("dateEdition");

    List<Livre> livres;

    // On vérifie si au moins UN champ contient vraiment du texte
    boolean isSearching = (searchTitre != null && !searchTitre.trim().isEmpty()) ||
                          (searchAuteur != null && !searchAuteur.trim().isEmpty()) ||
                          (searchDate != null && !searchDate.trim().isEmpty());

    if (isSearching) {
        livres = livreDAO.search(searchTitre, searchAuteur, searchDate);
    } else {
        livres = livreDAO.findAll(); // Affiche tout par défaut
    }

    request.setAttribute("livres", livres);
    request.setAttribute("isAdmin", "Admin".equals(request.getSession().getAttribute("role")));
    
    request.getRequestDispatcher("/WEB-INF/views/livres/list.jsp").forward(request, response);
}
}