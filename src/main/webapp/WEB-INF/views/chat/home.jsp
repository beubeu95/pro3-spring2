<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>chating</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
    <style>
        *{ margin: 0; padding: 0; }

        .chat_wrap .header { font-size: 14px; padding: 15px 0; background: #F18C7E; color: white; text-align: center;  }

        .chat_wrap .chat { padding-bottom: 80px; }
        .chat_wrap .chat ul { width: 100%; list-style: none; }
        .chat_wrap .chat ul li { width: 100%; }
        .chat_wrap .chat ul li.left { text-align: left; }
        .chat_wrap .chat ul li.right { text-align: right; }

        .chat_wrap .chat ul li > div { font-size: 13px;  }
        .chat_wrap .chat ul li > div.sender { margin: 10px 20px 0 20px; font-weight: bold; }
        .chat_wrap .chat ul li > div.message { display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555; text-align: left; }

        .chat_wrap .input { position: fixed; bottom: 0; width: 100%; background-color: #FFF; text-align: center; border-top: 1px solid #F18C7E; }
        .chat_wrap .input > textarea { width: 100%; height: 80px; border: none; padding: 10px; }

        .format { display: none; }
    </style>
</head>
<body>
<nav>
    <a href="${path1}/chat/home" >HOME</a>
    <a href="${path1}/chat/allRoom">채팅목록</a>
    <a href="${path1}/chat/createRoom">채팅창 만들기</a>
</nav>
<div class="chat_wrap">
    <div class="header">
        CHAT
    </div>
    <div class="chat">
        <ul id="res">
        </ul>
    </div>
    <div class="input">
        <textarea placeholder="메시지 작성" id="msg" style="width: 1600px; height: 140px;"></textarea>
        <button id="btn" type="button" style="float: right; width: 250px; height: 160px; background-color: #F18C7E; color:#ffffff; font-weight:bolder;">전송</button>
    </div>
    <script>
        $(document).ready(function(){
            $("#btn").click(function() {
                var test = {"msg":$("#msg").val() };
                $.ajax({
                    type:"post",
                    url:"${path1}/chat/chatpro",
                    data:JSON.stringify(test),
                    dataType:"json",
                    contentType: "application/json",
                    success:function(res) {
                        console.log("메시지", res.msg);
                        var txt = "<span>나이 : "+res.msg +"</span><hr>";
                        $("#res").append(txt);
                    },
                    error:function(err) { console.log("실패", err); }
                });
            });
            $("#remove").click(function(){
                $("#res").empty();
            });
        });
    </script>
</div>
</body>
</html>