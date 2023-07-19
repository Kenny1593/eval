
create or replace view v_annee as(select generate_series(2000,2023) as annee);
create or replace view v_mois as(select generate_series(1,12) as mois);


create or replace view v_date as(
                                select vv.*,va.* from v_mois vv cross join v_annee va
                                    );


create or replace view v_depense as(select row_number() over () as id ,d.idtypedepense as idTypeDepense,date_part('month',d.date) mois,date_part('year',d.date) annee,sum(d.montant) depense from depense d group by annee,mois,idtypedepense);


create or replace view v_detail as(select d.*,f.date from detailactepatient d join facture f on f.id = d.idfacture);


create or replace view v_recette as(select row_number() over () as id ,d.idtypeacte,date_part('month',d.date) mois,date_part('year',d.date) annee,sum(montant) recette from v_detail d group by annee,mois,idtypeacte);


create or replace view repere_type as(select t.id,v_date.* from typeacte t cross join v_date);
create or replace view repere_Depense as(select t.id,v_date.* from typedepense t cross join v_date);



create or replace view v_vraiDep as(
select row_number() over () id,coalesce(vr.idTypeDepense,d.id) as idDepense,coalesce(vr.depense,0) as depense,coalesce(vr.mois,d.mois) as mois,coalesce(vr.annee,d.annee) as annee
from v_depense vr full join
repere_Depense d on vr.idtypedepense=d.id and vr.annee=d.annee and vr.mois=d.mois
);



create or replace view v_vraiRecette as(
select row_number() over () id,coalesce(vr.idtypeacte,d.id) as idtypeacte,coalesce(vr.recette,0) as recette,coalesce(vr.mois,d.mois) as mois,coalesce(vr.annee,d.annee) as annee
from v_Recette vr full join
    repere_type d on vr.idtypeacte=d.id and vr.annee=d.annee and vr.mois=d.mois);








