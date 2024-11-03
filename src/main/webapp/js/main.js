function toggleTheme() {
    const body = document.body;
    body.classList.toggle('dark');
    body.classList.toggle('light');

    const chatContainer = document.querySelector('.chat-container');
    const sidebar = document.querySelector('.sidebar');
    chatContainer.classList.toggle('dark');
    chatContainer.classList.toggle('light');
    sidebar.classList.toggle('dark');
    sidebar.classList.toggle('light');

    // Обновление текста кнопки
    const themeButton = document.querySelector('.theme-toggle');
    themeButton.textContent = body.classList.contains('dark') ? 'Светлая тема' : 'Тёмная тема';
}

function sendMessage() {
    fetch("/chat", {
        method: "POST",
        body: "content=" + document.getElementById("content-input").value + "&user="+ document.querySelector('meta[name="user"]').content,
        headers: {
            "Content-type": "application/x-www-form-urlencoded"
        }
    }).then(async (response) => {
        await response;
        document.getElementById("message-form").reset()
        getMessages()
    })


}

function getMessages() {
    fetch("/chat")
        .then(async (response) => {
            await response;
            setMessages(await response.text())
        })
}

function setMessages(response){
    let responseDocument = new DOMParser().parseFromString(response, "text/html");
    document.getElementById("chat-messages").innerHTML = responseDocument.getElementById("chat-messages").innerHTML
    document.getElementById("online-users").innerHTML = responseDocument.getElementById("online-users").innerHTML
    document.getElementById("bottom").scrollIntoView({behavior: "smooth"})
}

document.getElementById("send-button").addEventListener("click", (e) =>{
    sendMessage()
})

document.getElementById("message-form").addEventListener("submit", (e) => {
    e.preventDefault()
    sendMessage()
})


function repeat(){
    window.setTimeout(() => {
        getMessages()
        repeat()
    }, 500)
}

repeat()



