<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>${livre != null ? 'Modifier' : 'Ajouter'} - Gestion Bibliothèque</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #fcfcfc; font-family: 'Roboto', sans-serif; padding-bottom: 50px; }
        
        /* En-tête simple comme sur l'image */
        .header-title { text-align: center; font-family: 'Playfair Display', serif; font-size: 2.5rem; margin: 40px 0; color: #1a1a1a; }

        .form-container { background: white; border: 1px solid #eee; padding: 40px; max-width: 900px; margin: 0 auto; }

        .form-label { text-transform: uppercase; font-size: 0.75rem; letter-spacing: 1px; color: #aaa; font-weight: bold; }
        
        .form-control, .form-select {
            border-radius: 0; border: 1px solid #e0e0e0; padding: 12px;
            font-size: 0.95rem; margin-bottom: 20px; background-color: #fff;
        }

        .form-control:focus { box-shadow: none; border-color: #1a1a1a; }

        /* Style spécifique pour la zone d'image */
        .image-preview-box { border: 1px solid #eee; padding: 10px; display: inline-block; margin-bottom: 10px; }
        .current-image { width: 60px; height: 90px; object-fit: cover; }

        /* Boutons */
        .btn-save { background-color: #1a1a1a; color: white; border-radius: 0; padding: 15px; width: 100%; text-transform: uppercase; font-weight: bold; border: none; margin-bottom: 10px; }
        .btn-cancel { background-color: white; color: #1a1a1a; border: 1px solid #1a1a1a; border-radius: 0; padding: 12px; width: 100%; text-transform: uppercase; font-size: 0.9rem; text-decoration: none; display: block; text-align: center; }
        .btn-save:hover { background-color: #333; }
    </style>
</head>
<body>

<div class="container">
    <h1 class="header-title">${livre != null ? 'Edit' : 'Add'}</h1>



    <div class="form-container">
        <c:if test="${not empty error}">
            <div class="alert alert-danger rounded-0 border-0 mb-4">${error}</div>
        </c:if>

      
<form action="${pageContext.request.contextPath}/livres/${livre != null ? 'edit' : 'add'}" 
      method="post" 
      enctype="multipart/form-data">
            <input type="hidden" name="action" value="${livre != null ? 'update' : 'create'}">

            <div class="row">
                <div class="col-md-6">
                    <label class="form-label">ISBN</label>
                    <input type="text" class="form-control" name="isbn" value="${livre.isbn}" ${livre != null ? 'readonly' : 'required'}>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Publication Date</label>
                    <input type="date" class="form-control" name="dateEdition" value="${livre.dateEdition}" required>
                </div>
            </div>

            <label class="form-label">Title</label>
            <input type="text" class="form-control" name="titre" value="${livre.titre}" required>

            <label class="form-label">Cover Image</label>
            <input type="file" class="form-control" name="imageFile">
            
            <c:if test="${livre != null && not empty livre.imagePath}">
                <div class="mb-3">
                    <p class="form-label" style="text-transform: none; color: #555">Image actuelle :</p>
                    <div class="image-preview-box">
                        <img src="${pageContext.request.contextPath}/uploads/${livre.imagePath}" class="current-image">
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="deleteImage" id="delImg">
                        <label class="form-check-label text-danger" for="delImg" style="font-size: 0.8rem;">Delete current image</label>
                    </div>
                </div>
            </c:if>

            <label class="form-label">Description</label>
            <textarea class="form-control" name="description" rows="5">${livre.description}</textarea>

            <div class="row">
                <div class="col-md-6">
                    <label class="form-label">Publisher</label>
                    <select class="form-select" name="editeur" required>
                        <c:forEach var="e" items="${editeurs}">
                            <option value="${e}" ${e == livre.editeur ? 'selected' : ''}>${e}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Author</label>
                    <select class="form-select" name="matriculeAuteur" required>
                        <c:forEach var="a" items="${auteurs}">
                            <option value="${a.matricule}" ${a.matricule == livre.matriculeAuteur ? 'selected' : ''}>
                                ${a.nom} ${a.prenom}
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="mt-4">
                <button type="submit" class="btn btn-save">Enregistrer</button>
                <a href="${pageContext.request.contextPath}/livres" class="btn btn-cancel">Annuler</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>