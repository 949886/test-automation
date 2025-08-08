@tool
extends EditorPlugin

const BLENDER_LINUX_PATH: String = "/usr/bin/blender"

func _enter_tree() -> void: 
	# Only run on Linux
	if OS.get_name() != "Linux": return

	# Initialization of the plugin goes here.
	var settings: EditorSettings = EditorInterface.get_editor_settings()
	settings.set_setting("filesystem/import/blender/blender_path", BLENDER_LINUX_PATH)
	print("Blender path set to: ", BLENDER_LINUX_PATH)
	pass

func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	pass
