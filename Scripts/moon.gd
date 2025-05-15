extends Node2D

@export var rayo_scene: PackedScene
@export var spawn_rate: float = 1.5
@export var rayo_speed: float = 150
@export var rayo_width: float = 30

@onready var spawn_timer: Timer = $Rayos/RayoSpawner

func _ready():
	spawn_timer.wait_time = spawn_rate
	spawn_timer.start()

func _on_rayo_spawner_timeout():
	spawn_rayo()

func spawn_rayo():
	var rayo = rayo_scene.instantiate()
	$Rayos.add_child(rayo)
	
	# Posición aleatoria en la parte superior
	var viewport_size = get_viewport_rect().size
	rayo.position = Vector2(randf_range(50, viewport_size.x - 50), 0)
	
	# Configurar propiedades del rayo
	rayo.speed = rayo_speed
	rayo.width = rayo_width
