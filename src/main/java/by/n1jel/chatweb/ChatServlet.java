package by.n1jel.chatweb;

import by.n1jel.chatweb.dto.Message;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "chatMessages", value = "/chat")
public class ChatServlet extends HttpServlet {
    private MessageService messageService;

    public void init() {
        messageService = new MessageServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Message message = new Message((String) req.getSession().getAttribute("user"), req.getParameter("content"));
        messageService.saveMessage(message);
        doGet(req, resp);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("messages", messageService.getMessages());
        request.getRequestDispatcher("/pages/chat.jsp").forward(request, response);
    }

    public void destroy() {
    }
}