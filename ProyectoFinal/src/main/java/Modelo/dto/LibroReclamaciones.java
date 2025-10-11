package Modelo.dto;

public class LibroReclamaciones {
    private int idreclamo;
    private String Nombre;
    private String domcilio;
    private int dni;
    private String telefono;
    private String mail;
    private String detalles;

    public LibroReclamaciones(int idreclamo, String Nombre, String domcilio, int dni, String telefono, String mail, String detalles) {
        this.idreclamo = idreclamo;
        this.Nombre = Nombre;
        this.domcilio = domcilio;
        this.dni = dni;
        this.telefono = telefono;
        this.mail = mail;
        this.detalles = detalles;
    }

    public int getIdreclamo() {
        return idreclamo;
    }

    public void setIdreclamo(int idreclamo) {
        this.idreclamo = idreclamo;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getDomcilio() {
        return domcilio;
    }

    public void setDomcilio(String domcilio) {
        this.domcilio = domcilio;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getDetalles() {
        return detalles;
    }

    public void setDetalles(String detalles) {
        this.detalles = detalles;
    }
    
    
}
