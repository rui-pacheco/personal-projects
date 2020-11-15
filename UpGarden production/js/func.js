
  $('#homeClick').on('click',function(){
  	 	$('#content').load("home.php");
  	 	 $.ajax({
      	url: "../build/js/custom.min.js",
      	dataType: "script"
  	 });
  	 	 
  	 /*init_sparklines();
  	 init_flot_chart();
  	 init_sidebar();
  	 init_wysiwyg();
  	 init_InputMask();
  	 init_JQVmap();
  	 init_cropper();
  	 init_knob();
  	 init_IonRangeSlider();
  	 init_ColorPicker();
  	 init_TagsInput();
  	 init_parsley();
  	 init_daterangepicker();
  	 init_daterangepicker_right();
  	 init_daterangepicker_single_call();
  	 init_daterangepicker_reservation();
  	 init_SmartWizard();
  	 init_EasyPieChart();
  	 init_charts();
  	 init_echarts();
  	 init_morris_charts();
  	 init_skycons();
  	 init_select2();
  	 init_validator();
  	 init_DataTables();
  	 init_chart_doughnut();
  	 init_gauge();
  	 init_PNotify();
  	 init_starrr();
  	 init_calendar();
  	 init_compose();
  	 init_CustomNotification();
  	 init_autosize();
  	 init_autocomplete();*/
  	
     /*$.getScript("../build/js/custom.min.js");*/

});

 // function initMap() {
 //window.onload = function () {
 
    // Create a MapOptions object with the required properties for base map
    // Centered on Lincolnshire, UK
  //  var mapOptions = {
  //    zoom: 9,  
  ///    center: new google.maps.LatLng(53.3567, -0.244), 
  //    mapTypeId: google.maps.MapTypeId.ROADMAP
  //  };
 
    // Create the base map 
   // map = new google.maps.Map(document.getElementById('map'), mapOptions);
 
    //Define custom WMS layer for census output areas in WGS84
   /* var wmsLayer =
     new google.maps.ImageMapType(
     {
       getTileUrl:
      function (coord, zoom) {
        // Compose URL for overlay tile
 
        var s = Math.pow(2, zoom);  
        var twidth = 256;
        var theight = 256;
 
        //latlng bounds of the 4 corners of the google tile
        //Note the coord passed in represents the top left hand (NW) corner of the tile.
        var gBl = map.getProjection().fromPointToLatLng(
          new google.maps.Point(coord.x * twidth / s, (coord.y + 1) * theight / s)); // bottom left / SW
        var gTr = map.getProjection().fromPointToLatLng(
          new google.maps.Point((coord.x + 1) * twidth / s, coord.y * theight / s)); // top right / NE
 
        // Bounding box coords for tile in WMS pre-1.3 format (x,y)
        var bbox = gBl.lng() + "," + gBl.lat() + "," + gTr.lng() + "," + gTr.lat();
 
        //base WMS URL
        var url = "http://sig.cm-guimaraes.pt/cgi-bin/wms/PDM?";
 
        url += "&service=WMS";           //WMS service
        url += "&version=1.3.0";         //WMS version 
        url += "&request=GetMap";        //WMS operation
        url += "&layers=ordenamento_pol"; //WMS layers to draw
        url += "&styles=";               //use default style
        url += "&format=image/png";      //image format
        url += "&TRANSPARENT=TRUE";      //only draw areas where we have data
        url += "&CRS=EPSG:27493";         //projection WGS84
        url += "&bbox=" + bbox;          //set bounding box for tile
        url += "&width=256";             //tile size used by google
        url += "&height=256";
        //url += "&tiled=true";
 
        return url;                 //return WMS URL for the tile  
      }, //getTileURL
 
      tileSize: new google.maps.Size(256, 256),
      opacity: 0.85,
      isPng: true
     });
 
    // add WMS layer to map
    // google maps will end up calling the getTileURL for each tile in the map view
    map.overlayMapTypes.push(wmsLayer);
 
    // define kml layer
    // set base WMS URL for kml request
    var kmlUrl = "http://sig.cm-guimaraes.pt/cgi-bin/wms/PDM?";
 
    kmlUrl += "&version=1.3.0";              //WMS version 
    kmlUrl += "&layers=ordenamento_pol";     //WMS layers
    kmlUrl += "&viewparams=analysis_id:177"; //analysis_id parameter for query filter
    kmlUrl += "&styles=";
    kmlUrl += "&format=kml";
 
    var kmlOptions = {
      map: map,              // the map that the kml layer will be added to
      url: kmlUrl,           // the url for the kml data
      preserveViewport: true // do not adjust map location and zoom
    }; 
 
    // add the kml layer to the map
    studyLayer = new google.maps.KmlLayer(kmlOptions);*/
 
 // };
 
//};

$().on('click',function(event){
	var id = event.target.id;
		var fl = id+".php";
		console.log(fl);
  	 $('#content').load(fl);
  	 
  	  $.ajax({
      	url: "../build/js/custom.min.js",
      	dataType: "script"
  	 });
  	  
  	 	/*$(document).ready(function(){init_sparklines(),init_flot_chart(),init_sidebar(),init_wysiwyg(),init_InputMask(),init_JQVmap(),init_cropper(),init_knob(),init_IonRangeSlider(),init_ColorPicker(),init_TagsInput(),init_parsley(),init_daterangepicker(),init_daterangepicker_right(),init_daterangepicker_single_call(),init_daterangepicker_reservation(),init_SmartWizard(),init_EasyPieChart(),init_charts(),init_echarts(),init_morris_charts(),init_skycons(),init_select2(),init_validator(),init_DataTables(),init_chart_doughnut(),init_gauge(),init_PNotify(),init_starrr(),init_calendar(),init_compose(),init_CustomNotification(),init_autosize(),init_autocomplete()});
  	 */

    /* $.getScript("../build/js/custom.min.js");*/

});

function open_page(clicked_id)
{
    var fl = clicked_id+".php";
    $('#content').load(fl);
    $.ajax({
      	url: "../build/js/custom.min.js",
      	dataType: "script"
  	 });
}

/*function loadWeather(){
   $.ajax({
        type:"GET",
        url: "http://api.openweathermap.org/data/2.5/forecast?id=8011224&appid=0c81a5d540c8f18bfb455ff276b9c49f",
        contentType: "application/json",
        dataType: "json",
        success :function(result) {
          console.log(result);
        }
     });
}*/

