package com.example.eval.service;


import com.example.eval.dao.HibernateDao;
import com.example.eval.model.Depense;

import com.example.eval.model.TypeDepense;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;

@Service
public class DateService
{
    @Autowired
    private HibernateDao dao;

    public Boolean checkMois(int jour,int[] mois,int annee)
    {
        LocalDate date = null;
        for(int i=0;i<mois.length;i++)
        {
            date = LocalDate.of(annee,mois[i],1);
            int daysMonth = date.lengthOfMonth();
            return (jour <= daysMonth && jour>0);
        }
        return false;
    }

    public void inseretDepense(int jour,int[] mois,int annee,double valeur,int iddepensetype) throws Exception
    {
        if(!checkMois(jour,mois,annee))
        {
            throw new Exception("Jour non valide");
        };
        for(int x : mois){
            Depense depense = new Depense();
            TypeDepense type = new TypeDepense();
            type.setId(iddepensetype);
            depense.setTypeDepense(type);

            depense.setMontant(valeur);
            depense.setDate(Date.valueOf(LocalDate.of(annee,x,jour)));
            dao.create(depense);
        }
    }
}
