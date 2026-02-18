extends CanvasLayer

var isPaused = false

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func switchPause():
	isPaused = !isPaused
	$Bloor.visible = !($Bloor.visible)
	$PauseCnt.visible = !($PauseCnt.visible)
	if OS.get_name() == "Android" || OS.get_name() == "iOS":
		$"Virtual Joystick".visible = !($"Virtual Joystick".visible)
	get_tree().paused = isPaused
	if isPaused:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		switchPause()

func _on_to_main_pressed() -> void:
	switchPause()
	get_tree().change_scene_to_file("res://menu.tscn")
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func _on_cancel_main_pressed() -> void:
	switchPause()
