package com.example.eval.dao;

import com.example.eval.model.*;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;


import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;


//Hibernate 3.0
public class HibernateDao {

    private SessionFactory sessionFactory;

    public <T> List<T> findAllPub(Class<T> tClass, int id_pub){
        Session session = null;
        try {
            session = sessionFactory.openSession();
            List<T> results = session.createCriteria(tClass)
                    .add(Restrictions.sqlRestriction("id_pub="+id_pub))
                    .list();

            return results;
        } catch (Exception e) {
            throw e;
        } finally {
            if (session != null) session.close();
        }

    }

    public <T> T create(T entity) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.saveOrUpdate(entity);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            throw e;
        } finally {
            if (session != null) session.close();
        }
        return entity;
    }

    public <T> T findById(Class<T> clazz,Serializable id){
        Session session = null;
        try {
            session = sessionFactory.openSession();
            T entity = (T) session.get(clazz, id);

            return entity;
        } catch (Exception e) {
            throw e;
        } finally {
            if (session != null) session.close();
        }
    }

    public <T> List<T> findAll(Class<T> tClass){
        Session session = null;
        try {
            session = sessionFactory.openSession();
            List<T> results = session.createCriteria(tClass).list();

            return results;
        } catch (Exception e) {
            throw e;
        } finally {
            if (session != null) session.close();
        }

    }

    public <T> List<T> findWhere(T entity){
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Example example = Example.create(entity).ignoreCase();
            List<T> results = session.createCriteria(entity.getClass()).add(example).list();

            return results;
        } catch (Exception e) {
            throw e;
        } finally {
            if (session != null) session.close();
        }

    }

    public <T> List<T> findSceneWhere(Class<T> clazz){
        Session session = sessionFactory.openSession();
        List<T> results = session.createCriteria(clazz)
                .add(Restrictions.sqlRestriction("idstatut<4"))
                .list();
        session.close();
        return results;
    }

    public <T> List<T> paginateWhere (T entity, int offset, int size){
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Example example = Example.create(entity).ignoreCase();
            List<T> results = session.createCriteria(entity.getClass())
                    .add(example)
                    .setFirstResult(offset)
                    .setMaxResults(size).list();

            return results;
        } catch (Exception e) {
            throw e;
        } finally {
            if (session != null) session.close();
        }

    }

    public <T> List<T> paginate(Class<T> clazz, int offset, int size){
        Session session = null;
        try {
            session = sessionFactory.openSession();
            List<T> results = session.createCriteria(clazz)
                    .setFirstResult(offset)
                    .setMaxResults(size).list();

            return results;
        } catch (Exception e) {
            throw e;
        } finally {
            if (session != null) session.close();
        }
    }

    public <T> List<T> paginate(Class<T> clazz, int offset, int size, String orderBy, boolean orderAsc){
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Order order = (orderAsc) ? Order.asc(orderBy) : Order.desc(orderBy);
            List<T> results = session.createCriteria(clazz)
                    .addOrder(order)
                    .setFirstResult(offset)
                    .setMaxResults(size).list();

            return results;
        } catch (Exception e) {
            throw e;
        } finally {
            if (session != null) session.close();
        }

    }
    public Admin trait_log(String nom, String pwd){
        Session  session = sessionFactory.openSession();
        try{
            Criteria criteria = session.createCriteria(Admin.class);
            criteria.add(Restrictions.eq("nom",nom));
            criteria.add(Restrictions.eq("pwd",pwd));
            Admin utilisateur = (Admin) criteria.uniqueResult();
            System.out.println("*******");
            if(utilisateur != null){
                System.out.println("hello");
                return utilisateur;
            }else{
                System.out.println("null");
                return null;
            }
        }finally {
            session.close();
        }
    }

    public Utilisateur trait_logUser(String nom, String pwd){
        Session  session = sessionFactory.openSession();
        try{
            Criteria criteria = session.createCriteria(Utilisateur.class);
            criteria.add(Restrictions.eq("nom",nom));
            criteria.add(Restrictions.eq("pwd",pwd));
            Utilisateur utilisateur = (Utilisateur) criteria.uniqueResult();
            System.out.println("*******");
            if(utilisateur != null){
                System.out.println("hello");
                return utilisateur;
            }else{
                System.out.println("null");
                return null;
            }
        }finally {
            session.close();
        }
    }

    public void deleteById(Class tClass, Serializable id){
        delete(findById(tClass, id));
    }

    public void delete(Object entity){
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.delete(entity);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            throw e;
        } finally {
            if (session != null) session.close();
        }
    }

    public <T> T update(T entity){
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.saveOrUpdate(entity);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            throw e;
        } finally {
            if (session != null) session.close();
        }
        return entity;
    }
    public <T> List<T> findQuery(Class<T> tClass,String query){
        Session session= sessionFactory.openSession();
        List<T> results=session.createNativeQuery(query,tClass).list();
        session.close();
        return results;
    }


/*
    public Taux findDateTaux() throws Exception{
        Session session = null;
        String sql = null;
        Taux result = null;
        try{
            session = sessionFactory.openSession();
            sql = "SELECT * FROM taux WHERE date = ( SELECT MAX(date) FROM taux)";
            result =(Taux) session.createSQLQuery(sql).addEntity(Taux.class).uniqueResult();
        }
        catch (Exception e){
            throw e;
        }
        finally {
            if(session!=null)session.close();
        }
        return result;

    }

    public MontantMax findDateMax() throws Exception{
        Session session = null;
        String sql = null;
        MontantMax result = null;
        try{
            session = sessionFactory.openSession();
            sql = "SELECT * FROM montantmax WHERE date = ( SELECT MAX(date) FROM montantmax)";
            result =(MontantMax) session.createSQLQuery(sql).addEntity(Taux.class).uniqueResult();
        }
        catch (Exception e){
            throw e;
        }
        finally {
            if(session!=null)session.close();
        }
        return result;

    }
    public List<V_solde> paginateBe(int num ) {
        Session session = sessionFactory.openSession();
        int limit =  2;
        int offset = ((num-1)*limit);
        String sql = " SELECT * FROM V_solde OFFSET "+offset+" LIMIT "+limit;
        List<V_solde> liste = session.createSQLQuery(sql).addEntity(V_solde.class).list();
        session.close();
        return  liste;
    }

    public int nombre(){
        Session session = sessionFactory.openSession();
        String sql = "SELECT count(idArticle) from article";
        Query query = session.createSQLQuery(sql);
        BigInteger bigInteger = (BigInteger) query.uniqueResult();
        return bigInteger.intValue();
    }*/







    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}