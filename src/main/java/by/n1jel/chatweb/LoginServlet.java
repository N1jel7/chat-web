package by.n1jel.chatweb;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("user", req.getParameter("user"));
        List<String> usernames = (List<String>) getServletContext().getAttribute("onlineUsers");
        if (usernames == null) {
            usernames = new ArrayList<>();
        }

        usernames.add(req.getParameter("user"));
        req.getServletContext().setAttribute("onlineUsers", usernames);


        doGet(req, resp);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/").forward(request, response);

    }

    public void destroy() {
    }
}