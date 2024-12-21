extends Node

var state = {
	"Idle": preload("res://Script/Monster/Ai Melee/IdleState.gd"),
	"Run": preload("res://Script/Monster/Ai Melee/RunState.gd"),
	"Attack": preload("res://Script/Monster/Ai Melee/AttackState.gd"),
	"Death": preload("res://Script/Monster/Ai Melee/DeathState.gd"),
}

func change_state(new_state:String):
	if get_child_count() !=0:
		if !("Death" in get_child(0).name):
			get_child(0).queue_free()
	if state.has(new_state):
		var state_temp = state[new_state].new()
		state_temp.name = new_state
		add_child(state_temp)
