package Modelo.dto;


public class Doctores {
    private int idDoctor;
    private String Nombre;
    private String Especialidad;
    private String Email;
    private String Telefono;

    public Doctores(int idDoctor, String Nombre, String Especialidad, String Email, String Telefono) {
        this.idDoctor = idDoctor;
        this.Nombre = Nombre;
        this.Especialidad = Especialidad;
        this.Email = Email;
        this.Telefono = Telefono;
    }

    public int getIdDoctor() {
        return idDoctor;
    }

    public void setIdDoctor(int idDoctor) {
        this.idDoctor = idDoctor;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getEspecialidad() {
        return Especialidad;
    }

    public void setIdEspecialidad(String Especialidad) {
        this.Especialidad = Especialidad;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }
    
    
    
}
