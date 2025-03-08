DROP DATABASE IF EXISTS proyectojsp;
CREATE DATABASE proyectojsp;
USE proyectojsp;

-- No es necesario ejecutar todo el script, las tablas las crea Hibernate

/*
CREATE TABLE proyecto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(255),
    descripcion VARCHAR(255),
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(50)
);

CREATE TABLE tarea (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT NOT NULL,
    descripcion_tarea VARCHAR(255),
    responsable VARCHAR(255),
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(50),
    CONSTRAINT fk_tarea_proyecto FOREIGN KEY (id_proyecto) 
        REFERENCES proyecto(id) ON DELETE CASCADE
);

