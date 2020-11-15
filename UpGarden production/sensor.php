<div class="right_col" role="main">
  <h1>Sensores</h1>
  <div class="row">

    <div class="col-md-8">

      <div id="map">

      </div>

      <script src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/build/ol.js"></script>
      <title>OpenLayers example</title>

    </div>
    <div id="info">
      
    
    <div class="col-md-4">
      <div class="col-md-12">
        <h2 id="id_sensor">Id : </h2>
      </div>
      <div class="row">
      <div class="col-md-12">
        <h2 id="tipo_sensor">Tipo : </h2>
      </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <h2 id="nome_sensor">Nome : </h2>
        </div>

      </div>
      <div class="row">
        <div class="col-md-12">
        <h2 id="coord_sensor">Coordenadas : </h2>
      </div>
        
      </div>
      <div class="row">
        <div class="col-md-"12>
          <div class="col-md-12">
          <h2>Valor</h2>
          <ul>
            <li id="valor_sensor"></li>
          </ul>
        </div>
        </div>
      </div>

    </div>
    </div>
    

    <div id="popup" title="Welcome to OpenLayers"></div>
    <script type="text/javascript">

      var map = new ol.Map({
        target: 'map',
        layers: [
        new ol.layer.Tile({
          source: new ol.source.OSM()
        })
        ],
        view: new ol.View({
          center: ol.proj.fromLonLat([-8.33169,41.46502]),
          zoom: 12
        })
      });
      var marker = new ol.Feature({
        geometry: new ol.geom.Point(
          ol.proj.fromLonLat([-8.33169,41.46502])),
        id:"1",
        name:"Capacotive Soil Moisture Sensor v1.2",
        dados:"Dados",
        coord:[-8.33169,41.46502],
        tipo:"Humidade",

      });

      var vectorSource = new ol.source.Vector({
        features: [marker]
      });

      var markerVectorLayer = new ol.layer.Vector({
        source: vectorSource,
      });

      var popup = new ol.layer.Vector({
        element: document.getElementById('popup')
      });
      map.addLayer(popup);

      map.addLayer(markerVectorLayer);


      var displayFeatureInfo = function(pixel) {

        var feature = map.forEachFeatureAtPixel(pixel, function(feature) {
          return feature;
        });

        var id_sensor = document.getElementById('id_sensor');
        var coord_sensor = document.getElementById('coord_sensor');
        var nome_sensor = document.getElementById('nome_sensor');
        var tipo_sensor = document.getElementById('tipo_sensor');
        var valor_sensor = document.getElementById('valor_sensor');
        if (feature) {
          id_sensor.innerHTML = 'Id : ' + feature.get('id');
          coord_sensor.innerHTML = 'Coordenadas : '+feature.get('coord');
          nome_sensor.innerHTML = 'Nome : '+feature.get('name');
          tipo_sensor.innerHTML = 'Tipo : '+feature.get('tipo');
          $("#valor_sensor").load("getLastHum.php");


        } else {
          id_sensor.innerHTML = 'Id : ' + '&nbsp;';
          coord_sensor.innerHTML = 'Coordenadas : '+'&nbsp;';
          nome_sensor.innerHTML = 'Nome : '+'&nbsp;';
          tipo_sensor.innerHTML = 'Tipo : '+'&nbsp;';
        }

    
      };


      map.on('click', function(evt) {
        var pixel =  map.getEventPixel(evt.originalEvent);
        displayFeatureInfo(pixel);
      });

    </script>

<script type="text/javascript">

               $(document).ready(
                 function() {
                   setInterval(function() {
                     $('#humDinamica').load("getHumidade.php");
 });  //Delay here = 5 seconds 
});</script>
      <!--          <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 41.441952, lng: -8.295610},
          zoom: 14
        });
        }

      </script>-->
     

    </div>
  </div>

  <div class="clearfix"></div>

</div>