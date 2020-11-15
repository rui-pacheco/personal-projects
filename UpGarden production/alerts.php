<div class="right_col" role="main">
	<h1>Zona de Controlo</h1>

	<div class="" role="tabpanel" data-example-id="togglable-tabs">
		<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
			<li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Humidade do Solo</a>
			</li>
			<!--<li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Previsões</a>
			</li>-->
			
		</ul>
		<div id="myTabContent" class="tab-content">
			<div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
				<p>Os seguintes alertas foram identificados devido a valores muito altos ou baixos de acordo com o esperado </p>
				
				<table id="datatable_apis">
		
		<h3>Previsões</h3>
		<thead>
			<tr>
				<th>Data</th>
				<th>Humidade do Ar</th>
				<th>Temperatura</th>
				<th>Pressão Atmosférica</th>
				<th>Velocidade do Vento</th>
			</tr>
		</thead>
		<tbody id="apiFlags">
			<div id="tabelaApis">
				</div>
			</tbody>
		</table>
				<script type="text/javascript">
					var request = new XMLHttpRequest();

// Open a new connection, using the GET request on the URL endpoint
request.open('GET', 'http://api.openweathermap.org/data/2.5/forecast?id=8011224&appid=0c81a5d540c8f18bfb455ff276b9c49f&units=metric', true);

request.onload=function(){
	var data = JSON.parse(this.response);
	console.log(data);
	var lstTime =[];
	var lstTemp = [];
	var lstHum = [];
	var lstPre =[];
	var lstVen = [];


	for (var x = 0; x < data.list.length; x++) {

		lstTime.push(data.list[x].dt_txt);

		lstTemp.push(data.list[x].main.temp);
		lstHum.push(data.list[x].main.humidity);
		lstPre.push(data.list[x].main.pressure);
		lstVen.push(data.list[x].wind.speed);
		document.getElementByID("#tabelaApis").innerHtml="<tr><td>"+data.list[x].dt_txt+"<td><td>"+data.list[x].main.humidity+"<td><td>"+data.list[x].main.temp+"<td><td>"+data.list[x].main.pressure+"<td><td>"+data.list[x].wind.speed;
		document.getElementByID("#tabelaApis").innerHtml="adsad";

	}

}

</script>
</div>

<div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

	<!-- start recent activity -->

	<table id="datatable_humidadesolo">
		<p>Os seguintes alertas foram identificados devido a valores muito altos ou baixos de acordo com o esperado </p>
		<h3>Humidade do Solo</h3>
		<thead>
			<tr>
				<th>Id Sensor</th>
				<th>Data Medição</th>
				<th>Hora Medição</th>
				<th>Valor</th>
			</tr>
		</thead>
		<tbody id="humFlags">
			<script type="text/javascript">$("#humFlags").load("getHumFlag.php?q=humidade");


		</script>
	</div>



</div>
</div>
</div>
<script type="text/javascript">$(document).ready( function () {
	$('#datatable_humidadesolo').DataTable({
		ordering:false,
		select:false,
		searching:false
	});
} );</script>