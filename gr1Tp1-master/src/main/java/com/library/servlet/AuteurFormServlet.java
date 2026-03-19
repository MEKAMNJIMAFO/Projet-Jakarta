package com.library.servlet;

import com.library.dao.AuteurDAO;
import com.library.model.Auteur;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet({"/auteurs/add", "/auteurs/edit"})
public class AuteurFormServlet extends HttpServlet {

    private AuteurDAO auteurDAO;

    @Override
    public void init() throws ServletException {
        auteurDAO = new AuteurDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!"Admin".equals(request.getSession().getAttribute("role"))) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Accès réservé aux administrateurs");
            return;
        }

        String matriculeStr = request.getParameter("matricule");
        if (matriculeStr != null && !matriculeStr.isBlank()) {
            int matricule = Integer.parseInt(matriculeStr);
            Auteur auteur = auteurDAO.findByMatricule(matricule);
            request.setAttribute("auteur", auteur);
        }

        request.setAttribute("genres", new String[]{"Masculin", "Féminin"});

        request.getRequestDispatcher("/WEB-INF/views/auteurs/form.jsp").forward(request, response);
    }

   @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    if (!"Admin".equals(request.getSession().getAttribute("role"))) {
        response.sendError(HttpServletResponse.SC_FORBIDDEN, "Accès réservé aux administrateurs");
        return;
    }

    // 1. On récupère le matricule de façon sécurisée (UNE SEULE FOIS)
    String matriculeStr = request.getParameter("matricule");
    int matricule = (matriculeStr != null && !matriculeStr.isEmpty()) ? Integer.parseInt(matriculeStr) : 0;

    // 2. On récupère le reste
    String nom = request.getParameter("nom");
    String prenom = request.getParameter("prenom");
    String genre = request.getParameter("genre");

    // 3. Validation du genre
    if (!"Masculin".equals(genre) && !"Féminin".equals(genre)) {
        request.setAttribute("error", "Le genre doit être Masculin ou Féminin");
        request.getRequestDispatcher("/WEB-INF/views/auteurs/form.jsp").forward(request, response);
        return;
    }

    // 4. On crée l'objet Auteur
    Auteur auteur = new Auteur(matricule, nom, prenom, genre);

    String action = request.getParameter("action");
    if ("update".equals(action)) {
        auteurDAO.update(auteur);
    } else {
        // 5. On vérifie si le matricule existe déjà (puisqu'on l'insère manuellement)
        if (auteurDAO.findByMatricule(matricule) != null) {
            request.setAttribute("error", "Ce matricule existe déjà");
            request.getRequestDispatcher("/WEB-INF/views/auteurs/form.jsp").forward(request, response);
            return;
        }
        auteurDAO.create(auteur);
    }

    response.sendRedirect(request.getContextPath() + "/auteurs");
}
}
