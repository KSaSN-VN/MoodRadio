extends Node2D

var emotion_list = ["Happy", "Calm", "Cry", "Sad", "Angry", "Almost_angry", "Scare", "Super_scare"]
var random_emotion
@onready var label: Label = $Text_box/Label
@onready var radio: Node2D = $Radio
var emotion_on_need
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var next_level : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	random_emotions()
	animated_sprite_2d.play("Calm")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	change_text_box()
	emotion_code()
	new_level()
	if radio.current_emotion_percent != null and radio.current_emotion_percent != "":
		animated_sprite_2d.play(radio.current_emotion_percent)

	if animated_sprite_2d.animation != radio.current_emotion_percent:
		animated_sprite_2d.play(radio.current_emotion_percent)

func emotion_code():
	if random_emotion == "Happy":
		emotion_on_need = "Happy"
	elif random_emotion == "Calm":
		emotion_on_need = "Happy"
	elif random_emotion == "Cry":
		emotion_on_need = "Sad"
	elif random_emotion == "Sad":
		emotion_on_need = "Sad"
	elif random_emotion == "Almost_angry":
		emotion_on_need = "Angry"
	elif random_emotion == "Angry":
		emotion_on_need = "Angry"
	elif random_emotion == "Scare":
		emotion_on_need = "Fear"
	elif random_emotion == "Super_scare":
		emotion_on_need = "Fear"
func change_text_box():
	if random_emotion == "Happy":
		label.text = "Emotion:
Happy 100%"
	elif random_emotion == "Calm":
		label.text = "Emotion:
Happy 35%"
	elif random_emotion == "Cry":
		label.text = "Emotion:
Sad 100%"
	elif random_emotion == "Sad":
		label.text = "Emotion:
Sad 45%"
	elif random_emotion == "Almost_angry":
		label.text = "Emotion:
Angry 45%"
	elif random_emotion == "Angry":
		label.text = "Emotion:
Angry 100%"
	elif random_emotion == "Scare":
		label.text = "Emotion:
Fear 50%"
	elif random_emotion == "Super_scare":
		label.text = "Emotion:
Fear 100%"


func _on_radio_submit_emotion() -> void:
	if random_emotion == radio.current_emotion_percent:
		next_level = true
		
func random_emotions():
	var old = random_emotion
	var new_value = old
	while new_value == old:
		new_value = emotion_list.pick_random()
	random_emotion = new_value
	
func new_level():
	if next_level == true:
		random_emotions()
		animated_sprite_2d.play("Calm")
		radio.current_emotion_percent = "Calm"
		next_level = false
