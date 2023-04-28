extends Node

var TextPopUp = preload("res://TextPopUps/WordRat.tscn")
var SecondsTillTextFreed = 3.0
var ChildToFree
var TextToPassAlong = ""
var NewTextLoction = Vector3(0.0, 2.0, 0.0)
var TypeOfWord = ""

@onready var Parent = get_parent()

#These onready are from before I learned / remembered singletons!
#@onready var WordBank = $"../WordBankController"
#@onready var PoetryAdder = $"../PoetryAppenderSaver"

# Called when the node enters the scene tree for the first time.
func _ready():
	# _InstanceTextPopUp("Pants")
	
	TypeOfWord = "Adjective"
	pass # Replace with function body.

func _InstanceTextPopUp(TextToPassAlong):
	var NewTextPopUp = TextPopUp.instantiate()
	NewTextPopUp.translate(NewTextLoction)
	add_child(NewTextPopUp)
	NewTextPopUp.ChangeDisplay(TextToPassAlong)
	pass
	
func _AddTextToPoem(TextToPassAlong):
	PoetryAppenderSaverLoader._AddTextToPoetry(TextToPassAlong)
	pass

func _on_area_3d_body_entered(body: Node) -> void:
	var TextToPassAlong = WordBankController.GetRandomWord(TypeOfWord)
	_InstanceTextPopUp(TextToPassAlong)
	_AddTextToPoem(TextToPassAlong)
#	# original copy from pew pew pew if body != Parent && is_in_group("EnemyProjectileGroup") == false  && "Damage" in body:
#	if "DescriptorPopUp" in body:
#		TextToPassAlong = body.DescriptorPopUp
#		print(body.DescriptorPopUp)
#		_InstanceTextPopUp(TextToPassAlong)	

	pass # Replace with function body.
