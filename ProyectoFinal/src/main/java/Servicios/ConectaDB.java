package Servicios;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConectaDB {
    public static Connection getConection(){
        Connection conectar = null;
        String sql="jdbc:postgresql://localhost:5450/Hospital_San_Jose";
        String user="postgres";
        String contraseña="root";
        String driver="org.postgresql.Driver";
        
        try{
            Class.forName(driver);
            conectar = DriverManager.getConnection(sql, user, contraseña);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConectaDB.class.getName()).log(Level.SEVERE, null, ex);
        }  
        
        return conectar;
    }
    
    public static void main(String[] args) {
        Connection cx = ConectaDB.getConection();        
        try {
            System.out.println(""+cx.getCatalog());
        } catch (SQLException ex) {
            Logger.getLogger(ConectaDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
