<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion de Bibliothèque - Bienvenue</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Roboto:wght@300;400&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Roboto', sans-serif;
        }
        
        /* Style de la navbar en haut */
        .navbar-custom {
            padding: 20px 50px;
            background: white;
        }
        .navbar-brand {
            font-family: 'Playfair Display', serif;
            font-weight: bold;
            font-size: 1.8rem;
            color: #1a1a1a !important;
        }

        /* Le Hero Banner (zone grise) */
        .hero-section {
            background-color: #a0a0a0; /* Gris comme sur ton image */
            height: calc(100vh - 80px);
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            padding: 0 20px;
        }

        .hero-title {
            font-family: 'Playfair Display', serif;
            font-size: 4.5rem;
            margin-bottom: 20px;
        }

        .hero-subtitle {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto 40px;
            line-height: 1.6;
            font-weight: 300;
        }

        .btn-connect {
            background-color: #1a1a1a;
            color: white;
            padding: 15px 40px;
            border-radius: 0;
            text-transform: uppercase;
            font-weight: bold;
            letter-spacing: 1px;
            border: none;
            transition: 0.3s;
        }

        .btn-connect:hover {
            background-color: #333;
            color: white;
        }
        
        .btn-outline-custom {
            border: 1px solid #1a1a1a;
            color: #1a1a1a;
            border-radius: 0;
            padding: 8px 25px;
            text-transform: uppercase;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-custom shadow-sm">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Gestion de Bibliothèque</a>
            <div class="ms-auto">
                <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-custom">SE CONNECTER</a>
            </div>
        </div>
    </nav>

    <div class="hero-section">
        <div class="container">
            <h1 class="hero-title">Bienvenue dans la Gestion de Bibliothèque</h1>
            <p class="hero-subtitle">
                Discover a world of knowledge. Explore our curated collection 
                of books and authors in a serene environment.
            </p>
            <a href="${pageContext.request.contextPath}/login" class="btn btn-connect">SE CONNECTER</a>
        </div>
    </div>

</body>
</html>