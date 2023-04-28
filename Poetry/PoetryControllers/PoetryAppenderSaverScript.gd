extends Node3D

var PoetryFileLocation = "user://Poems/"
var PoetryName = ""
var WorkingFile
var TextToAdd = "Peeeeeee!!!!"
var CurrentPoem = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	
	_DirCheckerMaker()
	
	PoetryName = "Poem1.txt"
	pass # Replace with function body.

func _DirCheckerMaker():
	var DirHolder = DirAccess.open("user://")
	
	if DirHolder.dir_exists(PoetryFileLocation) == false:
		DirHolder.make_dir(PoetryFileLocation)
	
	pass
	
func _AddTextToPoetry(TextToAdd):
	WorkingFile = FileAccess.open(PoetryFileLocation+PoetryName, FileAccess.READ_WRITE)
	#Important to end up at the end of the file
	WorkingFile.seek_end()
	WorkingFile.store_string(" " + TextToAdd)
	WorkingFile.close()
	
	pass
	
func _ReadTextFromPoetry():
	WorkingFile = FileAccess.open(PoetryFileLocation+PoetryName, FileAccess.READ)
	return WorkingFile.get_as_text()
	WorkingFile.close()
	
	pass

#Overwrites all the old text in a file with the new text!
func _SaveAllEditsToFile(NewTextForWholeFile):
	WorkingFile = FileAccess.open(PoetryFileLocation+PoetryName, FileAccess.WRITE_READ)
	WorkingFile.store_string(NewTextForWholeFile)
	WorkingFile.close()
	pass
