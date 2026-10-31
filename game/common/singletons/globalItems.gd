extends Node

var itemClass=preload("res://common/class/item_class.gd")
var attackClass=preload("res://common/class/item/attack_class.gd")
var potionClass=preload("res://common/class/item/potion_class.gd")

enum ID {
	#weapons
	WOOD_SWORD,
	#potions 
	HEALTH_POTION_10,
	#maps
	GORMON_STAR_MAP,
	#tools
	SPADE,
	
	#things
	GORDMON_STAR,
	
	NAILS,

	HONEY,

	BUCKET
	
	}

var itemList={
	
	ID.WOOD_SWORD:itemClass.new(
		"Epée en bois",
		"Une simple épée en bois de hêtre",
		"common/items/weapons/wood-sword.png",
		itemClass.TYPE.WEAPON,
		[
			attackClass.new(
				"Attaque simple",
				"attack_wood-sword_simple",
				10,
				0
			),
			attackClass.new(
				"Attaque avancée",
				"attack_wood-sword_advanced",
				20,
				10
			),
			attackClass.new(
				"Attaque en feu",
				"attack_wood-sword_onfire",
				50,
				50
			)
		]
	),
	ID.HEALTH_POTION_10:itemClass.new(
		"Potion de santé",
		"Une potion de santé qui donne 10 points de vie.",
		"common/items/magicpotion/magic-potion.png",
		itemClass.TYPE.MAGICPOTION,
		[	
			potionClass.new("increaseLife",10)
		]
	),
	ID.SPADE:itemClass.new(
		"Pelle",
		"Une pelle pour creuser",
		"common/items/tools/spade.png",
		itemClass.TYPE.TOOL
	),
	ID.GORMON_STAR_MAP:itemClass.new(
		"Carte",
		"Carte au tresor des etoiles de Gormon",
		"common/items/maps/gormon-star-map.png",
		itemClass.TYPE.MAP
	),
	ID.GORDMON_STAR:itemClass.new(
		"Etoile",
		"Etoile de Gormon",
		"common/items/things/gordon-star.png",
		itemClass.TYPE.THING
	),
	ID.NAILS:itemClass.new(
		"Clous",
		"Clous pour le puit",
		"common/items/things/nails.png",
		itemClass.TYPE.THING
	),
	ID.HONEY:itemClass.new(
		"Miel",
		"Miel pour réparer le puit",
		"common/items/things/honey.png",
		itemClass.TYPE.THING
	),
	ID.BUCKET:itemClass.new(
		"Seau",
		"Seau pour le puit",
		"common/items/things/bucket.png",
		itemClass.TYPE.THING
	)
}

func getItem(key_):
	var item=itemList[int(key_)]
	if GlobalGame.getLang()==GlobalGame.PT:
		match int(key_):
			ID.WOOD_SWORD:
				item.name="Espada de madeira"
				item.description="Uma espada simples feita de madeira de faia."
				item.actionList[0].name="Ataque simples"
				item.actionList[1].name="Ataque avançado"
				item.actionList[2].name="Ataque flamejante"
			ID.HEALTH_POTION_10:
				item.name="Poção de vida"
				item.description="Uma poção que recupera 10 pontos de vida."
			ID.SPADE:
				item.name="Pá"
				item.description="Uma pá para cavar."
			ID.GORMON_STAR_MAP:
				item.name="Mapa"
				item.description="Mapa do tesouro das Estrelas de Gormon."
			ID.GORDMON_STAR:
				item.name="Estrela"
				item.description="Estrela de Gormon."
			ID.NAILS:
				item.name="Pregos"
				item.description="Pregos para consertar o poço."
			ID.HONEY:
				item.name="Mel"
				item.description="Mel para consertar o poço."
			ID.BUCKET:
				item.name="Balde"
				item.description="Balde para o poço."
	return item
	
	


