<%@page import="com.mycompany.proyectosjsp.entities.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.proyectosjsp.entities.Proyecto"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles3.css">
        <title>Listado de Proyectos</title>
    </head>
    <body>
        <div id="container">
            <h2 class="titulo">Lista de Proyectos</h2>

            <form action="MostrarProyectosServlet" method="GET">
                <div class="horizontal">
                    <label for="estado">Filtrar por estado:</label>
                    <select name="estado" id="estado">
                        <option value="en curso">En curso</option>
                        <option value="completado">Completado</option>
                    </select>
                    <button class="boton" type="submit">Filtrar</button>
                </div>
            </form>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
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
                        if(proyectos!=null && !proyectos.isEmpty()){
                            for (Proyecto proyecto : proyectos) {
                    %>
                    <tr>
                        <td><%= proyecto.getId()%></td>
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
                                <button class="botonEliminar" type="submit">Eliminar</button>
                            </form>
                        </td>
                        <%     
                                } 
                        %>
                    </tr>
                    <%      
                            }
                       } 
                    %>
                </tbody>
            </table>
            <div class="horizontal">
                <a class="boton" href="/proyectosjsp/insertarProyectos.jsp">Insertar Proyectos</a>
                <a class="boton" href="menu.jsp">Volver al menu</a>
            </div>
        </div>
    </body>
</html>
