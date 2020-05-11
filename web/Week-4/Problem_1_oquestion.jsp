<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
    String part = request.getParameter("part");
    String symptom = request.getParameter("symptom");
    String question = request.getParameter("question");
    String phone = request.getParameter("phone");
%>

<html>
    <head><title>의사에게 질문하기</title></head>
    <body>
        <h3>귀하께서는 아래와 같이 작성하셨습니다.</h3>
        과: <% out.println(part); %> <br>
        증상: <% out.println(symptom); %> <br>
        질문 내용<br><% out.println(question); %><br>
        답변 받을 연락처: <% out.println(phone); %>
    </body>
</html>