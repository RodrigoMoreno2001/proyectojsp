<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles2.css">
    <title>Insertar Tarea</title>
</head>
<body>
    <h2>Formulario de Inserción de Tarea</h2>
    
    <form action="InsertarTareaServlet" method="POST">
        <label for="idProyecto">ID del Proyecto:</label>
        <input type="number" id="idProyecto" name="idProyecto" required>

        <label for="descripcion">Descripción:</label>
        <textarea id="descripcion" name="descripcion" required></textarea>

        <label for="responsable">Responsable:</label>
        <input type="text" id="responsable" name="responsable" required>

        <label for="fechaInicio">Fecha de Inicio:</label>
        <input type="date" id="fechaInicio" name="fechaInicio" required>

        <label for="fechaFin">Fecha de Fin:</label>
        <input type="date" id="fechaFin" name="fechaFin">

        <label for="estado">Estado:</label>
        <select id="estado" name="estado" required>
            <option value="pendiente">Pendiente</option>
            <option value="en progreso">En progreso</option>
            <option value="completada">Completada</option>
        </select>

        <button type="submit">Insertar Tarea</button>
    </form>
        <a href="menu.jsp">Volver al menu</a>
</body>
</html>
