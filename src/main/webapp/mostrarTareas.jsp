<%@page import="com.mycompany.proyectosjsp.entities.Proyecto"%>
<%@page import="com.mycompany.proyectosjsp.entities.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.proyectosjsp.entities.Tarea"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles3.css">
        <title>Lista de Tareas</title>
    </head>
    <body>
        <div id="container">
            <h2>Lista de Tareas</h2>

            <form action="MostrarTareasServlet" method="GET">
                <div class="horizontal">
                    <label for="idProyecto">ID de proyecto:</label>
                    <select name="idProyecto" id="idProyecto">
                        <%
                        List<Proyecto> proyectos = (List<Proyecto>) request.getAttribute("proyectos");
                        if(proyectos!=null && !proyectos.isEmpty()){
                            for(Proyecto aux:proyectos){
                                String id = String.valueOf(aux.getId());
                        %>
                        <option value="<%= id %>"><%= id %></option>
                        <%  }
                        }
                        %>
                    </select>
                    <button class="boton" type="submit">Filtrar</button>
                </div>
            </form>

            <table>
                <thead>
                    <tr>
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
                                    <button class="botonEliminar" type="submit">Eliminar</button>
                                </form>
                            </td>
                            <% } %>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="5">No hay tareas disponibles para este proyecto.</td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <div class="horizontal">
                <a class="boton" href="/proyectosjsp/insertarTareas.jsp">Insertar Tareas</a>
                <a class="boton" href="menu.jsp">Volver al menu</a>
            </div>
        </div>
    </body>
</html>
