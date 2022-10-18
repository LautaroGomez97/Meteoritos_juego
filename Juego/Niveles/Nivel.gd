# Nivel.gd
class_name Nivel
extends Node2D

# Atributos Onready
onready var contenedor_poyectiles:Node

# Metodos
func _ready() -> void:
	conectar_seniales()
	crear_contenedores()
	
## Metodos Custom
func conectar_seniales() -> void:
	Eventos.connect("disparo",self, "_on_disparo")

func crear_contenedores() -> void:
	contenedor_poyectiles = Node.new()
	contenedor_poyectiles.name = "ContenedorProyectiles"
	add_child(contenedor_poyectiles)


func _on_disparo(proyectil:Proyectil) -> void:
	contenedor_poyectiles.add_child(proyectil)
