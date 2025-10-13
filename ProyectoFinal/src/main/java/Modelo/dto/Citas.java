/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.dto;

import java.sql.Date;
import java.sql.Time;

public class Citas {
    private int idCItas;
    private String Paciente;
    private int dniPaciente;
    private Date fechaCita;
    private Time horaCita;
    private String text;
    private String estado;

    public Citas() {
    }
    
    public Citas(int idCItas, String Paciente, Date fechaCita, Time horaCita, String text, String estado) {
        this.idCItas = idCItas;
        this.Paciente = Paciente;
        this.fechaCita = fechaCita;
        this.horaCita = horaCita;
        this.text = text;
        this.estado=estado;
    }

    public Citas(int dniPaciente, Date fechaCita, Time horaCita, String text) {
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

    public Date getFechaCita() {
        return fechaCita;
    }

    public void setFechaCita(Date fechaCita) {
        this.fechaCita = fechaCita;
    }

    public Time getHoraCita() {
        return horaCita;
    }

    public void setHoraCita(Time horaCita) {
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

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
}
