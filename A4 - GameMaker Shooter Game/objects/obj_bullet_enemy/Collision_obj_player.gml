/// @description Collision with player

// take away health points from the player
other.hp -= atk;

// destroy the bullet
instance_destroy(id, true);

// small explosion effect
effect_create_below(ef_explosion, other.x, other.y, 0.65, c_blue);