extends Node

# Catalogo inicial de criaturas originais, usando sprites do proprio jogo.
const SPECIES = {
	"caranguito": {
		"name": "Caranguito",
		"type": "Água",
		"max_hp": 36,
		"attack": 8,
		"defense": 5,
		"sprite": "res://screens/crabs-village/game3-room/assets/character/crab-walking-down.png",
		"description": "Um pequeno crustáceo corajoso que protege seu parceiro.",
		"frame_width": 32, "frame_height": 32, "frame_count": 3,
		"moves": [{"name":"Jato d’água","damage":11,"xp_min":0},{"name":"Pinça veloz","damage":15,"xp_min":5}]
	},
	"abelume": {
		"name": "Abelume",
		"type": "Inseto",
		"max_hp": 30,
		"attack": 9,
		"defense": 3,
		"sprite": "res://common/moving-fighters/bee/bee-flying.png",
		"description": "Uma criatura veloz que usa suas asas para atacar.",
		"frame_width": 32, "frame_height": 32, "frame_count": 3,
		"moves": [{"name":"Picada","damage":10,"xp_min":0},{"name":"Rajada de asas","damage":14,"xp_min":5}]
	},
	"aranhito": {
		"name": "Aranhito",
		"type": "Veneno",
		"max_hp": 32,
		"attack": 10,
		"defense": 4,
		"sprite": "res://common/fighters/spider1/enemy1-idle.png",
		"description": "Uma aranha selvagem que pode se tornar uma aliada.",
		"frame_width": 64, "frame_height": 64, "frame_count": 4,
		"moves": [{"name":"Mordida","damage":11,"xp_min":0},{"name":"Jato de teia","damage":15,"xp_min":5}]
	},
	"ursolino": {
		"name": "Ursolino",
		"type": "Terra",
		"max_hp": 44,
		"attack": 7,
		"defense": 8,
		"sprite": "res://screens/bear-village/assets/bear/bear-idle.png",
		"description": "Um pequeno urso resistente e muito leal.",
		"frame_width": 32, "frame_height": 32, "frame_count": 5,
		"moves": [{"name":"Pancada","damage":10,"xp_min":0},{"name":"Investida","damage":16,"xp_min":5}]
	}
}

func createCreature(species_id_:String, level_:int=1) -> Dictionary:
	if not SPECIES.has(species_id_):
		push_warning("Espécie de criatura desconhecida: " + species_id_)
		return {}
	var species=SPECIES[species_id_]
	var max_hp=int(species.max_hp)+(level_-1)*4
	return {
		"species_id": species_id_,
		"name": species.name,
		"type": species.type,
		"level": level_,
		"xp": 0,
		"hp": max_hp,
		"max_hp": max_hp,
		"attack": int(species.attack)+(level_-1)*2,
		"defense": int(species.defense)+(level_-1),
		"sprite": species.sprite,
		"description": species.description,
		"frame_width": int(species.frame_width),
		"frame_height": int(species.frame_height),
		"frame_count": int(species.frame_count)
	}

func getMoves(species_id_:String) -> Array:
	if !SPECIES.has(species_id_):
		return []
	return SPECIES[species_id_].moves.duplicate(true)

func getTypeMultiplier(attacker_type_:String, defender_type_:String) -> float:
	var advantages={
		"Água":["Fogo","Terra"],
		"Fogo":["Planta","Inseto"],
		"Planta":["Água","Terra"],
		"Terra":["Veneno"],
		"Veneno":["Inseto"],
		"Inseto":["Água"]
	}
	var disadvantages={
		"Fogo":["Água"],
		"Planta":["Fogo","Inseto"],
		"Água":["Planta","Inseto"],
		"Veneno":["Terra"],
		"Inseto":["Veneno","Fogo"]
	}
	if advantages.get(attacker_type_,[]).has(defender_type_):
		return 1.5
	if disadvantages.get(attacker_type_,[]).has(defender_type_):
		return 0.75
	return 1.0

func getSpecies(species_id_:String) -> Dictionary:
	return SPECIES.get(species_id_, {}).duplicate(true)

func getSpeciesIds() -> Array:
	return SPECIES.keys()
