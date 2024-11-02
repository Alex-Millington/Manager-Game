extends Area2D

@export var speed = 400 # How fast the player will move (pixels/sec).
@export var min_x = -1000
@export var max_x = 1000
@export var min_y = -1000
@export var max_y = 1000
@export var start = Vector2(-500, 0)  # Center position for a 2000x2000 window

# Called when the node enters the scene tree for the first time.
func _ready():
	move_to_position()

# Function to move to a specified target position
func move_to_position(target_position: Vector2 = start):
	position = target_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position.x = clamp(position.x, min_x, max_x)
	position.y = clamp(position.y, min_y, max_y)
	
	if velocity.x != 0 or velocity.y != 0:
		$AnimatedSprite2D.animation = "go"
		$AnimatedSprite2D.flip_v = false
		# See the note below about the following boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x < 0
	else:
		$AnimatedSprite2D.animation = "stay"
