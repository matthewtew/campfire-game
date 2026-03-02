var target = instance_nearest(x, y, hiker);

if (instance_exists(target)) {
    move_towards_point(target.x, target.y, 2); // speed = 2
}



if (place_meeting(x, y, hiker)) {
    hiker.x = hiker.start_x;
    hiker.y = hiker.start_y;
}

