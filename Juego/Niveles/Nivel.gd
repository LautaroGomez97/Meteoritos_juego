# Nivel.gd
class_name Nivel
extends Node2D

##Export var
export var explosion:PackedScene = null

# Atributos Onready
onready var contenedor_poyectiles:Node

# Metodos
func _ready() -> void:
	conectar_seniales()
	crear_contenedores()
	
## Metodos Custom
func conectar_seniales() -> void:
	Eventos.connect("disparo",self, "_on_disparo")
	Eventos.connect("nave_destruida", self, "_on_nave_destruida")

func _on_nave_destruida(posicion:Vector2, num_explosiones: int) -> void:
# warning-ignore:unused_variable
	for i in range(num_explosiones):
		var new_explosion:Node2D = explosion.instance()
		new_explosion.global_position = posicion
		add_child(new_explosion)
		yield(get_tree().create_timer(0.6), "timeout")
	

func crear_contenedores() -> void:
	contenedor_poyectiles = Node.new()
	contenedor_poyectiles.name = "ContenedorProyectiles"
	add_child(contenedor_poyectiles)


func _on_disparo(proyectil:Proyectil) -> void:
	contenedor_poyectiles.add_child(proyectil)
