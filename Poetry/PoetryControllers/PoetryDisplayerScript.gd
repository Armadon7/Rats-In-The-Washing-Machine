extends Control

var MenuDisplay = preload ("res://Poetry/PoetryControllers/PoetryDisplayer.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	#This block checks for input, then pauses if there are no menu screens open
	if Input.is_action_just_pressed("ui_open_menu") && self.get_child_count() == 0:
		if get_tree().paused == false:
			get_tree().paused = true
			var NewMenu = MenuDisplay.instantiate()
			add_child(NewMenu)

	#This block checks for pause and if there are no menu screens open unpauses the system
	if get_tree().paused == true && self.get_child_count() == 0:
		get_tree().paused = false

	pass
