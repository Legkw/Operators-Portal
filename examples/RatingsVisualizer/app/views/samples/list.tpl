<html>
	<head>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="/static/css/bootstrap.min.css" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="/static/css/datatables.min.css"/>
		<link rel="stylesheet" href="/static/css/font-awesome-4.7.0/css/font-awesome.min.css">
	
		<!-- Latest compiled and minified JavaScript -->
		<script src="/static/js/jquery.min.js" crossorigin="anonymous"></script>
		<script src="/static/js/bootstrap.min.js" crossorigin="anonymous"></script>
		<script type="text/javascript" src="/static/js/datatables.min.js"></script>
		<!--script src="/static/js/datatablesChangeStyle.js"></script-->
	
		<!-- Custom Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
		<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
		<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
	</head>

<link rel="stylesheet" href="/static/css/common/list.css">

<style>
.btn{
	margin-bottom: 10;
}

.dataTables_scroll{
	min-height: 10px;
}
</style>

<div class="container-fluid text-left">
    <div class="row container-fluid">
        <div class="col-sm-4 col-md-8 col-md-offset-2">
			<h3 class="text-center login-title">
				{{i18n .Lang "sample.list"}} 
				<button type="button" class="btn btn-default btn-sm" onclick="refresh()">
					<span class="glyphicon glyphicon-refresh" aria-hidden="true" ></span>
				</button>
			</h3>
			{{ template "common/form/flash.tpl" . }}
			<table id="table_list" class="table table-striped">
			    <thead>
					<tr>
						<th>{{i18n .Lang "sample.id"}}</th>
						<th>{{i18n .Lang "sample.numratedactivities"}}</th>
						<th>{{i18n .Lang "sample.bestratedactivity"}}</th>
						<th>{{i18n .Lang "sample.bestrating"}}</th>
					</tr>
			    </thead>
			    <tbody>
					{{ range .objs }}
						<tr>
							<td>{{ .ID }}</td>
							<td>{{ .NumRatedActivities}}</td>
                         	<td>{{ .BestRatedActivity}}</td>
                         	<td>{{ .BestRating}}</td>
						</tr>
					{{ end }}
					
			    </tbody>
			</table>
        </div>
    </div>
</div>

<script>

var nodata={{i18n .Lang "common.nodata"}};

var nextText={{i18n .Lang "common.next"}};
var previousText={{i18n .Lang "common.previous"}};
var firstText={{i18n .Lang "common.first"}};
var lastText={{i18n .Lang "common.last"}};


function refresh() {
	window.location.href = "/";
}

var intervalID=self.setInterval("refresh()", {{ .msToRefresh}});

var table_defined = false;
var table;

function loadList() {
	table = $('#table_list');

	if (!table_defined) {
		table_defined = true;
		table.DataTable({
			"searching": true
			, dom: 'Bfrtip'
			, "order": [[0, 'asc'], [1, 'asc'],[2, 'asc']]
			, "paging": true
			, scrollY: 'auto'
			, scrollCollapse: true
			, "pagingType": "simple_numbers"
			, "stateSave": true
			, "language": {
				"paginate": {
					"previous": "«",
					"next": "»"
				},
			}
			, "columns": [
				null,
				null,
				null,
				null
			]
			, "lengthChange": false
			, "info": false
			, "pageLength": 10
			, buttons: {
				buttons: []
			}

		});
	}
}

loadList();

</script>

</html>
