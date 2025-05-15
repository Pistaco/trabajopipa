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
	var saltar = Input.get_action_strength("ui_accept")
	velocity.x = inputVel * speed
	
	if saltar !=0 and is_on_floor():
		velocity.y =0
		velocity.y -= saltar * 2000
		
	
	if !is_on_floor():
		velocity.y += 100
	
	move_and_slide()
	if velocity.x !=0:
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("Iddle")
	
	if inputVel !=0:
		animated_sprite_2d.flip_h = inputVel <0
	print(inputVel)
