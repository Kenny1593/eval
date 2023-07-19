package com.example.eval.model;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "v_vraiDep")
public class V_depense {
    @Id
    @Column
    private Integer id;
    @Column(name = "depense")
    private Double depense;

    @Column
    private Integer mois;
    @Column
    private Integer annee;

    @ManyToOne
    @JoinColumn(name = "idDepense")
    private TypeDepense typeDepense;

    public Double getDepense() {
        return depense;
    }

    public void setDepense(Double depenses) {
        this.depense = depenses;
    }

    public TypeDepense getTypeDepense() {
        return typeDepense;
    }

    public void setTypeDepense(TypeDepense typeDepense) {
        this.typeDepense = typeDepense;
    }

    @Override
    public String toString() {
        return "V_depense{" +
                "id=" + id +
                ", Typedepense=" + typeDepense +
                ", mois=" + mois +
                ", annee=" + annee +
                ", Depense=" + depense +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAnnee() {
        return annee;
    }

    public void setAnnee(Integer annee) {
        this.annee = annee;
    }

    public Integer getMois() {
        return mois;
    }

    public void setMois(Integer mois) {
        this.mois = mois;
    }





}
