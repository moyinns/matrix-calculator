extends Node2D

func _ready():
	var main_matrix = get_tree().root.get_meta("main_matrix") # assigns the main + new matrix as variables
	var new_matrix = get_tree().root.get_meta("new_matrix")

	var vector = []
	if get_tree().root.has_meta("vector"):
		vector = get_tree().root.get_meta("vector")
	else:
		vector = ["x", "y"] # godot equivalent of try + except

	# format each part
	var main_matrix_text = "[%s %s]\n[%s %s]" % [main_matrix[0][0], main_matrix[0][1], main_matrix[1][0], main_matrix[1][1]]
	var vector_text = "[%s]\n[%s]" % [vector[0], vector[1]]
	var new_matrix_text = "[%s]\n[%s]" % [new_matrix[0], new_matrix[1]]

	# assign text to labels so it can be printed out
	if has_node("og_2x2_matrix"):
		$og_2x2_matrix.text = main_matrix_text
	if has_node("og_2x1_matrix"):
		$og_2x1_matrix.text = vector_text
	if has_node("final_matrix"):
		$final_matrix.text = new_matrix_text
		



func _on_redo_pressed() -> void:
	get_tree().change_scene_to_file("res://enter vector + ending screen stuff!/enter_vector_screen.tscn")


func _on_start_again_pressed() -> void:
	get_tree().change_scene_to_file("res://opening screen stuff!/opening_screen.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
