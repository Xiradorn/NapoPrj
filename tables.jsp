<% /* qua ci va messo qualche cosa forse il login o altro per controllare la pagina. Poi vedi stesso tu */ %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The jQuery library is a prerequisite for all jqSuite products -->
    <script type="text/ecmascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script type="text/ecmascript" src="${pageContext.request.contextPath}/assets/js/jquery-ui.min.js"></script>
    <!-- This is the Javascript file of jqGrid -->
    <script type="text/ecmascript" src="${pageContext.request.contextPath}/assets/js/jquery.jqGrid.min.js"></script>
    <!-- This is the localization file of the grid controlling messages, labels, etc. -->
    <!-- We support more than 40 localizations -->
    <script type="text/ecmascript" src="${pageContext.request.contextPath}/assets/js/i18n/grid.locale-en.js"></script>
    <!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/assets/css/jquery-ui.min.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/assets/css/jquery-ui.structure.min.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/assets/css/jquery-ui.theme.min.css" />
    <!-- The link to the CSS that the grid needs -->
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/assets/css/ui.jqgrid.css" />
    <style type="text/css">
        #gbox_jqGrid {
            margin: 20px auto !important;
        }
    </style>
    <title>Tabelle</title>
</head>
<body>
    <h2 style="text-align: center;">Scheduling Tables</h2>
    <h4 style="text-align: center;">Just a simple table for now</h4>
    <hr>

    <table id="jqGrid" style="margin: 10px auto;"></table>
    <div id="jqGridPager"></div>
<script type="text/javascript">
    $(document).ready(function () {

    		$("#jqGrid").jqGrid({
    		url: 'data.json',
    		datatype: "json",
    		 colModel: [
    			{ label: 'Category Name', name: 'CategoryName', width: 75 },
    			{ label: 'Product Name', name: 'ProductName', width: 90 },
    			{ label: 'Country', name: 'Country', width: 100 },
    			{ label: 'Price', name: 'Price', width: 80, sorttype: 'integer' },
    			// sorttype is used only if the data is loaded locally or loadonce is set to true
    			{ label: 'Quantity', name: 'Quantity', width: 80, sorttype: 'number' }
    		],
    		viewrecords: true, // show the current page, data rang and total records on the toolbar
    		width: 780,
    		height: 200,
    		rowNum: 30,
    		loadonce: true, // this is just for the demo
    		pager: "#jqGridPager"
    	});
    });
</script>
<hr>
<p>
    <h5 style="text-align: center">Xir Napo &copy; 2015</h5>
</p>
</body>
</html>
