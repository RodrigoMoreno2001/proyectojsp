<%@page import="com.mycompany.proyectosjsp.entities.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.proyectosjsp.entities.Tarea"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles2.css">
        <title>Lista de Tareas</title>
    </head>
    <body>
        <h2>Lista de Tareas</h2>
        <form action="MostrarTareasServlet" method="GET">
            <label for="estado">Filtrar por estado:</label>
            <select name="estado" id="estado">
                <option value="en curso">En curso</option>
                <option value="completado">Completado</option>
            </select>
            <button type="submit">Filtrar</button>
        </form>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Descripción</th>
                    <th>Responsable</th>
                    <th>Fecha Inicio</th>
                    <th>Fecha Fin</th>
                    <th>Nombre Proyecto</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Tarea> tareas = (List<Tarea>) request.getAttribute("tareas");

                    if (tareas != null && !tareas.isEmpty()) {
                        for (Tarea tarea : tareas) {
                %>
                    <tr>
                        <td><%= tarea.getId()%></td>
                        <td><%= tarea.getDescripcionTarea() %></td>
                        <td><%= tarea.getResponsable() %></td>
                        <td><%= tarea.getFechaInicio() %></td>
                        <td><%= tarea.getFechaFin() %></td>
                        <td><%= tarea.getProyecto().getNombreProyecto()%></td>
                        <td><%= tarea.getEstado() %></td>
                        <%  
                            if(Usuario.nombre.equalsIgnoreCase("admin")){
                        %>
                        <td>    
                            <form action="EliminarTareaServlet" method="POST">
                                <input type="hidden" name="idTarea" value="<%= tarea.getId() %>">
                                <button type="submit">Eliminar</button>
                            </form>
                        </td>
                        <% } %>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="5">No hay tareas disponibles.</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <a href="/proyectosjsp/insertarTareas.jsp"><h2>Insertar Tareas</h2></a>
        <a href="menu.jsp">Volver al menu</a>
    </body>
</html>
