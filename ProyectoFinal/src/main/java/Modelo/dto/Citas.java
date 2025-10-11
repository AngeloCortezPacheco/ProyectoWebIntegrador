/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.dto;

public class Citas {
    private int idCItas;
    private String Paciente;
    private int dniPaciente;
    private String fechaCita;
    private String horaCita;
    private String text;

    public Citas(int idCItas, String Paciente, String fechaCita, String horaCita, String text) {
        this.idCItas = idCItas;
        this.Paciente = Paciente;
        this.fechaCita = fechaCita;
        this.horaCita = horaCita;
        this.text = text;
    }

    public Citas(int dniPaciente, String fechaCita, String horaCita, String text) {
        this.dniPaciente = dniPaciente;
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

    public String getPaciente() {
        return Paciente;
    }

    public void setPaciente(String Paciente) {
        this.Paciente = Paciente;
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

    public int getDniPaciente() {
        return dniPaciente;
    }

    public void setDniPaciente(int dniPaciente) {
        this.dniPaciente = dniPaciente;
    }
    
    

    
    
}
