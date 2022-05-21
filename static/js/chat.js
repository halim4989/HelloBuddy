// chat.js
(function ($) {
    "use strict";

    let userName = $("#current_username").text().split(" ")[1];


    function getID() {
        $.ajax({
            type:"GET",
            url:"/getchatid/",
              success: function(data){
                // alert("i got data now i will parse it as i want to display it");
                // alert(data);
                return data;
              }
              
            });
        
    }



    function printMessage(sender, message, sendTime) {
        if ($.trim(message) == "") {
            return false;
        }

        let className = sender === userName ? "sent" : "replies";
        // console.log("{{user}}")
        // console.log(className)

        $(
            `<li class= ${className} style="overflow-wrap: break-word">       
        
        <p>
          ${message}<br> 
          <small>
        ${sendTime} 
       </small>
       </p>
       </li>`
        ).appendTo($("#messages-box ul"));

        $("#messages-box").animate(
            {
                scrollTop:
                    $("#messages-box").prop("scrollHeight") - $("#messages-box").height(),
            },
            0
        );
    }

    function findTime(timeStamp) {
        let prefix = "";
        const timeDiff = Math.round(
            (new Date().getTime() - new Date(timeStamp).getTime()) / 60000
            // in minute
        );
        if (timeDiff < 1) {
            // less than one minute ago
            prefix = "just now...";
        } else if (timeDiff < 60 && timeDiff >= 1) {
            // less than sixty minutes ago
            prefix = `${timeDiff} minutes ago`;
        } else if (timeDiff < 24 * 60 && timeDiff >= 60) {
            // less than 24 hours ago
            prefix = `${Math.round(timeDiff / 60)} hours ago`;
        } else if (timeDiff < 7 * 24 * 60 && timeDiff >= 24 * 60) {
            // less than 7 days ago
            prefix = `${Math.round(timeDiff / (60 * 24))} days ago`;
        } else {
            // prefix = `${new Date(timeStamp)}`;
            prefix =
                new Date(timeStamp).toLocaleTimeString() +
                "<br>" +
                new Date(timeStamp).toDateString();
            // '7:29:22 PM'
            // 'Fri Apr 01 2022'
        }
        return prefix;
    }


    // {% if user.is_authenticated %}
    let roomName = userName;
    // let roomName = getID();


    // WebSocket connection
    let chatSocket;
    if (window.location.protocol == "https:") {
        // checks If HTTPs or not
        chatSocket = new WebSocket(
        // chatSocket = new ReconnectingWebSocket(
            "wss://" + window.location.host + "/ws/livechat/" + roomName + "/"
        );
    } else {
        chatSocket = new WebSocket(
        // chatSocket = new ReconnectingWebSocket(
            "ws://" + window.location.host + "/ws/livechat/" + roomName + "/"
        );
    }
    // {% endif %}


    chatSocket.onmessage = function (e) {
        const data = JSON.parse(e.data);
        // console.log(e);
        // console.log(data);
        let sendtime = findTime(data.date);
        // console.log(sendtime);

        printMessage(data.sender, data.message, sendtime);
    };

    chatSocket.onclose = function (e) {
        console.error("Chat socket closed unexpectedly");
        console.error(e.data);
    };




    function sendMessage(message) {
        let sender = userName;
        // message = $("#message-input").val();
        if ($.trim(message) == "") {
            return false;
        }

        // clear message
        $("#message-input-one").val(null);
        $("#message-input-two").val(null);

        // sending message into websocket
        chatSocket.send(
            JSON.stringify({
                sender: sender,
                message: message,
            })
        );
        // console.log('msg msg');
        // console.log(sender);
        // console.log(message);
    }


    $("#send-msg-now-one").click(function () {
        // console.log('one');
        let message = $("#message-input-one").val();
        // message = document.getElementById("message-input-one").value
        // console.log(message);
        sendMessage(message);
    });
    $("#send-msg-now-two").click(function () {
        console.log('two');
        let message = $("#message-input-two").val();
        sendMessage(message);
    });



    $("#message-input-one").on("keyup", function (e) {
        if (e.which == 13) {
            let message = $("#message-input-one").val();
            sendMessage(message);
            // return false;
        }
    });
    $("#message-input-two").on("keyup", function (e) {
        if (e.which == 13) {
            let message = $("#message-input-two").val();
            sendMessage(message);
            // return false;
        }
    });


})(jQuery);
