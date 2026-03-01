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
