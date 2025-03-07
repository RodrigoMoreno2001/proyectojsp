/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.proyectosjsp.DAO;

import com.mycompany.proyectosjsp.entities.Proyecto;
import com.mycompany.proyectosjsp.util.HibernateUtil;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Query;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author rodri
 */
public class ProyectoDAO {
    
    public void insertarProyecto(Proyecto proyecto){
        
        try(Session session=HibernateUtil.getSessionFactory().openSession();){
            Transaction trans = session.beginTransaction(); 
            session.persist(proyecto); 
            trans.commit();
        }         
    }  
    
    public List<Proyecto> obtenerProyectosPorEstado(String estado){
        
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Proyecto p WHERE p.estado = :estado", Proyecto.class)
                    .setParameter("estado", estado)
                    .getResultList();
        }
    }  
    
    public Proyecto obtenerProyectoPorId(Long id){
        
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Proyecto p WHERE id = :id", Proyecto.class)
                    .setParameter("id", id)
                    .getSingleResult();
        }catch (NoResultException e) {
        return null; 
        }
    }
    
    public void borrarProyecto(Proyecto proyecto){

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction trans=session.beginTransaction();
            session.remove(proyecto);
            trans.commit();
        } 
    }
}
