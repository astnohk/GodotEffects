extends Node2D

@onready var canvas: ColorRect = get_node('CanvasLayer/ColorRect')
var mat: ShaderMaterial
var t: float = 1.0
const T: float = 8.0
const rot1: float = 34.0
const rot2: float = -35.0
const rot3: float = 46.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mat = canvas.material
	mat.set_shader_parameter("rot1", rot1)
	mat.set_shader_parameter("rot2", rot2)
	mat.set_shader_parameter("rot3", rot3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	t += delta
	mat.set_shader_parameter("rot1", rot1 * max(0.0, sin(0.5 * PI * (T - t) / T)))
	mat.set_shader_parameter("rot2", rot2 * max(0.0, sin(0.5 * PI * (T - t) / T)))
	mat.set_shader_parameter("rot3", rot3 * max(0.0, sin(0.5 * PI * (T - t) / T)))
