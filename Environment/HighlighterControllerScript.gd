extends Node3D

@onready var ParentOverall = self.get_parent()
var HighLightGetter = preload("res://Environment/highlighterMesh.tscn")

#Holds the node that actually has acessable size
var ShapedNode

#Holds the base dimensions for scaling
var AABBShape

#Defines how much larger than the collision shape the highliter should be
var HowMuchLargerThanShape = 1.1

#Sets Color for highlighter
var ColForHighLighter = Color("PURPLE")

# Called when the node enters the scene tree for the first time.
func _ready():
	ShapedNode = ParentOverall.find_child("*Shape*")
	AABBShape = ShapedNode.shape.size
	HighLightMaker()
	pass # Replace with function body.

func HighLightMaker():
	var HighLighter = HighLightGetter.instantiate()
	HighLighter.mesh.size = AABBShape * HowMuchLargerThanShape
	HighLighter.mesh.material.albedo_color = ColForHighLighter
	add_child(HighLighter)
	pass
