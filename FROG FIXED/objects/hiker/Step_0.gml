// If standing on a moving block, move with it
var plat = instance_place(x, y + 1, oSolid);
if (plat != noone) {
    // Move the player by the platform's movement amount
    y += (plat.y - plat.yprevious);

    // Optional: tiny extra lift to avoid clipping
    y -= 0.05;
}
// Reset horizontal speed
x_speed = 0;

// Apply gravity
y_speed += grav;

// Horizontal input
if (keyboard_check(vk_right)) {
    x_speed = movement_speed;
} else if (keyboard_check(vk_left)) {
    x_speed = -movement_speed;
}

// JUMPING
if (place_meeting(x, y + 1, oSolid)) {
    if (keyboard_check_pressed(vk_up)) {
        y_speed = -10;
    }
}

// --- COLLISION RESOLUTION ---

// Horizontal collision
if (place_meeting(x + x_speed, y, oSolid)) {
    while (!place_meeting(x + sign(x_speed), y, oSolid)) {
        x += sign(x_speed);
    }
    x_speed = 0;
}
x += x_speed;

// Vertical collision
if (place_meeting(x, y + y_speed, oSolid)) {
    while (!place_meeting(x, y + sign(y_speed), oSolid)) {
        y += sign(y_speed);
    }
	
	
    y_speed = 0;
}
y += y_speed;


if (y > room_height + 500 or y < -200 or x > room_width + 50 or x < -50) { room_restart(); }



score_timer += 1;

if (score_timer >= room_speed * 2) { // 2 seconds
    score += 1;
    score_timer = 0;
}

