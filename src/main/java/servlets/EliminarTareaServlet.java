package servlets;

import com.mycompany.proyectosjsp.DAO.ProyectoDAO;
import com.mycompany.proyectosjsp.DAO.TareaDAO;
import com.mycompany.proyectosjsp.entities.Proyecto;
import com.mycompany.proyectosjsp.entities.Tarea;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EliminarTareaServlet", urlPatterns = {"/EliminarTareaServlet"})
public class EliminarTareaServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Long idProyecto = Long.parseLong(request.getParameter("idTarea"));
            TareaDAO tareaDAO = new TareaDAO();
            Tarea tarea = tareaDAO.obtenerTareasPorId(idProyecto);
            tareaDAO.borrarTarea(tarea);
            response.sendRedirect("MostrarTareasServlet");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
