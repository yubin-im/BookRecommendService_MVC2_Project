<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, book.test.*" errorPage="/main/top.html"%>
<jsp:useBean id="reviews" type="java.util.ArrayList" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewReviewWordcloud</title>
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3-cloud/1.2.5/d3.layout.cloud.min.js"></script>
</head>
<body>
    <div id="wordcloud"></div>

<script>
// 워드 클라우드 데이터를 JavaScript 배열로 파싱합니다.
var wordcloudData = [
    // JavaScript 배열로 변환한 데이터
    <%
        ArrayList<String> wordcloudDataList = (ArrayList<String>) request.getAttribute("wordcloudData");
        for (String word : wordcloudDataList) {
    %>
        { text: '<%= word.toString() %>', size: calculateSize(), color: randomColor() },
    <%
        }
    %>
];

// 빈도수에 따른 글자 크기 계산 (예: 10에서 40 사이의 크기)
function calculateSize() {
    return Math.floor(Math.random() * (40 - 10 + 1)) + 10;
}

// 랜덤한 RGB 색상을 생성하는 함수
function randomColor() {
    var r = Math.floor(Math.random() * 256);
    var g = Math.floor(Math.random() * 256);
    var b = Math.floor(Math.random() * 256);
    return "rgb(" + r + "," + g + "," + b + ")";
}

// 페이지가 완전히 로드된 후 실행
window.onload = function() {
    // 워드 클라우드 생성 설정
    var wordcloud = d3.layout.cloud()
        .size([800, 400]) // 워드 클라우드 크기 설정
        .words(wordcloudData)
        .rotate(0) // 워드 회전 각도 설정
        .fontSize(function(d) { return d.size; }) // 워드 크기 설정
        .on("end", drawWordCloud); // 워드 클라우드 생성 완료 후 콜백 함수 설정

    // 워드 클라우드 그리기
    wordcloud.start();

    // 워드 클라우드를 그리는 함수
    function drawWordCloud(words) {
        d3.select("#wordcloud")
            .append("svg")
            .attr("width", wordcloud.size()[0])
            .attr("height", wordcloud.size()[1])
            .append("g")
            .attr("transform", "translate(" + (wordcloud.size()[0] / 2) + "," + (wordcloud.size()[1] / 2) + ")")
            .selectAll("text")
            .data(words)
            .enter().append("text")
            .style("font-size", function(d) { return d.size + "px"; })
            .style("fill", function(d) { return d.color; }) // 워드 색상 설정
            .attr("text-anchor", "middle")
            .attr("transform", function(d) {
                return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
            })
            .text(function(d) { return d.text; });
    }
};
</script>
</body>
</html>
