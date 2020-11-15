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
}