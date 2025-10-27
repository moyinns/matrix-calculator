extends Node2D

func _on_input_y_text_submitted(new_text: String) -> void:
	if !$input_x or !$input_y: # godot equivalent of try + except
		push_error("Input fields not found in scene.")
		return

	if !get_tree().root.has_meta("main_matrix"): # finds the main 2x2 matrix
		push_error("Main matrix not found.") # godot equivalent of try + except
		return

	var main_matrix = get_tree().root.get_meta("main_matrix") # sets the main matrix as a variable


	var x = int($input_x.text) # reads the users inputs for x + y
	var y = int($input_y.text)

	var vector = [x, y] # saves the vector as a variable

	# performs the matrix multiplication
	var new_matrix = []
	for row in main_matrix:
		var total = (row[0] * x) + (row[1] * y)
		new_matrix.append(total)

	get_tree().root.set_meta("vector", vector) # save both for the next scene
	get_tree().root.set_meta("new_matrix", new_matrix)

	# go to ending/confirm scene
	get_tree().change_scene_to_file("res://enter vector + ending screen stuff!/ending_screen.tscn")
