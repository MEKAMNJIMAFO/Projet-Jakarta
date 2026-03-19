<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>${auteur != null ? 'Modifier' : 'Ajouter'} Auteur - Gestion Bibliothèque</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #fcfcfc; font-family: 'Roboto', sans-serif; padding-bottom: 50px; }
        
        .header-title { text-align: center; font-family: 'Playfair Display', serif; font-size: 2.5rem; margin: 40px 0; color: #1a1a1a; }

        .form-container { background: white; border: 1px solid #eee; padding: 40px; max-width: 600px; margin: 0 auto; }

        .form-label { text-transform: uppercase; font-size: 0.75rem; letter-spacing: 1px; color: #aaa; font-weight: bold; }
        
        .form-control, .form-select {
            border-radius: 0; border: 1px solid #e0e0e0; padding: 12px;
            font-size: 0.95rem; margin-bottom: 25px; background-color: #fff;
        }

        .form-control:focus { box-shadow: none; border-color: #1a1a1a; }

        /* Boutons identiques au style du login et des livres */
        .btn-save { background-color: #1a1a1a; color: white; border-radius: 0; padding: 15px; width: 100%; text-transform: uppercase; font-weight: bold; border: none; margin-bottom: 10px; transition: 0.3s; }
        .btn-cancel { background-color: white; color: #1a1a1a; border: 1px solid #1a1a1a; border-radius: 0; padding: 12px; width: 100%; text-transform: uppercase; font-size: 0.9rem; text-decoration: none; display: block; text-align: center; }
        .btn-save:hover { background-color: #333; }
    </style>
</head>
<body>

<div class="container">
    <h1 class="header-title">${auteur != null ? 'Edit Author' : 'Add Author'}</h1>

    <div class="form-container">
        <c:if test="${not empty error}">
            <div class="alert alert-danger rounded-0 border-0 mb-4" style="font-size: 0.9rem;">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/auteurs/${auteur != null ? 'edit' : 'add'}" method="post">
            <input type="hidden" name="action" value="${auteur != null ? 'update' : 'create'}">

            <div class="mb-3">
                <label class="form-label">Matricule</label>
                <input type="number" class="form-control" name="matricule" 
                       value="${auteur.matricule}" ${auteur != null ? 'readonly' : 'required'}>
            </div>

            <div class="mb-3">
                <label class="form-label">First Name (Prénom)</label>
                <input type="text" class="form-control" name="prenom" value="${auteur.prenom}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Last Name (Nom)</label>
                <input type="text" class="form-control" name="nom" value="${auteur.nom}" required>
            </div>

            <div class="mb-4">
                <label class="form-label">Gender (Genre)</label>
                <select class="form-select" name="genre" required>
                    <option value="Masculin" ${auteur.genre == 'Masculin' ? 'selected' : ''}>Masculin</option>
                    <option value="Féminin" ${auteur.genre == 'Féminin' ? 'selected' : ''}>Féminin</option>
                </select>
            </div>

            <div class="mt-4">
                <button type="submit" class="btn btn-save">Enregistrer</button>
                <a href="${pageContext.request.contextPath}/auteurs" class="btn btn-cancel">Annuler</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>