# based on https://github.com/ioannis-koukourakis/string-based-light-animations-for-godotengine/
class_name FlickerLight extends OmniLight3D

@export var FlickerPattern : String = "mpmmklmllmnmomnmknnmmmmlmmmnmmmnmmlmmmmm"
@export var FlickerRate : float = 0.1

var currFlickerPos = 0
var timeLeftToNextPos = FlickerRate

var baseEnergy = 1


func _ready():
	baseEnergy = light_energy
	currFlickerPos = randi_range(0, FlickerPattern.length() - 1)


func _process(delta):
	# update flicker pos
	timeLeftToNextPos -= delta
	if timeLeftToNextPos > 0:
		return
		
	# moving to next brightness
	currFlickerPos += 1
	if currFlickerPos >= FlickerPattern.length():
		currFlickerPos = 0
		
	timeLeftToNextPos += FlickerRate
	
	var brightnessLetter = FlickerPattern[currFlickerPos]
	var brightnessAscii = brightnessLetter.to_ascii_buffer()[0]
	var brightness = remap(brightnessAscii, 97, 122, 0, 2)			## 'a' - 'z'
	
	light_energy = baseEnergy * brightness
