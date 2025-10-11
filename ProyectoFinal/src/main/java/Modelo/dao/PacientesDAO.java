package Modelo.dao;

import Modelo.dto.Pacientes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PacientesDAO {
    Connection cnx=null;
    PreparedStatement ps;
    ResultSet rs;
    
     public void insertPost(Pacientes paciente){
        String sql="INSERT INTO pacientes(dniPaciente,nombre,fechanacimiento,genero,telefono,mail,domicilio,condicionesmedicas) VALUES(?,?,?,?,?,?,?,?)";
        
        try{
            ps=cnx.prepareStatement(sql);
            ps.setInt(1, paciente.getIdPaciente());
            ps.setString(2, paciente.getNombre());
            ps.setString(3, paciente.getFechaNacimiento());
            ps.setString(4, paciente.getGenero());
            ps.setString(5, paciente.getTelefono());
            ps.setString(6, paciente.getEmail());
            ps.setString(7, paciente.getDomicilio());
            ps.setString(8, paciente.getCondicionMedica());
            ps.executeUpdate();
            System.out.println("registrado");
        }catch(SQLException ex){    
            System.err.println("Error al registrar: " + ex.getMessage());
            ex.printStackTrace();
        }
    }
}
