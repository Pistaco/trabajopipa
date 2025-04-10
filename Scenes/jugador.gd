extends CharacterBody2D

func _ready():
	pass
	
func _process(delta):
	pass

func _input(event):
	pass
	
func _init():
	pass
	
var speed := 400
@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	var inputVel = Input.get_axis("ui_left","ui_right")
	velocity.x = inputVel * speed
	move_and_slide()
	if velocity.x !=0:
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("Iddle")
	
	
	print(inputVel)
