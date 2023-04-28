extends Node3D

var TimeToFree = 2.0
var TextToDisplay = ""
var StartPercentageSizeOfText = Vector3(.02, .02, .02)
var EndPercentageSizeOfText = Vector3(1.0, 1.0, 1.0)
var LengthOfTimeToScaleText = .5
var tween

@onready var WordContoller = $WordController

# Called when the node enters the scene tree for the first time.
func _ready():
	tween = create_tween()
	pass

#Changes the text to whatever it needs as passed along from the rat
#body enter 3d node, shirnks then scales it up and then also calls to queuefree after timer
func ChangeDisplay(TextToPassAlong):
	WordContoller.mesh.text = TextToPassAlong
	self.scale = StartPercentageSizeOfText
	tween.tween_property(self, "scale", EndPercentageSizeOfText, LengthOfTimeToScaleText)
	_FreeSelf()
	pass # Replace with function body.

func _FreeSelf():
	await get_tree().create_timer(TimeToFree).timeout
	self.queue_free()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
