# ProfitLabel.gd
extends Label

var profit = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_display()

# Updates the display of profit on the label
func update_display():
	text = "Profit: " + str(profit)
