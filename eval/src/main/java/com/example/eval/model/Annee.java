package com.example.eval.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "v_annee")
public class Annee {
    @Id
    @Column
    private Integer annee;

    public Integer getAnnee() {
        return annee;
    }

    public void setAnnee(Integer annee) {
        this.annee = annee;
    }

    @Override
    public String toString() {
        return "Annee{" +
                "annee=" + annee +
                '}';
    }
}
