extends Node2D

@export var rayo_scene: PackedScene
@export var spawn_rate: float = 1.5
@export var rayo_speed: float = 1500
@export var rayo_width: float = 30
@export var movimiento_suavizado: float = 0.1
@export var rango_movimiento_x: float = 300.0
@export var velocidad_movimiento: float = 500.0

var direccion: float = 1  # 1 para derecha, -1 para izquierda
var posicion_inicial: Vector2

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var spawn_timer: Timer = $Rayos/RayoSpawn

func _ready():
	posicion_inicial = position
	spawn_timer.wait_time = spawn_rate
	spawn_timer.start()
	animated_sprite.play("floatar")  # Nombre de tu animación

func _process(delta):
	# Movimiento horizontal suave de vaivén
	position.x += velocidad_movimiento * direccion * delta
	
	# Cambiar dirección cuando llega a los límites
	if abs(position.x - posicion_inicial.x) > rango_movimiento_x / 2:
		direccion *= -1
	
	# Suavizar movimiento en Y (opcional)
	var movimiento_y = sin(Time.get_ticks_msec() * 0.001) * 20
	position.y = lerp(position.y, posicion_inicial.y + movimiento_y, movimiento_suavizado)

func _on_rayo_spawner_timeout():
	spawn_rayo()

func spawn_rayo():
	var rayo = rayo_scene.instantiate()
	$RaySystem.add_child(rayo)
	
	# Posición relativa a la luna con pequeña variación aleatoria
	var offset_x = randf_range(-50, 50)
	rayo.position = Vector2(offset_x, animated_sprite.texture.get_height() / 2)
	rayo.global_position = rayo.global_position  # Convertir a posición global
	
	# Configurar propiedades del rayo
	rayo.speed = rayo_speed
	rayo.width = rayo_width
