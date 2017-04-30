<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="D3Graph.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/4.6.0/d3.min.js"></script>

</head>
<body>
    <script>

        var svg = d3.select("body").append("svg")
                    .attr("width", 250)
                    .attr("height", 250);

        var xScale = d3.scaleLinear().range([0, 250]);
        var yScale = d3.scaleLinear().range([250, 0]);

        function render(data) {

            xScale.domain(d3.extent(data, function (d) { return d.sepal_length; }));
            yScale.domain(d3.extent(data, function (d) { return d.petal_length; }));

            var circles = svg.selectAll("circle").data(data);

            circles.enter().append("circle")
                    .attr("cx", function (d) { return xScale(d.sepal_length); })
                    .attr("cy", function (d) { return yScale(d.petal_length); })
                    .attr("r", 5);

            circles
                    .attr("cx", function (d) { return xScale(d.sepal_length); })
                    .attr("cy", function (d) { return yScale(d.petal_length); });

            circles.exit().remove();
        }

        function type(d) {
            d.sepal_length = +d.sepal_length;
            d.sepal_width = +d.sepal_width;
            d.petal_length = +d.petal_length;
            d.petal_width = +d.petal_width;
            return d;
        }

        d3.csv("abc.csv", type, render);
        
    </script>
</body>
</html>
