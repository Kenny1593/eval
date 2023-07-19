package com.example.eval.model;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "depense")
public class Depense {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    @JoinColumn(name = "idTypeDepense")
    private TypeDepense typeDepense;
    @Column
    private Double montant;
    @Column
    private Date date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public TypeDepense getTypeDepense() {
        return typeDepense;
    }

    public void setTypeDepense(TypeDepense typeDepense) {
        this.typeDepense = typeDepense;
    }

    public Double getMontant() {
        return montant;
    }

    public void setMontant(Double montant) {
        this.montant = montant;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Depense{" +
                "id=" + id +
                ", typeDepense=" + typeDepense +
                ", montant=" + montant +
                ", date=" + date +
                '}';
    }
}
