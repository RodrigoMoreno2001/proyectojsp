<%-- 
    Document   : newjsp
    Created on : 4 mar 2025, 22:56:01
    Author     : rodri
--%>

<%@page import="com.mycompany.proyectosjsp.util.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles3.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="container">
            <h2>Formulario de Inserción de Proyecto</h2>
            <form action="InsertarProyectoServlet" method="POST">
                <label for="nombreProyecto">Nombre del Proyecto:</label>
                <input type="text" id="nombreProyecto" name="nombreProyecto" required>

                <label for="descripcion">Descripción:</label>
                <input id="descripcion" name="descripcion"></input>

                <label for="fechaInicio">Fecha de Inicio:</label>
                <input type="date" id="fechaInicio" name="fechaInicio" required>

                <label for="fechaFin">Fecha de Fin:</label>
                <input type="date" id="fechaFin" name="fechaFin">
                <div class="horizontal">
                    <label for="estado">Estado:</label>
                    <select id="estado" name="estado" required>
                        <option value="en curso">En curso</option>
                        <option value="completado">Completado</option>
                    </select>
                </div>

                <button class="boton" type="submit">Insertar Proyecto</button>
            </form>

            <a class="boton" href="menu.jsp">Volver al menu</a>
        </div>
    </body>
</html>
