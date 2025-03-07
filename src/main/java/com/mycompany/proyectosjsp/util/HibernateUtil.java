package com.mycompany.proyectosjsp.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
/**
 * Clase de utilidad para gestionar la configuración de Hibernate y la creación de la sesión de base de datos.
 * Proporciona un metodo estático para obtener una instancia de `SessionFactory`, que es utilizada para interactuar
 * con la base de datos a través de Hibernate.
 */
public class HibernateUtil {

    /**
     * Obtiene una instancia de `SessionFactory` configurada con los parámetros especificados en el archivo de configuración
     * de Hibernate (hibernate.cfg.xml). Esta instancia es utilizada para abrir sesiones de base de datos.
     *
     * @return Una instancia de `SessionFactory`, que es utilizada para abrir sesiones con la base de datos.
     */

    public static SessionFactory getSessionFactory(){
        Configuration configuration = new Configuration();
        configuration.configure();
        return configuration.buildSessionFactory();
    }
}