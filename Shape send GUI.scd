//NetzwerkMusik GUI für Figuren erstellen

n = NetAddr("127.0.0.1", 12000);
(
var heightt,height;
var widtht, width;
var nAdd;
var port;
var shapeno;
var rgb;
var color;
var red,green,blue = 100;
var oscjunction;

var shape;
var shapes;
var setShape;
var setColor;
var pos;
var xPos, yPos;
var posX, posY;
w = Window.new("Shape Send", Rect(200,20,500,500));
w.front;

shapes = PopUpMenu(w, Rect(20,20, 90, 30));
shapes.items = [
	"Ellipse",
	"Rectangle"
];
shapes.action_({
	if(shapes.value == 0, {shape = "ELLIPSE"}, {shape = "RECT"});


});

setShape = Button(w, Rect(200, 20, 80, 80)).states_([
	["send Shape", Color.black]
])
.action_({
	shapes.value.postln;
	if(shapes.value == 0, {
		n.sendMsg("/new_shape", "ELLIPSE", posX.value.asFloat;, posY.value.asFloat,width.value.asFloat, height.value.asFloat);
	}, {n.sendMsg("/new_shape", "RECT", posX.value.asFloat.postln;, posY.value.asFloat.postln,height.value.asFloat.postln, width.value.asFloat.postln)}
	);

});

rgb = TextField(w, Rect(20, 60, 50,30)).string_("rgb");
m = MultiSliderView(w, Rect(300, 120, 50, 200)).step_(0.1);
m.value=Array.fill(3, {|v| v*0.1}); // size is set automatically when you set the value
m.action = { arg q;

	red = (q.value[0] * 255).asInt;
	green = (q.value[1] * 255).asInt;
	blue = (q.value[2] * 255).asInt;

	["red", red, "green", green, "blue", blue].postln;

};
shapeno = NumberBox(w, Rect(200, 350, 30,30));
TextField(w, Rect(120, 350, 70,20)).string_("Shape No.");
setColor = Button(w, Rect(200, 200, 80, 80)).states_([
	["set Color", Color.black, Color.rand]
])
.action_({
	n.sendMsg("/color_shape",shapeno.value.asInt, red, green,blue);
});



heightt = TextField(w, Rect(20, 160, 40,30)).string_("Height");
height = NumberBox(w, Rect(60, 160, 40,30));
widtht = TextField(w, Rect(20, 190, 40,30)).string_("Width");
width = NumberBox(w, Rect(60, 190, 40,30));
xPos = TextField(w, Rect(20, 60, 40,30)).string_("Pos X");
posX = NumberBox(w, Rect(60, 60, 40,30));
yPos = TextField(w, Rect(20,95, 40,30)).string_("Pos Y");
posY = NumberBox(w, Rect(60, 95, 40,30));


)
[1,2,3,4,5].flatten