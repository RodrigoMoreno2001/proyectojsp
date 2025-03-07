/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.mycompany.proyectosjsp.DAO.ProyectoDAO;
import com.mycompany.proyectosjsp.entities.Proyecto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EliminarProyectosServlet", urlPatterns = {"/EliminarProyectosServlet"})
public class EliminarProyectosServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Long idProyecto = Long.parseLong(request.getParameter("idProyecto"));
            ProyectoDAO proyectoDAO = new ProyectoDAO();
            Proyecto proyecto = proyectoDAO.obtenerProyectoPorId(idProyecto);
            proyectoDAO.borrarProyecto(proyecto);
            response.sendRedirect("MostrarProyectosServlet");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
     
}
