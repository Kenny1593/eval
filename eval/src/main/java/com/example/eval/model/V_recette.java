package com.example.eval.model;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "v_recette")
public class V_recette {
    @Id
    @Column
    private Integer id;

    @Column
    private Double recette;
    @ManyToOne
    @JoinColumn(name = "idtypeacte")
    private TypeActe typeActe;

    @Column
    private Integer mois;
    @Column
    private Integer annee;

    public TypeActe getTypeActe() {
        return typeActe;
    }

    public void setTypeActe(TypeActe typeActe) {
        this.typeActe = typeActe;
    }

    public Double getRecette() {
        return recette;
    }

    public void setRecette(Double recette) {
        this.recette = recette;
    }


    public Integer getMois() {
        return mois;
    }

    public void setMois(Integer mois) {
        this.mois = mois;
    }

    public Integer getAnnee() {
        return annee;
    }

    public void setAnnee(Integer annee) {
        this.annee = annee;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "V_recette{" +
                " id=" + id +
                ", recette=" + recette +
                ", mois=" + mois +
                ", annee=" + annee +
                '}';
    }
}
