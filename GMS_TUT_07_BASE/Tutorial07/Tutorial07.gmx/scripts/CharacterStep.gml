if(m_isDead)
    return 0;
    
if(m_hp == 0){
    m_isDead = true;
    sprite_index = spr_character_die;
    return 0;
}

if(sprite_index == spr_character_attack_side 
|| sprite_index == spr_character_attack_front
|| sprite_index == spr_character_attack_back){
    if(image_index > 2 && m_fired == false){ 
        var bullet = instance_create(x, y, obj_character_bullet);
        var deltaX = 0;
        var deltaY = 0;
        switch(m_playerDirection)
        {
        case PlayerDirection.UP:
          bullet.m_speedY = -10;
          bullet.image_angle = 270;
          deltaY = -89;
          break;
        case PlayerDirection.DOWN:
          bullet.m_speedY = 10;
          bullet.image_angle = 90;
          deltaY = 7;
          break;
        case PlayerDirection.LEFT:
          bullet.m_speedX = -10;
          deltaX = -65;
          deltaY = -33;
          break;
        case PlayerDirection.RIGHT:
          bullet.m_speedX = 10;
          bullet.image_angle = 180;
          deltaX = 65;
          deltaY = -33;
          break;
        } 
        bullet.phy_position_x += deltaX;
        bullet.phy_position_y += deltaY;
        m_fired = true;
    }
}

if(sprite_index == spr_character_skill){
    if(image_index > 2 && m_fired == false){
        instance_create(x, y, obj_character_skill_effect);
        m_fired = true
    }
}

