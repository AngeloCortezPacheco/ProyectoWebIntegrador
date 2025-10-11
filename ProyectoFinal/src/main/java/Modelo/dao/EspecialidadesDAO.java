package Modelo.dao;

import Modelo.dto.Especialidades;
import Servicios.ConectaDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class EspecialidadesDAO {
    Connection cnx= null;

    public List<Especialidades> getList(){
        cnx= ConectaDB.getConection();
        String sql="SELECT idEspecialidad, Nombre_Especialidad FROM Especialidad";
        PreparedStatement ps;
        ResultSet rs;
        List<Especialidades> lista=null;        
        try{
            ps=cnx.prepareStatement(sql);
            rs=ps.executeQuery();
            lista=new LinkedList<>();
            while(rs.next()){
                Especialidades es=new Especialidades(
                        rs.getInt("idEspecialidad"), 
                        rs.getString("Nombre_Especialidad"));
                lista.add(es);
            }
            rs.close();
            ps.close();
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return lista;
    }   
    
}


