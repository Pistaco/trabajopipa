extends Area2D

var speed: float = 100
var width: float = 20
var damage: int = 1

func _ready():
	$CollisionShape2D.shape.size.x = width
	$Sprite2D.scale.x = width / $Sprite2D.texture.get_width()

func _physics_process(delta):
	position.y += speed * delta
	if position.y > get_viewport_rect().size.y + 50:
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(damage)
	queue_free()
