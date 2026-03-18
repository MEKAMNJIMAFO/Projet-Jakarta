<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Détails - ${livre.titre}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .book-cover { max-width: 300px; box-shadow: 0 10px 20px rgba(0,0,0,0.2); }
        .label { font-weight: bold; text-transform: uppercase; color: #888; font-size: 0.8rem; }
    </style>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row bg-white p-5 shadow-sm">
            <div class="col-md-4">
                <c:choose>
                    <c:when test="${not empty livre.imagePath}">
                        <img src="${pageContext.request.contextPath}/uploads/${livre.imagePath}" class="img-fluid book-cover">
                    </c:when>
                    <c:otherwise>
                        <div class="bg-secondary text-white d-flex align-items-center justify-content-center" style="height: 400px;">Pas d'image</div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="col-md-8">
                <h1 class="display-4">${livre.titre}</h1>
                <p class="lead">Par ${livre.auteur.prenom} ${livre.auteur.nom}</p>
                <hr>
                <div class="mb-3"><span class="label">ISBN:</span> <div>${livre.isbn}</div></div>
                <div class="mb-3"><span class="label">Éditeur:</span> <div>${livre.editeur}</div></div>
                <div class="mb-3"><span class="label">Date d'édition:</span> <div>${livre.dateEdition}</div></div>
                <div class="mt-4">
                    <span class="label">Description:</span>
                    <p class="mt-2">${livre.description}</p>
                </div>
                <a href="${pageContext.request.contextPath}/livres" class="btn btn-outline-dark mt-4">Retour à la liste</a>
            </div>
        </div>
    </div>
</body>
</html>