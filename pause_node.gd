extends CanvasLayer

var isPaused = false

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func switchPause():
	isPaused = !isPaused
	$PauseBloor.visible = !($PauseBloor.visible)
	$PauseCnt.visible = !($PauseCnt.visible)
	if OS.get_name() == "Android" || OS.get_name() == "iOS":
		$JumpBox.visible = !($JumpBox.visible)
		$"Virtual Joystick".visible = !($"Virtual Joystick".visible)
	get_tree().paused = isPaused
	if isPaused:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE 

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		switchPause()

func _on_to_main_pressed() -> void:
	switchPause()
	get_tree().change_scene_to_file("res://menu.tscn")

func _on_cancel_main_pressed() -> void:
	switchPause()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
