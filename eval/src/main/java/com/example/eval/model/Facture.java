package com.example.eval.model;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "facture")
public class Facture {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    @JoinColumn(name = "idpatient")
    private Patient patient;
    @Column
    private Date date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Facture{" +
                "id=" + id +
                ", patient=" + patient +
                ", date=" + date +
                '}';
    }
}
