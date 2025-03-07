
package com.mycompany.proyectosjsp.DAO;

import com.mycompany.proyectosjsp.entities.Proyecto;
import com.mycompany.proyectosjsp.entities.Tarea;
import com.mycompany.proyectosjsp.util.HibernateUtil;
import jakarta.persistence.NoResultException;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class TareaDAO {
    
    public void insertarTarea(Tarea tarea){
        try(Session session=HibernateUtil.getSessionFactory().openSession();){
            Transaction trans = session.beginTransaction(); 
            session.persist(tarea); 
            trans.commit();
        }         
    }  
    
    public List<Tarea> obtenerTareas(){
        
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Tarea",Tarea.class)
                    .getResultList();
        }
    }
    
    public List<Tarea> obtenerTareasPorProyecto(Proyecto proyecto){
        
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Tarea t WHERE t.proyecto.id = :idProyecto", Tarea.class)
                    .setParameter("idProyecto", proyecto.getId())
                    .getResultList();
        }
    }
    
    public Tarea obtenerTareasPorId(Long idTarea){
        
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Tarea t WHERE t.id = :idTarea", Tarea.class)
                    .setParameter("idTarea", idTarea)
                    .getSingleResult();
        }catch (NoResultException e) {
        return null; 
        }
    }
    
    
    public void borrarTarea(Tarea tarea){

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction trans=session.beginTransaction();
            session.remove(tarea);
            trans.commit();
        } 
    }
}
