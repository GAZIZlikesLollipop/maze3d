extends CanvasLayer
var isPaused = false

func switchPause():
	if isPaused:
		isPaused = false
		$PauseBloor.visible = false
		$PauseCnt.visible = false
		get_tree().paused = false
	else:
		isPaused = true
		$PauseBloor.visible = true
		$PauseCnt.visible = true
		get_tree().paused = true
	

func _process(delta: float) -> void:
	if Input.is_action_pressed("pause"):
		switchPause()

func _on_to_main_pressed() -> void:
	isPaused = false
	$PauseBloor.visible = false
	$PauseCnt.visible = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu.tscn")
	
func _on_cancel_main_pressed() -> void:
	isPaused = false	
	$PauseBloor.visible = false
	$PauseCnt.visible = false
	get_tree().paused = false
