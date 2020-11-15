

var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database:"upgardentest"
});

con.connect();


var serialport = require('serialport');
var portName = process.argv[2];

var myPort = new serialport(portName, {
    baudRate: 115200
});

const Readline = serialport.parsers.Readline;
const parser = new Readline();
myPort.pipe(parser);
parser.on('data', console.log);
myPort.write('ROBOT PLEASE RESPOND\n');
myPort.on('open', onOpen);
myPort.on('data', onData);



function onOpen(){
    console.log('Open connections!');
}

function onData(data){
  console.log('on Data ' + data);
  console.log("Connected!");
  
  var today = new Date();
  var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
  var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
  var fvalue;
  if (data>75) {
  	fvalue=1;
  }else	{fvalue=0;}

  var sql = "INSERT INTO humidade (data,hora,valor,falerta) VALUES ('"+date+"','"+time+"','"+data+"','"+fvalue+"');";
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("1 record inserted");
  });

}

