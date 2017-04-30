<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TreeMapLayout.aspx.cs" Inherits="D3Graph.TreeMapLayout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/4.6.0/d3.min.js"></script>
</head>
<body>
    <script>
        var canvas = d3.select("body").append("svg")
                    .attr("width", 500)
                    .attr("height", 500);

        d3.json("treeMap.json", function (data) {

            var treemap = d3.treemap
                        
                        .nodes(data);

            console.log(treemap);
        });
    </script>
</body>
</html>
