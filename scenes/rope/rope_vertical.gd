extends Area2D




func _on_body_entered(body):
	if body.is_in_group("rope_vertical"):
		body.on_climbing_start()


func _on_body_exited(body):
	if body.is_in_group("rope_vertical"):
		body.on_climbing_end()
