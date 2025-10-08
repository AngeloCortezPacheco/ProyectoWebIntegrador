/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.dto;

public class Citas {
    private int idCItas;
    private int idPaciente;
    private int idDoctor;
    private String fechaCita;
    private String horaCita;
    private String text;

    public Citas(int idCItas, int idPaciente, int idDoctor, String fechaCita, String horaCita, String text) {
        this.idCItas = idCItas;
        this.idPaciente = idPaciente;
        this.idDoctor = idDoctor;
        this.fechaCita = fechaCita;
        this.horaCita = horaCita;
        this.text = text;
    }

    public int getIdCItas() {
        return idCItas;
    }

    public void setIdCItas(int idCItas) {
        this.idCItas = idCItas;
    }

    public int getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(int idPaciente) {
        this.idPaciente = idPaciente;
    }

    public int getIdDoctor() {
        return idDoctor;
    }

    public void setIdDoctor(int idDoctor) {
        this.idDoctor = idDoctor;
    }

    public String getFechaCita() {
        return fechaCita;
    }

    public void setFechaCita(String fechaCita) {
        this.fechaCita = fechaCita;
    }

    public String getHoraCita() {
        return horaCita;
    }

    public void setHoraCita(String horaCita) {
        this.horaCita = horaCita;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
    
    
    
    
}
