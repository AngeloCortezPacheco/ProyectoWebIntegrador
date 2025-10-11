package Modelo.dao;

import Modelo.dto.Citas;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class CitasDAO {
    Connection cnx=null;
    PreparedStatement ps;
    ResultSet rs;
    
    public List<Citas> getList(){
        String sql= "SELECT cit.idcitas, pac.nombre as NombrePaciente, cit.fecha_cita, cit.hora_cita, cit.motivo_cita " +
                    "from citas cit " +
                    "inner join pacientes pac on cit.dniPaciente = pac.dniPaciente ";
        List<Citas> lista=null;
        try{
            ps=cnx.prepareStatement(sql);
            rs=ps.executeQuery();
            lista= new LinkedList<>();
            while(rs.next()){
                Citas cita= new Citas(
                        rs.getInt("idcitas"), 
                        rs.getString("NombrePaciente"), 
                        rs.getString("fecha_cita"), 
                        rs.getString("hora_cita"),
                        rs.getString("motivo_cita") );
               lista.add(cita);
            }
            ps.close();
            rs.close();
        }catch(SQLException ex){
            System.err.println("Error al obtener la lista de citas: " + ex.getMessage());
            ex.printStackTrace();
        }
               
        return lista;
    }
    
    public void insertPost(Citas cita){
        String sql="INSERT INTO citas(dniPaciente,fecha_cita,hora_cita,motivo_cita) VALUES(?,?,?,?)";        
        try{
            ps=cnx.prepareStatement(sql);
            ps.setInt(1, cita.getDniPaciente());
            ps.setString(2, cita.getFechaCita());
            ps.setString(3, cita.getHoraCita());
            ps.setString(4, cita.getText());
            ps.executeUpdate();
            System.out.println("registrado");
        }catch(SQLException ex){    
            System.err.println("Error al registrar: " + ex.getMessage());
            ex.printStackTrace();
        }
    }
    
}
