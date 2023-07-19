package com.example.eval.model;

import javax.persistence.*;

@Entity
@Table(name="typeActe")
public class TypeActe {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column
    private String valeur;
    @Column
    private String code;
    @Column
    private Double budget;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Double getBudget() {
        return budget;
    }

    public void setBudget(Double budget) {
        this.budget = budget;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getValeur() {
        return valeur;
    }

    public void setValeur(String valeur) {
        this.valeur = valeur;
    }

    @Override
    public String toString() {
        return "TypeActe{" +
                "id=" + id +
                ", Valeur='" + valeur + '\'' +
                ", code='" + code + '\'' +
                ", budget=" + budget +
                '}';
    }
}
