extends Node2D

func _ready():
	var main_matrix = get_tree().root.get_meta("main_matrix") # get the matrix saved in the previous scene
	
	# convert it to a string in the format you want
	var display_text = "[%s, %s]\n[%s, %s]" % [
		main_matrix[0][0], main_matrix[0][1],
		main_matrix[1][0], main_matrix[1][1]
	]
	
	$"matrix label".text = display_text # assigns it to the label so it can be printed out


func _on_confirm_button_pressed() -> void:
	get_tree().change_scene_to_file("res://enter vector + ending screen stuff!/enter_vector_screen.tscn")

func _on_redo_button_pressed() -> void:
	get_tree().change_scene_to_file("res://enter matric screen stuff!/enter_matrix_screen.tscn")
