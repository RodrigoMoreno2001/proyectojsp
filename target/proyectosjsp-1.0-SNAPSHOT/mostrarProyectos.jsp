<%@page import="com.mycompany.proyectosjsp.entities.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.proyectosjsp.entities.Proyecto"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles2.css">
        <title>Listado de Proyectos</title>
    </head>
    <body>
        <h2>Lista de Proyectos</h2>
        
        <form action="MostrarProyectosServlet" method="GET">
            <label for="estado">Filtrar por estado:</label>
            <select name="estado" id="estado">
                <option value="en curso">En curso</option>
                <option value="completado">Completado</option>
            </select>
            <button type="submit">Filtrar</button>
        </form>

        <table>
            <thead>
                <tr>
                    <th>Nombre Proyecto</th>
                    <th>Descripción</th>
                    <th>Fecha Inicio</th>
                    <th>Fecha Fin</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Proyecto> proyectos = (List<Proyecto>) request.getAttribute("proyectos");
                    if(proyectos==null) return;
                    for (Proyecto proyecto : proyectos) {
                %>
                <tr>
                    <td><%= proyecto.getNombreProyecto() %></td>
                    <td><%= proyecto.getDescripcion() %></td>
                    <td><%= proyecto.getFechaInicio() %></td>
                    <td><%= proyecto.getFechaFin() %></td>
                    <td><%= proyecto.getEstado() %></td>

                    <%  
                        if(Usuario.nombre.equalsIgnoreCase("admin")){
                    %>
                    <td>    
                        <form action="EliminarProyectosServlet" method="POST">
                            <input type="hidden" name="idProyecto" value="<%= proyecto.getId() %>">
                            <button type="submit">Eliminar</button>
                        </form>
                    </td>
                    <% } %>
                </tr>
                <% } %>
            </tbody>
        </table>
        <a href="/proyectosjsp/insertarProyectos.jsp"><h2>Insertar Proyectos</h2></a>
        <a href="menu.jsp">Volver al menu</a>
    </body>
</html>
