extends Node

var isPaused = false

func switchExit():
	isPaused = !isPaused
	$"CanvasLayer/Virtual Joystick".visible = !($"CanvasLayer/Virtual Joystick".visible)
	$CanvasLayer/Bloor.visible = !($CanvasLayer/Bloor.visible)
	$CanvasLayer/EndCnt.visible = !($CanvasLayer/EndCnt.visible)
	$CanvasLayer/MenuButton.visible = !($CanvasLayer/MenuButton.visible)
	get_tree().paused = isPaused
	
func _on_exit_zone_body_entered(body: Node3D) -> void:
	if body == $Player:
		switchExit()


func _on_again_pressed() -> void:
	switchExit()
	get_tree().reload_current_scene()

func _on_exit_pressed() -> void:
	switchExit()
	get_tree().change_scene_to_file("res://menu.tscn")
