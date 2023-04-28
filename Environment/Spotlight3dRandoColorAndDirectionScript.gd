extends SpotLight3D

var RandNum = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	_RandColor()
	_RandRotation()
	pass # Replace with function body.

#Makes new color by changing the hue only, and keeps sautration and value the same
func _RandColor():
	
	var NewHue = RandNum.randf_range(0, 1)
	self.light_color = Color.from_hsv(NewHue, self.light_color.s, self.light_color.v)
	pass
	
func _RandRotation():
	#There are 2 radians in a circle so random float should give all possivle rotational angles
	var NewRotation = RandNum.randf_range(0, 2)
	self.rotate_y(NewRotation)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
