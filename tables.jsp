<% /* qua ci va messo qualche cosa forse il login o altro per controllare la pagina. Poi vedi stesso tu */ %>
<% String pageName = "NapoXir - Table Scheduling"; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
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
    <!-- The link to the CSS that the grid needs -->
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/assets/css/ui.jqgrid.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/assets/css/jquery-ui-1.10.0.bootstrap.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/assets/css/ui.jqgrid-bootstarp.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/assets/css/custom.css" />
    <style type="text/css">
        #gbox_jqGrid {
            margin: 20px auto !important;
        }
    </style>
    <title><% out.print(pageName); %></title>
</head>
<body>
    <nav class="navbar navbar-inverse navbar-static-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="#"><% out.print(pageName); %></a>
            </div>
        </div>
    </nav>

    <div class="container xir xir_tables">
        <h2 class="text-center"><% out.print(pageName); %></h2>
        <h4 class="text-center">Just a simple table for now</h4>

        <table id="jqGrid"></table>
        <div id="jqGridPager"></div>
    </div>

    <div class="container text-center">
        <p class="copyright"><% out.print(pageName); %> <span class="glyphicon glyphicon-copyright-mark"></span> 2015</p>
    </div>
        <script type="text/javascript">

            $(document).ready(function () {
                /* Inizializza for editing */
                var template = "<div style='margin-left:15px;'><div> OrderID <sup>*</sup>:</div><div> {OrderID} </div>";
    			template += "<div> CustomerID: </div><div>{CustomerID} </div>";
    			template += "<div> Date: </div><div>{OrderDate} </div>";
                /* Inizializza Tabella */
                $("#jqGrid").jqGrid({
                    url: 'json/data.json',
                    mtype: "GET",
                    datatype: "json",
                    colModel: [
                        { label: 'OrderID', name: 'OrderID', key: true, width: 155, editable: true, editrules : { required: true} },
     					{ label: 'Customer ID', name: 'CustomerID', width: 70, editable: true, editrules : { required: true} },
                        {
                            label: 'Order Date',
                            name: 'OrderDate',
                            width: 150,
                            editable: true,
                            edittype:"text",
                            editoptions: {
                            // dataInit is the client-side event that fires upon initializing the toolbar search field for a column
                            // use it to place a third party control to customize the toolbar
                                dataInit: function (element) {
                                    $(element).datepicker({
                                        id: 'orderDate_datePicker',
                                        dateFormat: 'yy-mm-dd',
                                        minDate: new Date(2010, 0, 1),
                                        maxDate: new Date(2020, 0, 1),
                                        showOn: 'focus'
                                    });
                                }
                            }
                        },
                        {
    						label: 'Freight',
    						name: 'Freight',
    						width: 150,
    						formatter: 'number',
    						summaryTpl : "<b>{0}</b>",
    						summaryType: "sum"
    					},
                        { label: 'Employee ID', name: 'EmployeeID', width: 150 }
                    ],
    				loadonce:true,
    				viewrecords: true,
    				rowList: [20,30,50,100],
                    width: 780,
                    height: 250,
                    rowNum: 20,
    				sortname: 'OrderDate',
                    pager: "#jqGridPager",
                    grouping: true,
                    groupingView: {
                        groupField: ["OrderDate"],
                        groupColumnShow: [true],
                        groupText: ["<b>{0}</b>"],
                        groupOrder: ["asc"],
                        groupSummary: [true],
    					groupSummaryPos: ['footer'],
                        groupCollapse: false
                    }
                });

                /* Inizializza Tasti */
                $('#jqGrid').navGrid('#jqGridPager',
                // the buttons to appear on the toolbar of the grid
                { edit: true, add: true, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: true },
                {
                    editCaption: "The Edit Dialog",
                    recreateForm: true,
					checkOnUpdate : true,
					checkOnSubmit : true,
                    closeAfterEdit: true,
                    errorTextFormat: function (data) {
                        return 'Error: ' + data.responseText
                    }
                },
                // options for the Add Dialog
                {
                    closeAfterAdd: true,
                    recreateForm: true,
                    errorTextFormat: function (data) {
                        return 'Error: ' + data.responseText
                    }
                },
                // options for the Delete Dailog
                {
                    errorTextFormat: function (data) {
                        return 'Error: ' + data.responseText
                    }
                });
            });

        </script>
</body>
</html>
