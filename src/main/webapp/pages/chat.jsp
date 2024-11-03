<%@ page import="java.util.List" %>
<%@ page import="by.n1jel.chatweb.dto.Message" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="user" content="${sessionScope.user}">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css" type="text/css">
    <title>Чат с переключателем тем</title>
</head>
<body class="light">
<div class="header">
    <div>Веб-чат</div>
    <div>Добро пожаловать, ${sessionScope.user}</div>
    <div></div>
    <button class="theme-toggle" onclick="toggleTheme()">Тёмная тема</button>
</div>
<div class="main-container">
    <div id="online-users" class="sidebar light">
        <div class="sidebar-header">Пользователи онлайн</div>
        <c:forEach var="user" items="${applicationScope.onlineUsers}">
            <div class="user">
                <div class="avatar" style="background-image: url('https://via.placeholder.com/40');"></div>
                <div class="username"> ${user} </div>
            </div>
        </c:forEach>
    </div>

    <div class="chat-container light">
        <div id="chat-messages" class="chat-messages">
            <c:forEach var="message" items="${requestScope.messages}" >
                <c:choose>
                    <c:when test="${sessionScope.user == message.sender}">
                        <div class="message user light">
                            <div class="avatar" style="background-image: url('https://via.placeholder.com/40/0078ff');"></div>
                            <div class="message-content">
                                <div class="name"> ${message.sender} </div>
                                <div> ${message.content}</div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="message bot light">
                            <div class="avatar" style="background-image: url('https://via.placeholder.com/40');"></div>
                            <div class="message-content">
                                <div class="name"> ${message.sender} </div>
                                <div> ${message.content}</div>
                            </div>
                        </div>
                    </c:otherwise>
            </c:choose>
            </c:forEach>

        </div>
        <form id="message-form" onsubmit="return;">
            <div class="chat-input">
                <input id="content-input" name="content" type="text" placeholder="Введите сообщение...">
                <button type="button" id="send-button">Отправить</button>
            </div>
        </form>
    </div>
</div>
<div id="bottom"></div>

<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>