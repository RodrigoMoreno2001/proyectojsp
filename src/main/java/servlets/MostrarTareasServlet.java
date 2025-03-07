/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.mycompany.proyectosjsp.DAO.ProyectoDAO;
import com.mycompany.proyectosjsp.DAO.TareaDAO;
import com.mycompany.proyectosjsp.entities.Proyecto;
import com.mycompany.proyectosjsp.entities.Tarea;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MostrarTareasServlet", urlPatterns = {"/MostrarTareasServlet"})
public class MostrarTareasServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Long idProyecto = 2L;
            List<Tarea> tareas = null;
            String idProyectoStr = request.getParameter("idProyecto");
            
            if (!(idProyectoStr == null || idProyectoStr.isEmpty())) Long.parseLong(idProyectoStr);
            
            ProyectoDAO proyectoDAO = new ProyectoDAO();
            TareaDAO tareaDAO = new TareaDAO();

            Proyecto proyecto = proyectoDAO.obtenerProyectoPorId(idProyecto);
            
            if(proyecto!=null) 
                tareas = tareaDAO.obtenerTareasPorProyecto(proyecto);
            
            request.setAttribute("tareas", tareas);

            request.getRequestDispatcher("/mostrarTareas.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }
}
