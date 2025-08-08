@tool
extends EditorPlugin

func _enter_tree() -> void: 
	# Only run on Linux
	if OS.get_name() != "Linux": return

	# Initialization of the plugin goes here.
	var settings: EditorSettings = EditorInterface.get_editor_settings()
	var blender_path: String     = "/usr/bin/blender"
	settings.set_setting("filesystem/import/blender/blender_path", blender_path)
	pass

func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	pass
