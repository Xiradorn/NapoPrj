<% /* qua ci va messo qualche cosa forse il login o altro per controllare la pagina. Poi vedi stesso tu */ %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <!-- The jQuery library is a prerequisite for all jqSuite products -->
    <script type="text/ecmascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <!-- This is the Javascript file of jqGrid -->
    <script type="text/ecmascript" src="${pageContext.request.contextPath}/assets/js/jquery.jqGrid.min.js"></script>
    <!-- This is the localization file of the grid controlling messages, labels, etc. -->
    <!-- We support more than 40 localizations -->
    <script type="text/ecmascript" src="${pageContext.request.contextPath}/assets/js/i18n/grid.locale-it.js"></script>
    <!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/assets/css/jquery-ui.min.css" />
    <!-- The link to the CSS that the grid needs -->
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/assets/css/ui.jqgrid.css" />

    <title>Tabelle</title>
</head>
<body>

    <table id="jqGrid"></table>
    <div id="jqGridPager"></div>

    <script type="text/javascript">

        $(document).ready(function () {
            $("#jqGrid").jqGrid({
                url: 'data.json',
                mtype: "GET",
                datatype: "json",
                colModel: [
                    { label: 'ID', name: 'CustomerID', key: true, width: 75 },
                    { label: 'Company Name', name: 'CompanyName', width: 150 },
                    { label: 'Contact Name', name: 'ContactName', width: 150 },
                    { label: 'Phone', name: 'Phone', width: 150 },
                    { label: 'City', name: 'City', width: 150 }
                ],
				loadonce: true,
                width: 780,
                height: 250,
                rowNum: 10,
				sortname: 'CustomerID',
				jsonReader: {
					// instruct subgrid to get the data as name:value pair
					subgrid : { repeatitems: false}
				},
                subGrid: true, // set the subGrid property to true to show expand buttons for each row
				subgridtype: 'json', // set the subgrid type to json
				subGridUrl: function( params ) { // the url can be a function. In this case we build the urls depending on the id row
					return params.id+'.json';
				},
				// description of the subgrid model
				subGridModel:[{
						name: ["OrderID","RequiredDate","ShipName","ShipCity","Freight"],
						width: [60,180,150,100,70],
						align: ["left","left","left","left","right"],
						params: false
				}],
                pager: "#jqGridPager"
            });
        });
    </script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/prettify/prettify.js"></script>
    <link rel="stylesheet" "type="text/css" src="${pageContext.request.contextPath}/assets/css/prettify/prettify.js">

</body>

</body>
</html>
