draw_self();

if faca == true{
	var dir = point_direction(x,y,mouse_x,mouse_y)
	var xx = lengthdir_x(20,dir);
	var yy = lengthdir_y(20,dir);
	
	draw_sprite_ext(spr_faca,0,x + xx,y - 8 + yy, 1, 1, dir, c_white, 1);
	
	if mouse_check_button_pressed(mb_left){
		var inst = instance_create_layer(x+xx,y-8+yy,"Instances",Obj_Faca);
		inst.melhoria = false;
		inst.direction = dir;
		inst.image_angle = dir;
		inst.speed = 8;
		faca_cargas -= 1
	}
	if faca_cargas <= 0{
		faca = false;
	}
}

