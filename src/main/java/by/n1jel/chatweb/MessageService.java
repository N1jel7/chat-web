package by.n1jel.chatweb;

import by.n1jel.chatweb.dto.Message;

import java.util.List;

public interface MessageService {
    List<Message> getMessages();
    void saveMessage(Message message);
}
