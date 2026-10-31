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
		"description": "Um pequeno crustáceo corajoso que protege seu parceiro."
	},
	"abelume": {
		"name": "Abelume",
		"type": "Inseto",
		"max_hp": 30,
		"attack": 9,
		"defense": 3,
		"sprite": "res://common/moving-fighters/bee/bee-flying.png",
		"description": "Uma criatura veloz que usa suas asas para atacar."
	},
	"aranhito": {
		"name": "Aranhito",
		"type": "Veneno",
		"max_hp": 32,
		"attack": 10,
		"defense": 4,
		"sprite": "res://common/fighters/spider1/enemy1-idle.png",
		"description": "Uma aranha selvagem que pode se tornar uma aliada."
	},
	"ursolino": {
		"name": "Ursolino",
		"type": "Terra",
		"max_hp": 44,
		"attack": 7,
		"defense": 8,
		"sprite": "res://screens/bear-village/assets/bear/bear-idle.png",
		"description": "Um pequeno urso resistente e muito leal."
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
		"description": species.description
	}

func getSpecies(species_id_:String) -> Dictionary:
	return SPECIES.get(species_id_, {}).duplicate(true)

func getSpeciesIds() -> Array:
	return SPECIES.keys()
