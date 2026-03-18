<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - Gestion Bibliothèque</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Roboto:wght@300;400&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #fcfcfc;
            font-family: 'Roboto', sans-serif;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-box {
            background: white;
            border: 1px solid #eee;
            padding: 50px;
            width: 100%;
            max-width: 500px;
            text-align: center;
        }

        .login-title {
            font-family: 'Playfair Display', serif;
            font-size: 2.2rem;
            margin-bottom: 40px;
            color: #1a1a1a;
        }

        .form-label {
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 1px;
            color: #777;
            display: block;
            text-align: left;
            margin-bottom: 8px;
        }

        .form-control {
            border-radius: 0;
            border: 1px solid #e0e0e0;
            padding: 12px;
            margin-bottom: 25px;
            background-color: #fafafa;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #1a1a1a;
            background-color: white;
        }

        .btn-black {
            background-color: #1a1a1a;
            color: white;
            border-radius: 0;
            padding: 15px;
            width: 100%;
            text-transform: uppercase;
            font-weight: bold;
            letter-spacing: 1px;
            border: none;
            margin-top: 10px;
            transition: 0.3s;
        }

        .btn-black:hover {
            background-color: #333;
            color: white;
        }

        .btn-outline-custom {
            border: 1px solid #1a1a1a;
            color: #1a1a1a;
            border-radius: 0;
            padding: 12px;
            width: 100%;
            text-transform: uppercase;
            font-size: 0.9rem;
            margin-top: 15px;
            text-decoration: none;
            display: inline-block;
        }

        .lang-switcher {
            margin-top: 30px;
            border-top: 1px solid #eee;
            padding-top: 20px;
            font-size: 0.9rem;
        }

        .lang-switcher a {
            color: #007bff;
            text-decoration: none;
            margin: 0 10px;
        }
    </style>
</head>
<body>

<div class="login-box">
    <h1 class="login-title">Connexion</h1>

    <c:if test="${not empty error}">
        <div class="alert alert-danger rounded-0 border-0" style="font-size: 0.9rem;">
            ${error}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="mb-3">
            <label for="login" class="form-label">Nom d'utilisateur</label>
            <input type="text" class="form-control" id="login" name="login" required>
        </div>
        
        <div class="mb-4">
            <label for="password" class="form-label">Mot de passe</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>

        <button type="submit" class="btn btn-black">Se connecter</button>
        
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-outline-custom">Accueil</a>
    </form>
             <div class="text-center mt-3">
    <a href="${pageContext.request.contextPath}/livres?viewOnly=true" class="text-muted small text-decoration-none">
        Continuer sans se connecter (Mode Visiteur)
    </a>
</div>
    <div class="lang-switcher">
        <a href="#">FR</a>
        <a href="#">EN</a>
        <a href="#">AR</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>