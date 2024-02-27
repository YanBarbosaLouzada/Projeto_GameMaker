// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_personagem_movendo(){
	direita = keyboard_check(ord("D"));
	esquerda = keyboard_check(ord("A"));
	cima = keyboard_check_pressed(ord("W"));

	hveloc = (direita - esquerda) * veloc;

	if direita{
		direc = 0;
		sprite_index = Spr_andando_direita;
	}else if esquerda{
		direc = 1;
		sprite_index = Spr_andando_esquerda;
	}else{
		if direc ==0{
			sprite_index = Spr_parado_direita;
		}else if direc == 1{
			sprite_index = Spr_parado_esquerda;
		}
	}
		

	if !place_meeting(x, y + 1, Obj_Chao) {
	    vveloc += gravidade;
	} else {
	    if cima {
	        vveloc = -2.8;
	    }
	}

	if place_meeting(x + hveloc, y, Obj_Chao) {
	    while !place_meeting(x + sign(hveloc), y, Obj_Chao) {
	        x += sign(hveloc);
	    }
	    hveloc = 0;
	}

	x += hveloc;


	if place_meeting(x, y + vveloc, Obj_Chao) {
	    while !place_meeting(x, y + sign(vveloc), Obj_Chao) {
	        y += sign(vveloc);
	    }
	    vveloc = 0;
	}

	y += vveloc;
	
	if keyboard_check_pressed(vk_space){
		image_index = 0;
		estado = spr_personagem_atacando;
		if direc == 0{
			instance_create_layer(x + 20, y - 8, "Instances",Obj_hitbox)
		}else if direc == 1{
			instance_create_layer(x - 20, y - 8, "Instances",Obj_hitbox)
		}
	}
}
function spr_personagem_atacando(){
	if direc = 0{
		sprite_index = spr_personagem_atacando_direita
	}else if direc = 1{
		sprite_index = spr_personagem_atacando_esquerda
	}
	if scr_fim_da_animacao(){
		estado = scr_personagem_movendo;
	}
}