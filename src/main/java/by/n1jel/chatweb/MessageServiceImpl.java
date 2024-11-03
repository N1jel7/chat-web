package by.n1jel.chatweb;

import by.n1jel.chatweb.dto.Message;

import java.util.ArrayList;
import java.util.List;

public class MessageServiceImpl implements MessageService{
    private final List<Message> messages = new ArrayList<>(List.of(
            new Message("Antoxa", "Work hard"),
            new Message("Barossa", "Play hard"),
            new Message("Anonymous", "Hello...123..!")
    ));

    @Override
    public List<Message> getMessages() {
        return new ArrayList<>(messages);
    }

    @Override
    public void saveMessage(Message message) {
        messages.add(message);
    }
}
