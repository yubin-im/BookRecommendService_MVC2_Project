<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.awt.Color, java.awt.Font, book.test.*, java.util.*, org.jfree.chart.ChartFactory, org.jfree.chart.ChartUtilities, org.jfree.chart.JFreeChart, org.jfree.chart.plot.PlotOrientation, org.jfree.data.category.DefaultCategoryDataset, org.jfree.chart.plot.CategoryPlot, org.jfree.chart.plot.Plot, org.jfree.chart.renderer.category.LineAndShapeRenderer, org.jfree.chart.axis.CategoryAxis, org.jfree.chart.axis.NumberAxis, org.jfree.chart.labels.StandardCategoryItemLabelGenerator, org.jfree.chart.axis.CategoryLabelPositions, org.jfree.chart.StandardChartTheme" %>
<jsp:useBean id="booksdao" class="book.test.BooksDAO" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yearly Publication Counts</title>
<%
Map<String, Integer> yearCounts = booksdao.getYearCounts();
DefaultCategoryDataset dataset = new DefaultCategoryDataset();

for (Map.Entry<String, Integer> entry : yearCounts.entrySet()) {
    dataset.addValue(entry.getValue(), "Year", entry.getKey());
}

// 폰트 설정
Font font = new Font("Malgun Gothic", Font.PLAIN, 12); // 원하는 한글 폰트를 선택하세요.
StandardChartTheme theme = new StandardChartTheme("Korean");
theme.setExtraLargeFont(font);
theme.setLargeFont(font);
theme.setRegularFont(font);
theme.setSmallFont(font);
ChartFactory.setChartTheme(theme);

JFreeChart lineChart = ChartFactory.createLineChart(
    "출간 연도 별 도서 수",
    "연도",
    "도서 수",
    dataset,
    PlotOrientation.VERTICAL,
    true, true, false
);

CategoryPlot plot = (CategoryPlot) lineChart.getPlot();
LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot.getRenderer();
renderer.setBaseShapesVisible(true); // 데이터 포인트에 점을 표시합니다.

CategoryAxis domainAxis = plot.getDomainAxis();
domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);

int width = 800;
int height = 600;
response.setContentType("image/png");
ChartUtilities.writeChartAsPNG(response.getOutputStream(), lineChart, width, height);
%>
</head>
<body>
</body>
</html>
