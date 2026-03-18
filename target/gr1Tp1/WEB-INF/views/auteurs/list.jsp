<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Auteurs - Gestion de Bibliothèque</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #fff; font-family: 'Roboto', sans-serif; }
        
        /* Navbar identique à la page livres */
        .navbar { background: white !important; border-bottom: 1px solid #eee; padding: 15px 50px; }
        .navbar-brand { font-family: 'Playfair Display', serif; font-weight: bold; color: #1a1a1a !important; font-size: 1.5rem; }
        .nav-link { color: #555 !important; text-transform: uppercase; font-size: 0.85rem; letter-spacing: 1px; margin: 0 10px; }
        .nav-link.active { border-bottom: 2px solid #d4af37; color: #1a1a1a !important; }

        .container-main { padding: 40px 50px; }
        h2 { font-family: 'Playfair Display', serif; font-size: 2.5rem; margin-bottom: 30px; color: #1a1a1a; }

        .btn-gold { background-color: #c5a059; color: white; border-radius: 0; padding: 10px 25px; text-transform: uppercase; font-weight: bold; font-size: 0.8rem; border: none; }
        
        /* Barre de recherche grise */
        .search-bar { background: #f8f8f8; border: 1px solid #eee; padding: 0; display: flex; align-items: center; margin-bottom: 40px; }
        .search-bar input { border: none; background: transparent; padding: 15px; font-size: 0.9rem; flex-grow: 1; }
        .btn-search { background: #1a1a1a; color: white; border-radius: 0; padding: 15px 40px; text-transform: uppercase; font-weight: bold; font-size: 0.8rem; border: none; }

        /* Avatar rond */
        .avatar {
            width: 45px; height: 45px; border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            font-weight: bold; color: #555; background-color: #f0f0f0;
            border: 1px solid #ddd; text-transform: uppercase;
            object-fit: cover;
        }

        .table { font-size: 0.9rem; border-top: 1px solid #1a1a1a; }
        .table thead th { text-transform: uppercase; color: #888; font-weight: 400; border-bottom: 1px solid #1a1a1a; padding: 15px; }
        .table tbody td { vertical-align: middle; padding: 15px; border-bottom: 1px solid #eee; }

        .btn-action { border-radius: 0; font-size: 0.75rem; font-weight: bold; padding: 5px 15px; text-transform: uppercase; border: none; margin-right: 5px; }
        .btn-modify { background: #ffc107; color: #000; }
        .btn-delete { background: #dc3545; color: #fff; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Gestion de Bibliothèque</a>
        <div class="collapse navbar-collapse justify-content-center">
            <div class="navbar-nav">
                <a class="nav-link" href="${pageContext.request.contextPath}/livres">Livres</a>
                <a class="nav-link active" href="${pageContext.request.contextPath}/auteurs">Auteurs</a>
            </div>
        </div>
        <div class="d-flex align-items-center">
            <span class="user-info me-3">Bonjour, ${sessionScope.user.admin}@admin.com</span>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-dark btn-sm rounded-0">DÉCONNEXION</a>
        </div>
    </div>
</nav>

<div class="container-main">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Liste des Auteurs</h2>
        <c:if test="${isAdmin && !viewOnly}">
            <a href="${pageContext.request.contextPath}/auteurs/add" class="btn btn-gold">+ NOUVEL AUTEUR</a>
        </c:if>
    </div>

    <form action="${pageContext.request.contextPath}/auteurs" method="get" class="search-bar">
        <input type="text" name="nom" placeholder="Rechercher par nom..." class="form-control shadow-none">
        <button type="submit" class="btn btn-search">RECHERCHER</button>
    </form>

    <table class="table">
        <thead>
            <tr>
                <th>Avatar</th>
                <th>Matricule</th>
                <th>Nom Complet</th>
                <th>Genre</th>
                <c:if test="${isAdmin && !viewOnly}"><th>Actions</th></c:if>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="auteur" items="${auteurs}">
                <tr>
                    <td>
                        <div class="avatar">
                            ${auteur.prenom.charAt(0)}${auteur.nom.charAt(0)}
                        </div>
                    </td>
                    <td class="text-muted">#${auteur.matricule}</td>
                    <td class="fw-bold">${auteur.prenom} ${auteur.nom}</td>
                    <td>${auteur.genre}</td>
                    <c:if test="${isAdmin && !viewOnly}">
                        <td>
                            <a href="${pageContext.request.contextPath}/auteurs/edit?matricule=${auteur.matricule}" class="btn btn-action btn-modify">Modifier</a>
                            <a href="${pageContext.request.contextPath}/auteurs/delete?matricule=${auteur.matricule}" 
                               class="btn btn-action btn-delete" 
                               onclick="return confirm('Supprimer cet auteur ?');">Supprimer</a>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>