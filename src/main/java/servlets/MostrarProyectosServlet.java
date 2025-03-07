package servlets;

import com.mycompany.proyectosjsp.DAO.ProyectoDAO;
import com.mycompany.proyectosjsp.entities.Proyecto;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import javax.swing.JOptionPane;

@WebServlet("/MostrarProyectosServlet")
public class MostrarProyectosServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String estado = request.getParameter("estado");
        
        if (estado == null || estado.isEmpty()) estado = "en curso";

        ProyectoDAO proyectoDAO = new ProyectoDAO();
        List<Proyecto> proyectos = proyectoDAO.obtenerProyectosPorEstado(estado);

        request.setAttribute("proyectos", proyectos);
        
        request.getRequestDispatcher("/mostrarProyectos.jsp").forward(request, response);
    }
}
