<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles2.css">
        <title>Login</title>
    </head>
    <body>
        <div id="container">
            <h2 class="titulo">Iniciar Sesión</h2>
            <form action="LoginServlet" method="post">
                <label for="usuario:">Usuario:</label>
                <input type="text" id="usuario" name="usuario" required>
                <label for="pass">Contraseña:</label>
                <input type="password" id="pass" name="pass" required>
                <input class="boton" type="submit" value="Iniciar Sesion">
            </form>
        </div>
    </body>
</html>