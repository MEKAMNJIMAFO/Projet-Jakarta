package com.library.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    // Nouvelle URL pour Render (PostgreSQL)
    private static final String URL = "jdbc:postgresql://dpg-d6tji0vdiees73d0gv60-a.frankfurt-postgres.render.com:5432/gestion_db_hvs9";
    private static final String USER = "gestion_db_hvs9_user";
    private static final String PASSWORD = "LSTapTPgZUtqg8DlGbXRIO6CpJu7yGd0";

    static {
        try {
            // Chargement du driver PostgreSQL
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Erreur de chargement du driver PostgreSQL", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
        if (conn != null) {
            System.out.println("✅ CONNEXION RÉUSSIE À LA BASE DISTANTE !");
        }
        return conn;
    }

    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}