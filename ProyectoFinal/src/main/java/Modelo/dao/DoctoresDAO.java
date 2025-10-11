package Modelo.dao;

import Modelo.dto.Doctores;
import Servicios.ConectaDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class DoctoresDAO {
    Connection cnx=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    
    public List<Doctores> getList(){
        cnx=ConectaDB.getConection();
        List<Doctores> lista=new LinkedList<>();
        String sql="SELECT doc.iddoctor, doc.nombre, esp.nombre_especialidad as nombre_especialidad, doc.email, doc.telefono "+
                "FROM doctores doc "
                + "INNER JOIN especialidad esp on doc.idespecialidad=esp.idespecialidad ";
        try{
            ps=cnx.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Doctores doctor= new Doctores(
                        rs.getInt("iddoctor"), 
                        rs.getString("nombre"), 
                        rs.getString("nombre_especialidad"), 
                        rs.getString("email"),
                        rs.getString("telefono")  
                );
                lista.add(doctor);
                System.out.println("Lista impresa");   
                cnx.close();
                ps.close();
                rs.close();    
            }
        }catch(SQLException ex){
            System.err.println("Error al obtener la lista de citas: " + ex.getMessage());
            ex.printStackTrace();            
        }            
        return lista;
    }
    
}
