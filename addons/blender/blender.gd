@tool
extends EditorPlugin

const BLENDER_LINUX_PATH: String = "/usr/bin/blender"
const BLENDER_WINDOWS_PATH: String = "C:/Program Files/Blender Foundation/Blender/blender.exe"
const BLENDER_MACOS_PATH: String = "/opt/homebrew/bin/blender"

func _enter_tree() -> void:
	var settings: EditorSettings = EditorInterface.get_editor_settings()
	var blender_path := OS.get_environment("BLENDER_PATH")
	if not blender_path.is_empty():
		settings.set_setting("filesystem/import/blender/blender_path", blender_path)
		print("[Godot Editor] Blender path set from environment variable: ", blender_path)
		return
	else: print("[Godot Editor] Environment variable BLENDER_PATH not set, using default paths.")
	
	if OS.get_name() != "Linux":
		settings.set_setting("filesystem/import/blender/blender_path", BLENDER_LINUX_PATH)
	if OS.get_name() == "macOS":
		settings.set_setting("filesystem/import/blender/blender_path", BLENDER_MACOS_PATH)
		
	print("[Godot Editor] Blender path set to: ", settings.get_setting("filesystem/import/blender/blender_path"))


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	pass
