event_inherited();
if vida > 0{
	if place_meeting(x, y, Obj_parede_inimigo){
			if direc == 0{
				direc = 1;
			}else if direc ==1{
				direc = 0;
			}
		}

		if direc == 0{
			sprite_index = Spr_cebola_andando_direita
			x+=veloc;
		}else if direc == 1{
			sprite_index = Spr_cebola_andando_esquerda
			x-=veloc;
		}

		if vida <= 0{
			instance_destroy();	
		}
}