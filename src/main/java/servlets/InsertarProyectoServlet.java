package servlets;

import com.mycompany.proyectosjsp.DAO.ProyectoDAO;
import com.mycompany.proyectosjsp.entities.Proyecto;
import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InsertarProyectoServlet")
public class InsertarProyectoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String nombreProyecto = request.getParameter("nombreProyecto");
        String descripcion = request.getParameter("descripcion");

        LocalDate fechaInicio = LocalDate.parse(request.getParameter("fechaInicio"));
        LocalDate fechaFin = LocalDate.parse(request.getParameter("fechaFin"));

        String estado = request.getParameter("estado");

        Proyecto proyecto = new Proyecto(nombreProyecto, descripcion, fechaInicio, fechaFin, estado);

        ProyectoDAO proyectoDAO = new ProyectoDAO();
        proyectoDAO.insertarProyecto(proyecto);

        response.sendRedirect("/proyectosjsp/insertarProyectos.jsp");
    }
}