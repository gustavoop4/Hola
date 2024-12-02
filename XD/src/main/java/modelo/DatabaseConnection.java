package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String JDBC_URL = "jdbc:sqlserver://localhost:1434;databaseName=CULEBRITICA;encrypt=true;trustServerCertificate=true";
    private static final String JDBC_USERNAME = "sa";
    private static final String JDBC_PASSWORD = "sa";
    
    // Método para obtener la conexión a la base de datos
    public static Connection getConnection() throws SQLException {
        try {
            // Cargar el driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("Driver cargado correctamente");
        } catch (ClassNotFoundException e) {
            System.out.println("Error al cargar el driver: " + e.getMessage());
            throw new SQLException("Error al cargar el driver JDBC", e);
        }
        
        // Retorna la conexión a la base de datos
        return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
    }
}