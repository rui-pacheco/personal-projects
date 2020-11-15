<div class="right_col" role="main">

  <div class="">
    <h1>Previsões</h1>
    <div class="row top_tiles" style="margin: 10px 0;">
      <div class="col-md-6 col-sm-6 col-xs-6 tile">

       <div class="dashboard_graph x_panel">
          <div class="col-md-6">
            <h3>Temperatura</h3>
          </div>
          <div class="x_content">
            <div class="demo-container">
              <canvas id="chartTemp" ></canvas>
            </div>
          </div>
     </div>
      </div>
       <div class="col-md-6 col-sm-6 col-xs-6 tile">

       <div class="dashboard_graph x_panel">
          <div class="col-md-6">
            <h3>Humidade do Ar</h3>
          </div>
          <div class="x_content">
            <div class="demo-container">
              <canvas id="chartHum" ></canvas>

            </div>
          </div>
     </div>
      </div>
      </div>
     <div class="col-md-6 col-sm-6 col-xs-6 tile">

       <div class="dashboard_graph x_panel">
          <div class="col-md-6">
            <h3>Pressão Atmosférica</h3>
          </div>
          <div class="x_content">
            <div class="demo-container">
              <canvas id="chartPre" ></canvas>

            </div>
          </div>
     </div>
   </div>
   <div class="col-md-6 col-sm-6 col-xs-6 tile">
     <div class="dashboard_graph x_panel">
          <div class="col-md-6">
            <h3>Velocidade do Vento</h3>
          </div>
          <div class="x_content">
            <div class="demo-container">
              <canvas id="chartVen" ></canvas>

            </div>
          </div>
     </div>
      </div>
    
    <br />


    <div class="row">
    <!--  <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="dashboard_graph x_panel">
          <div class="row x_title">
            <div class="col-md-6">
              <h3>Humidade <small>Graph title sub-title</small></h3>
              <div class="row">


              </div>
              <div class="col-md-6">
                <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                  <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                  <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                </div>
              </div>

            </div>
            <div class="x_content">
              <div class="demo-container" style="height:250px">
                <div id="chart_plot_03" class="demo-placeholder"></div>
              </div>
            </div>
          </div>
        </div>
      </div>-->
      <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">

        </div>

      </div>


      <div class="row">

        <!-- start of weather widget -->
        <div class="col-md-12 col-sm-12 col-xs-12">
          <div class="x_panel">
            <div class="x_title" >
              <h2>Today's Weather <small>Sessions</small></h2>






              <div class="clearfix"></div>
            </div>
            <div class="x_content">



              <div class="clearfix"></div>


              <div class="row weather-days">
                <div class="col-sm-2">
                  <div class="daily-weather">
                    <h2 id="dia0" class="day">Mon</h2>
                    <h3 id="temp0"class="degrees">25</h3>
                    <span>
                      

                    </span>
                    <h5 id="vento0">15
                      <i>km/h</i>
                    </h5>
                  </div>
                </div>
                <div class="col-sm-2">
                  <div class="daily-weather">
                    <h2 id="dia1" class="day">Tue</h2>
                    <h3 id="temp1" class="degrees">25</h3>
                    <h5 id="vento1">12
                      <i>km/h</i>
                    </h5>
                  </div>
                </div>
                <div class="col-sm-2">
                  <div class="daily-weather">
                    <h2 class="day" id="dia2">Wed</h2>
                    <h3 class="degrees" id="temp2">27</h3>
                    <h5 id="vento2">14
                      <i>km/h</i>
                    </h5>
                  </div>
                </div>
                <div class="col-sm-2">
                  <div class="daily-weather">
                    <h2 class="day" id="dia3">Thu</h2>
                    <h3 class="degrees0" id ="temp3">28</h3>
                    <h5 id="vento3">15
                      <i>km/h</i>
                    </h5>
                  </div>
                </div>

                <div class="col-sm-2">
                  <div class="daily-weather">
                    <h2 class="day" id="dia4">Sat</h2>
                    <h3 class="degrees" id="temp4">26</h3>
                    <h5 id="vento4">10
                      <i>km/h</i>
                    </h5>
                  </div>
                </div>

                <div class="clearfix"></div>
              </div>
            </div>
          </div>
          <script > 
            var request = new XMLHttpRequest()

// Open a new connection, using the GET request on the URL endpoint
request.open('GET', 'http://api.openweathermap.org/data/2.5/forecast?id=8011224&appid=0c81a5d540c8f18bfb455ff276b9c49f&units=metric', true)



var timel =[];
var templ =[];
var huml =[];
var prel =[];
var venl =[];
 
request.onload = function () {
  var data = JSON.parse(this.response)
  console.log(data);
  var newData=[];
  var ctx1 = document.getElementById('chartTemp').getContext('2d');
  var ctx2 = document.getElementById('chartHum').getContext('2d');
  var ctx3 = document.getElementById('chartPre').getContext('2d');
  var ctx4 = document.getElementById('chartVen').getContext('2d');

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
  

  
}
/*timel=lstTime;
templ=lstTemp
huml=lstHum;
prel=lstPre;
venl=lstven;*/
console.log(x);
console.log(lstHum);
var myChart1 = new Chart(ctx1, {
  type: 'line',
  data: {
    labels: lstTime,
    datasets: [{
      label: 'Data',
      data: lstTemp,
      backgroundColor: [
    'rgba(50,200,50,0.3)'
      ],
      borderColor: [
      'rgba(50,200,50,0.3)'
      ],
      borderWidth: 1
    }]
  },
  options: {
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero: true
        }
      }]
    }
  }
});

var myChart2 = new Chart(ctx2, {
  type: 'line',
  data: {
    labels: lstTime,
    datasets: [{
      label: 'Data',
      data: lstHum,
      backgroundColor: [
      'rgba(50,200,50,0.3)'
      ],
      borderColor: [
      'rgba(50,200,50,0.3)'
      ],
      borderWidth: 1
    }]
  },
  options: {
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero: true
        }
      }]
    }
  }
});

var myChart3 = new Chart(ctx3, {
  type: 'line',
  data: {
    labels: lstTime,
    datasets: [{
      label: 'Data',
      data: lstPre,
      backgroundColor: [
      'rgba(50,200,50,0.3)'
      ],
      borderColor: [
     'rgba(50,200,50,0.3)'
      ],
      borderWidth: 1
    }]
  },
  options: {
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero: true
        }
      }]
    }
  }
});

  for (var i = 0, j=0; i <data.list.length; i+=8,j++) {

    document.getElementById('temp'+j).innerHTML = data.list[i].main.temp;
    document.getElementById('vento'+j).innerHTML = data.list[i].wind.speed +' <i>metros /segundo</i>';

    var d = new Date (data.list[i].dt_txt);
    newData.push(d);
  }
  for (var i = 0; i < newData.length; i++) {
   switch(newData[i].getDay()){
    case(0):var dia = "Domingo";break;
    case(1):var dia = "Segunda-Feira";break;
    case(2):var dia = "Terça-Feira";break;
    case(3):var dia = "Quarta-Feira";break;
    case(4):var dia = "Quinta-Feira";break;
    case(5):var dia = "Sexta-Feira";break;
    case(6):var dia = "Sábado";break;
  }
  document.getElementById('dia'+i).innerHTML = dia;
var myChart4 = new Chart(ctx4, {
  type: 'line',
  data: {
    labels: lstTime,
    datasets: [{
      label: 'Data',
      data: lstVen,
      backgroundColor: [
      'rgba(50,200,50,0.3)'
      ],
      borderColor: [
    'rgba(50,200,50,0.3)'
      ],
      borderWidth: 1
    }]
  },
  options: {
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero: true
        }
      }]
    }
  }
});

}


}



// Send request
request.send();
/*var pedido = new XMLHttpRequest();
for (var i = 0; i < templ.length; i++) {
 pedido.open('GET',"insertOnDb.php?db=apis&humidade=".huml.list[x]."&press=".prel.list[x].'&vent='.venl.list[x].'&temp='.templ.list[x],true);
 pedido.send();
}*/


</script>
</div>
<!-- end of weather widget -->

</div>
</div>
</div>