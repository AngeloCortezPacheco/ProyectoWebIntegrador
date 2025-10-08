package Modelo.dto;


public class Doctores {
    private int idDoctor;
    private String Nombre;
    private String Apellidos;
    private int idEspecialidad;
    private String Email;
    private String Telefono;

    public Doctores(int idDoctor, String Nombre, String Apellidos, int idEspecialidad, String Email, String Telefono) {
        this.idDoctor = idDoctor;
        this.Nombre = Nombre;
        this.Apellidos = Apellidos;
        this.idEspecialidad = idEspecialidad;
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

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public int getIdEspecialidad() {
        return idEspecialidad;
    }

    public void setIdEspecialidad(int idEspecialidad) {
        this.idEspecialidad = idEspecialidad;
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
