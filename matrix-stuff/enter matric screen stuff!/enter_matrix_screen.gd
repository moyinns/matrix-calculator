extends Node2D

func input_main_matrix() -> Array: # reads matrix from LineEdits
	var a = int($input_a.text)
	var b = int($input_b.text)
	var c = int($input_c.text)
	var d = int($input_d.text)

	var main_matrix = [[a, b], # creates a matrix/array
					   [c, d]]

	for row in main_matrix: # prints out the array
		print(row)


	get_tree().root.set_meta("main_matrix", main_matrix) # saves the matrix so the next scenes can access it

	return main_matrix # function returns the matrix


# only call this when the last LineEdit (input_d) is submitted
func _on_input_d_text_submitted(new_text: String) -> void: # when enter is pressed on input d
	input_main_matrix() # calls func + returns the main matrix
	
	# switch to confirm scene
	get_tree().change_scene_to_file("res://enter matric screen stuff!/confirm_enter_matrix_screen.tscn")
