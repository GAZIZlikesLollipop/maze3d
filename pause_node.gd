extends CanvasLayer

var isPaused = false

func switchPause():
	if isPaused:
		isPaused = false
		$PauseBloor.visible = false
		$PauseCnt.visible = false
		if OS.get_name() == "Android" || OS.get_name() == "iOS":
			$JumpButton.visible = true
			$"Virtual Joystick".visible = true
			$MenuButton.visible = true
		get_tree().paused = false
		return
	else:
		isPaused = true
		$PauseBloor.visible = true
		$PauseCnt.visible = true
		if OS.get_name() == "Android" || OS.get_name() == "iOS":
			$JumpButton.visible = false
			$"Virtual Joystick".visible = false
			$MenuButton.visible = false
		get_tree().paused = true
		return
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		switchPause()

func _on_cancel_main_pressed() -> void:
	switchPause()
func _on_to_main_pressed() -> void:
	switchPause()
	get_tree().change_scene_to_file("res://menu.tscn")
