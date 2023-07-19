package com.example.eval.model;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "detailactepatient")
public class DetailActePatient {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column
    private Double montant;

    @ManyToOne
    @JoinColumn(name = "idtypeacte")
    private TypeActe typeActe;
    @ManyToOne
    @JoinColumn(name = "idFacture")
    private Facture facture;



    public void setId(Integer id) {
        this.id = id;
    }

    public void setMontant(Double montant) {
        this.montant = montant;
    }

    public void setTypeActe(TypeActe typeActe) {
        this.typeActe = typeActe;
    }

    public Integer getId() {
        return id;
    }

    public Double getMontant() {
        return montant;
    }

    public TypeActe getTypeActe() {
        return typeActe;
    }

    public Facture getFacture() {
        return facture;
    }

    public void setFacture(Facture facture) {
        this.facture = facture;
    }



    @Override
    public String toString() {
        return "DetailActePatient{" +
                "id=" + id +
                ", montant=" + montant +
                ", typeActe=" + typeActe +
                ", facture=" + facture +
                '}';
    }

    public DetailActePatient() {
    }


}
