
package servlets;

import com.mycompany.proyectosjsp.DAO.ProyectoDAO;
import com.mycompany.proyectosjsp.DAO.TareaDAO;
import com.mycompany.proyectosjsp.entities.Proyecto;
import com.mycompany.proyectosjsp.entities.Tarea;
import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "InsertarTareaServlet", urlPatterns = {"/InsertarTareaServlet"})
public class InsertarTareaServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Long idProyecto = Long.parseLong(request.getParameter("idProyecto"));
        String descripcion = request.getParameter("descripcion");
        String responsable = request.getParameter("responsable");
        LocalDate fechaInicio = LocalDate.parse(request.getParameter("fechaInicio"));
        LocalDate fechaFin = LocalDate.parse(request.getParameter("fechaFin"));
        String estado = request.getParameter("estado");

        ProyectoDAO proyectoDAO = new ProyectoDAO();
        Proyecto proyecto = proyectoDAO.obtenerProyectoPorId(idProyecto);

        Tarea tarea = new Tarea(proyecto, descripcion, responsable, fechaInicio, fechaFin, estado);

        TareaDAO tareaDAO = new TareaDAO();
        tareaDAO.insertarTarea(tarea);

        response.sendRedirect("insertarTareas.jsp"); 

    }   
}
