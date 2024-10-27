@tool
extends MeshInstance2D

var acc: float = 0.0
var shader: ShaderMaterial


# Called when the node enters the scene tree for the first time.
func _ready():
	shader = self.material


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	acc += delta
	shader.set_shader_parameter("t", acc)
