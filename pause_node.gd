extends CanvasLayer

var isPaused = false

func switchPause():
	isPaused = !isPaused
	$PauseBloor.visible = !($PauseBloor.visible)
	$PauseCnt.visible = !($PauseCnt.visible)
	#if OS.get_name() == "Android" || OS.get_name() == "iOS":
		#$JumpButton.visible = true
		#$MenuButton.visible = true
		#$"Virtual Joystick".visible = true	
	get_tree().paused = isPaused

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		switchPause()

func _on_to_main_pressed() -> void:
	switchPause()
	get_tree().change_scene_to_file("res://menu.tscn")

func _on_cancel_main_pressed() -> void:
	switchPause()
