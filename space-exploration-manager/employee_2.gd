extends Area2D
var is_contacting = false

@export var start = Vector2(750, 0)  # Center position for a 2000x2000 window

# Called when the node enters the scene tree for dthe first time.
func _ready():
	$AnimatedSprite2D.animation = "default"
	move_to_position()

# Function to move to a specified target position
func move_to_position(target_position: Vector2 = start):
	global_position = target_position  # Set the position to the target
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("go_through_door"):
		if is_contacting:
			get_tree().change_scene_to_file("res://Office Lounge.tscn")

func _on_Employee_area_entered(area: Area2D) -> void:
	$AnimatedSprite2D.animation = "contact"
	is_contacting = true

func _on_employee_area_exited(area: Area2D) -> void:
	$AnimatedSprite2D.animation = "default"
	is_contacting = false
