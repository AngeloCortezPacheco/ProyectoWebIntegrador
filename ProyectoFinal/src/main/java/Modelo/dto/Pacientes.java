package Modelo.dto;

public class Pacientes {
    private int idPaciente;
    private String Nombre;
    private String domicilio;
    private String fechaNacimiento;
    private String Genero;
    private String Email;
    private String Telefono;
    private String CondicionMedica;

    public Pacientes(int idPaciente, String Nombre, String domicilio, String fechaNacimiento, String Genero, String Email, String Telefono, String CondicionMedica) {
        this.idPaciente = idPaciente;
        this.Nombre = Nombre;
        this.domicilio = domicilio;
        this.fechaNacimiento = fechaNacimiento;
        this.Genero = Genero;
        this.Email = Email;
        this.Telefono = Telefono;
        this.CondicionMedica = CondicionMedica;
    }

    public String getDomicilio() {
        return domicilio;
    }

    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }

    public String getCondicionMedica() {
        return CondicionMedica;
    }

    public void setCondicionMedica(String CondicionMedica) {
        this.CondicionMedica = CondicionMedica;
    }
   
    public int getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(int idPaciente) {
        this.idPaciente = idPaciente;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }
    
    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getGenero() {
        return Genero;
    }

    public void setGenero(String Genero) {
        this.Genero = Genero;
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
