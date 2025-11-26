package Modelo.dao;

import Modelo.dto.Pacientes;
import Servicios.ConectaDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PacientesDAO {
    Connection cnx=null;
    PreparedStatement ps;
    ResultSet rs;
    
     public void insertPost(Pacientes paciente){
        cnx=ConectaDB.getConection();
        String sql="INSERT INTO pacientes(dniPaciente,nombre,fechanacimiento,genero,telefono,mail,domicilio,condicionesmedicas,contraseña) VALUES(?,?,?,?,?,?,?,?,?)";
        
        try{
            ps=cnx.prepareStatement(sql);
            ps.setInt(1, paciente.getIdPaciente());
            ps.setString(2, paciente.getNombre());
            ps.setDate(3, paciente.getFechaNacimiento());
            ps.setString(4, paciente.getGenero());
            ps.setString(5, paciente.getTelefono());
            ps.setString(6, paciente.getEmail());
            ps.setString(7, paciente.getDomicilio());
            ps.setString(8, paciente.getCondicionMedica());
            ps.setString(9, paciente.getContraseña());
            ps.executeUpdate();
            System.out.println("registrado");
        }catch(SQLException ex){    
            System.err.println("Error al registrar: " + ex.getMessage());
            ex.printStackTrace();
        }
    }
     
     public Pacientes validarLogin(String emailODni, String contraseña) {
        Pacientes paciente = null;
        cnx = ConectaDB.getConection();
        
        // Query que busca por email o DNI
        String sql = "SELECT * FROM pacientes WHERE (mail = ? OR dniPaciente::text = ?) AND contraseña = ?";
        
        try {
            ps = cnx.prepareStatement(sql);
            ps.setString(1, emailODni);
            ps.setString(2, emailODni);
            ps.setString(3, contraseña);
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                // Usuario encontrado - crear objeto Pacientes
                paciente = new Pacientes();
                paciente.setIdPaciente(rs.getInt("dniPaciente"));
                paciente.setNombre(rs.getString("nombre"));
                paciente.setFechaNacimiento(rs.getDate("fechanacimiento"));
                paciente.setGenero(rs.getString("genero"));
                paciente.setTelefono(rs.getString("telefono"));
                paciente.setEmail(rs.getString("mail"));
                paciente.setDomicilio(rs.getString("domicilio"));
                paciente.setCondicionMedica(rs.getString("condicionesmedicas"));
                
                System.out.println("Login exitoso para: " + paciente.getNombre());
            } else {
                System.out.println("Credenciales incorrectas para: " + emailODni);
            }
            
        } catch (SQLException ex) {
            System.err.println("Error al validar login: " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            cerrarRecursos();
        }
        
        return paciente;
    }
     
    public boolean existeEmail(String email) {
        boolean existe = false;
        cnx = ConectaDB.getConection();
        String sql = "SELECT dniPaciente FROM pacientes WHERE mail = ?";
        
        try {
            ps = cnx.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            existe = rs.next();
        } catch (SQLException ex) {
            System.err.println("Error al verificar email: " + ex.getMessage());
        } finally {
            cerrarRecursos();
        }
        
        return existe;
    }
    
    public boolean existeDni(int dni) {
        boolean existe = false;
        cnx = ConectaDB.getConection();
        String sql = "SELECT dniPaciente FROM pacientes WHERE dniPaciente = ?";
        
        try {
            ps = cnx.prepareStatement(sql);
            ps.setInt(1, dni);
            rs = ps.executeQuery();
            existe = rs.next();
        } catch (SQLException ex) {
            System.err.println("Error al verificar DNI: " + ex.getMessage());
        } finally {
            cerrarRecursos();
        }
        
        return existe;
    }
     
    private void cerrarRecursos() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (cnx != null) cnx.close();
        } catch (SQLException ex) {
            System.err.println("Error al cerrar recursos: " + ex.getMessage());
        }
    }
}
