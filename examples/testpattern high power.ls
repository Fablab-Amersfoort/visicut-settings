var rectangleWidth 	= 3;
var rectangleHeight = 3;
var space 			= 1;
var numX			= 1;
var numY			= 10;
var startPower 		= 100;
var endPower 		= 100;
var startSpeed 		= 2;
var endSpeed 		= 0.01;

var speedStep	 	= (endSpeed-startSpeed)/(numY-1); // speed over y-axis
var powerStep 		= (endPower-startPower)/(numX-1); // power over x-axis

echo('This is a test pattern writen in Laserscript. More info:');
echo('https://github.com/t-oster/VisiCut/wiki/LaserScript. ');
for (var i = 0; i < numY; i++)
{
	var speed = (numY == 1)? startSpeed : startSpeed+i*speedStep;
	set("speed", speed);
	var echoRow = "";
	for (var j = 0; j < numX; j++)
	{
		var power = (numX == 1)? startPower : startPower+j*powerStep;
		set("power", power);
		var x = (rectangleWidth+space)*j;
		var y = (rectangleHeight+space)*i;
		rectangle(x, y, rectangleWidth, rectangleHeight);

		powerString = leadingZeros(Math.round(power*100)/100,3);
		speedString = leadingZeros(Math.round(speed*100)/100,3);
		echoRow += '['+powerString+'|'+speedString+']  ';
	}
	echo(echoRow);
}
echo('A grid will be lasercutted, the grid above shows the speed and power per block.');
echo('Syntax: [power|speed]');
echo('');
echo('SETTINGS: ');
echo('numX: '+numX);
echo('numY: '+numY);
echo('startPower: '+startPower);
echo('endPower: '+endPower);
echo('startSpeed: '+startSpeed);
echo('endSpeed: '+endSpeed);
echo(' ');

function rectangle(x, y, width, height)
{
	move(x, y);
	line(x+width, y);
	line(x+width, y+height);
	line(x, y+height);
	line(x, y);
}

function leadingZeros(value, numZeros) {
    var s = value+"";
    while (s.length < numZeros) s = "0" + s;
    return s;
}