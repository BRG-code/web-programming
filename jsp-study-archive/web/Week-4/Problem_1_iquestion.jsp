<%@ page contentType="text/html; charset=UTF-8" %>
<html>
    <head><title>의사에게 질문하기</title></head>
    <body>
        <h2>의사에게 질문하기</h2>
        <form method="post" action="oquestion.jsp">
            과: 
            <select name="part" required>
                <option value="내과">내과</option>
                <option value="외과">외과</option>
                <option value="정형외과">정형외과</option>
                <option value="이비인후과">이비인후과</option>
                <option value="치과">치과</option>
                <option value="산부인과">산부인과</option>
                <option value="안과">안과</option>
                <option value="비뇨기과">비뇨기과</option>
                <option value="신경외과">신경외과</option>
                <option value="피부과">피부과</option>
                <option value="잘 모르겠음">잘 모르겠음</option>
            </select>
            <br><br>

            증상: <input type="text" name="symptom" size="50" placeholder="증상을 알려주세요." required><br><br>

            질문: <textarea name="question" rows="8" col="50" placeholder="질문 내용을 적어주세요." required></textarea><br><br>

            답변 받을 연락처: <input type="tel" name="phone" required><br><br>

            <input type="reset" value="초기화">
            <input type="submit" value="질문 등록">
        </form>
    </body>
</html>