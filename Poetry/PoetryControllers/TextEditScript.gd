extends TextEdit

var TextToDisplay = ""
var OriginalText = ""
@onready var TopMostHolder = $"../../.."

# Called when the node enters the scene tree for the first time.
func _ready():
	
	TextToDisplay = PoetryAppenderSaverLoader._ReadTextFromPoetry()
	#Makes us a quick backup save point
	OriginalText = TextToDisplay
	self.text  = TextToDisplay
	pass # Replace with function body.

#Erases all old data, makes totally new data in file, saves, then hides root holder
func _on_save_exit_button_pressed():
	PoetryAppenderSaverLoader._SaveAllEditsToFile(self.text)
	TopMostHolder.queue_free()
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_exit_erase_button_pressed():
	self.text = OriginalText
	TopMostHolder.queue_free()
	pass # Replace with function body.
