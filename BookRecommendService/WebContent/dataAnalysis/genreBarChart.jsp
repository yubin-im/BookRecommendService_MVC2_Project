<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.awt.Color, java.awt.Font, book.test.*, java.util.*, org.jfree.chart.ChartFactory, org.jfree.chart.ChartUtilities, org.jfree.chart.JFreeChart, org.jfree.chart.plot.PlotOrientation, org.jfree.data.category.DefaultCategoryDataset, org.jfree.chart.plot.CategoryPlot, org.jfree.chart.renderer.category.BarRenderer, org.jfree.chart.axis.CategoryAxis, org.jfree.chart.labels.StandardCategoryItemLabelGenerator, org.jfree.chart.axis.CategoryLabelPositions, org.jfree.chart.StandardChartTheme" %>
<jsp:useBean id="booksdao" class="book.test.BooksDAO" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>genreBarChart</title>
<%
Map<String, Integer> genreCounts = booksdao.getGenreCounts();
DefaultCategoryDataset dataset = new DefaultCategoryDataset();

for (Map.Entry<String, Integer> entry : genreCounts.entrySet()) {
    dataset.addValue(entry.getValue(), "Genre", entry.getKey());
}

// 폰트 설정
Font font = new Font("Malgun Gothic", Font.PLAIN, 12); // 원하는 한글 폰트를 선택하세요.
StandardChartTheme theme = new StandardChartTheme("Korean");
theme.setExtraLargeFont(font);
theme.setLargeFont(font);
theme.setRegularFont(font);
theme.setSmallFont(font);
ChartFactory.setChartTheme(theme);

JFreeChart barChart = ChartFactory.createBarChart(
    "장르별 도서 수",
    "장르",
    "도서 수",
    dataset,
    PlotOrientation.VERTICAL,
    true, true, false
);

CategoryPlot plot = (CategoryPlot) barChart.getPlot();
BarRenderer renderer = (BarRenderer) plot.getRenderer();

// 막대 색상 설정 (파란색)
Color lightBlueColor = new Color(173, 216, 230); // 연한 파란색 색상 (RGB 값)
for (int i = 0; i < dataset.getRowCount(); i++) {
    renderer.setSeriesPaint(i, lightBlueColor);
}

CategoryAxis domainAxis = plot.getDomainAxis();
domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);

int width = 800;
int height = 600;
response.setContentType("image/png");
ChartUtilities.writeChartAsPNG(response.getOutputStream(), barChart, width, height);
%>
</head>
<body>
</body>
</html>
