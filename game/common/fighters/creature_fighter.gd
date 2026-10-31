extends Node2D

signal attackFinished
signal damageFinished
signal dieFinished

var creatureData={}

func setCreature(creature_):
	creatureData=creature_.duplicate(true)
	var texture=load(str(creatureData.get("sprite","")))
	if texture==null:
		push_error("Sprite da criatura não encontrado.")
		return
	var frameWidth=int(creatureData.get("frame_width",32))
	var frameHeight=int(creatureData.get("frame_height",32))
	var frameCount=int(creatureData.get("frame_count",1))
	var frames=SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_speed("idle",5.0)
	frames.set_animation_loop("idle",true)
	for i in range(frameCount):
		var atlas=AtlasTexture.new()
		atlas.atlas=texture
		atlas.region=Rect2(i*frameWidth,0,frameWidth,frameHeight)
		frames.add_frame("idle",atlas)
	$AnimatedSprite2D.sprite_frames=frames
	$AnimatedSprite2D.play("idle")
	var displayScale=float(creatureData.get("display_scale",1.5))
	scale=Vector2.ONE*displayScale

func playAttack(targetPosition_):
	var origin=position
	var direction=1.0 if targetPosition_.x>position.x else -1.0
	var tween=create_tween()
	tween.tween_property(self,"position",origin+Vector2(22*direction,-3),0.12)
	tween.tween_property(self,"position",origin,0.12)
	await tween.finished
	emit_signal("attackFinished")

func playDamage():
	var origin=position
	var tween=create_tween()
	modulate=Color(2.2,0.7,0.7)
	tween.tween_property(self,"modulate",Color.WHITE,0.18)
	tween.parallel().tween_property(self,"position",origin+Vector2(3,0),0.05)
	tween.tween_property(self,"position",origin+Vector2(-3,0),0.05)
	tween.tween_property(self,"position",origin,0.05)
	await tween.finished
	emit_signal("damageFinished")

func playIdle():
	$AnimatedSprite2D.play("idle")

func playDie():
	var tween=create_tween()
	tween.tween_property(self,"modulate:a",0.0,0.25)
	await tween.finished
	emit_signal("dieFinished")

func getHeadPosition():
	return position+Vector2(0,-18)
