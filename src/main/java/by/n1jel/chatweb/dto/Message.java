package by.n1jel.chatweb.dto;

import java.util.Objects;

public class Message {
    private String sender;
    private String content;

    public Message() {
    }

    public Message(String sender, String content) {
        this.sender = sender;
        this.content = content;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public final boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Message)) return false;

        Message message = (Message) o;
        return Objects.equals(sender, message.sender) && Objects.equals(content, message.content);
    }

    @Override
    public int hashCode() {
        int result = Objects.hashCode(sender);
        result = 31 * result + Objects.hashCode(content);
        return result;
    }

    @Override
    public String toString() {
        return "Message{" +
                "sender='" + sender + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
