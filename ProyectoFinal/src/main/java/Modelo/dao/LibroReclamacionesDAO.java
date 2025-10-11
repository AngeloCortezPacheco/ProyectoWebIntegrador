package Modelo.dao;

import Modelo.dto.LibroReclamaciones;
import Servicios.ConectaDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class LibroReclamacionesDAO {
    
    public List<LibroReclamaciones> getList(){
        Connection cnx=ConectaDB.getConection();
        List<LibroReclamaciones> lista= new LinkedList<>();
        String sql="SELECT idreclamo, nombre, domicilio, dni, telefono, mail, detalles "
                + "FROM libroreclamaciones";
        
        try{
            PreparedStatement ps =cnx.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                LibroReclamaciones libro=new LibroReclamaciones(
                        rs.getInt("idreclamo"), 
                        rs.getString("nombre"), 
                        rs.getString("domicilio"), 
                        rs.getInt("dni"), 
                        rs.getString("telefono"), 
                        rs.getString("mail"), 
                        rs.getString("detalles"));
                lista.add(libro);
            }
            cnx.close();
            ps.close();
            rs.close();            
        }catch(SQLException ex){
            System.err.println("Error al obtener la lista de Libro de reclamaciones: " + ex.getMessage());
            ex.printStackTrace();   
        } 
        return lista;
    }
    
    
    public void postLibroReclamaciones(LibroReclamaciones libro){
        Connection cnx=ConectaDB.getConection();
        String sql="INSERT INTO libroreclamaciones (nombre, domicilio, dni, telefono, mail, detalles) "
                + "VALUES (?,?,?,?,?,?)";
       try{
            PreparedStatement ps =cnx.prepareStatement(sql);
            ps.setString(1, libro.getNombre());
            ps.setString(2, libro.getDomcilio());
            ps.setInt(3, libro.getDni());
            ps.setString(4, libro.getTelefono());
            ps.setString(5, libro.getMail());
            ps.setString(6, libro.getDetalles());
            
            ps.executeUpdate();   
            System.out.println("Listado correctamente");
            
       }catch(SQLException ex){
           System.err.println("Error al postear la lista de Libro de reclamaciones: " + ex.getMessage());
           ex.printStackTrace(); 
       }
    }    
}

