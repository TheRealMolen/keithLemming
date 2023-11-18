extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var mat = get_active_material(0).duplicate()
	mat.albedo_color = Color(randf_range(0.32, 0.37), randf_range(0.32, 0.37), randf_range(0.32, 0.37))
	set_surface_override_material(0, mat)

