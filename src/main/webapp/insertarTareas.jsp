<%@page import="com.mycompany.proyectosjsp.DAO.ProyectoDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.proyectosjsp.entities.Proyecto"%>
<%@page import="com.mycompany.proyectosjsp.entities.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles3.css">
    <title>Insertar Tarea</title>
</head>
<body>
    <div id="container">
        <h2>Formulario de Inserción de Tarea</h2>

        <form action="InsertarTareaServlet" method="POST">
            <div class="horizontal">
                <label for="descripcion">ID del proyecto:</label>
                <select name="idProyecto" id="idProyecto">
                    <%
                    ProyectoDAO proyectoDAO = new ProyectoDAO();
                    List<Proyecto> Proyectos =proyectoDAO.obtenerProyectos();
                    for(Proyecto aux:Proyectos){
                        String id = String.valueOf(aux.getId());
                    %>
                    <option value=<%= id %>><%= id %></option>
                    <% } %>
                </select>
            </div>

            <label for="descripcion">Descripción:</label>
            <input id="descripcion" name="descripcion" required></input>

            <label for="responsable">Responsable:</label>
            <input type="text" id="responsable" name="responsable" required>

            <label for="fechaInicio">Fecha de Inicio:</label>
            <input type="date" id="fechaInicio" name="fechaInicio" required>

            <label for="fechaFin">Fecha de Fin:</label>
            <input type="date" id="fechaFin" name="fechaFin">
            <div class="horizontal">
                <label for="estado">Estado:</label>
                <select id="estado" name="estado" required>
                    <option value="pendiente">Pendiente</option>
                    <option value="en progreso">En progreso</option>
                    <option value="completada">Completada</option>
                </select>
            </div>

            <button class="boton" type="submit">Insertar Tarea</button>
        </form>
                
            <a class="boton" href="menu.jsp">Volver al menu</a>
    </div>
</body>
</html>
