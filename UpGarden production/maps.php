<div class="right_col" role="main">
          <div class="row">
            <div class="col-md-12">
              <div id="map"></div>
                <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 41.441952, lng: -8.295610},
          zoom: 14
        });
        var wmsLayer =
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
        /*var gBl = map.getProjection().fromPointToLatLng(
          new google.maps.Point(coord.x * twidth / s, (coord.y + 1) * theight / s)); // bottom left / SW
        var gTr = map.getProjection().fromPointToLatLng(
          new google.maps.Point((coord.x + 1) * twidth / s, coord.y * theight / s)); // top right / NE*/
           var bond = map.getBounds();
           var ulw = bond.getSouthWest();
           var lrw = bond.getNorthEast();

    //other stuffs

           var bbox = ulw.lng() + "," + ulw.lat() + "," + lrw.lng() + "," + lrw.lat();
 
        // Bounding box coords for tile in WMS pre-1.3 format (x,y)
        //var bbox = gBl.lng() + "," + gBl.lat() + "," + gTr.lng() + "," + gTr.lat();
        //var bbox = gBl.lat() + "," + gBl.lng() + "," + gTr.lat() + "," + gTr.lng();
 
        //base WMS URL
        var url = "http://sig.cm-guimaraes.pt/cgi-bin/wms/PDM?";
        var comp = document.getElementById("map").clientWidth;
        var alt = document.getElementById("map").clientHeight;
 
        url += "&service=WMS";           //WMS service
        url += "&version=1.3.0";         //WMS version 
        url += "&request=GetMap";        //WMS operation
        url += "&layers=ordenamento_pol"; //WMS layers to draw
        url += "&style=default";               //use default style
        url += "&format=image/png";      //image format
        url += "&TRANSPARENT=TRUE";      //only draw areas where we have data
        url += "&CRS=CRS:84";         //projection WGS84
        url += "&bbox=" + bbox;          //set bounding box for tile
        url += `&height=${alt}`;             //tile size used by google
        url += `&width=${comp}`;
        //url += "&tiled=true";
    console.log(url); 
        return url;
                        //return WMS URL for the tile  
      }, //getTileURL
      tileSize: new google.maps.Size(1000, document.getElementById("map").clientWidth),
      opacity: 0.5,
      isPng: true
     });
 
    // add WMS layer to map
    // google maps will end up calling the getTileURL for each tile in the map view
    map.overlayMapTypes.push(wmsLayer);
      }

    </script>
              <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBTENMW3pVZMNC3IyiqHUP71pmjEE8zTRw&callback=initMap"></script>
              
            </div>
          </div>

            <div class="row">
                      <div class="col-md-6" style="padding: 30px">
                        <img src="http://sig.cm-guimaraes.pt/cgi-bin/wms/PDM?MAP=http://sig.cm-guimaraes.pt/cgi-bin/wms/PDM&SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&bbox=-25858,188808.6413,-4831.0876,208269.0861&CRS=EPSG:27493&WIDTH=665&HEIGHT=551&LAYERS=Ortos2015,ordenamento_pol&FORMAT=image/jpeg&style=default">
                        
                        <div  style="height:400px ;"></div>

                      </div>
                    </div>
                    <div class="clearfix"></div>

        </div>