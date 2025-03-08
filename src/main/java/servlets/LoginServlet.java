/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.mycompany.proyectosjsp.entities.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rodri
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String usuario = request.getParameter("usuario");
        String pass = request.getParameter("pass");
        
        if(comprobarCredenciales(usuario, pass))
            response.sendRedirect("menu.jsp");
        else  
            response.sendRedirect("index.jsp");        
    }
    
    private boolean comprobarCredenciales(String usuario, String pass){
        
        Usuario.nombre = null;
        
        if(usuario.equalsIgnoreCase("user") && pass.equalsIgnoreCase("user")) Usuario.nombre="user";
        else if(usuario.equalsIgnoreCase("admin") && pass.equalsIgnoreCase("admin")) Usuario.nombre="admin";
        return Usuario.nombre != null;
    }
}
