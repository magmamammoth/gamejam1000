extends Node


func _on_negx_body_entered(body: Node2D) -> void:
	body.queue_free()
	print("woerking")



func _on_posx_body_entered(body: Node2D) -> void:
	body.queue_free()




func _on_negy_body_entered(body: Node2D) -> void:
	body.queue_free()





func _on_posy_body_entered(body: Node2D) -> void:
	body.queue_free()
