var target = instance_nearest(x, y, hiker);

if (instance_exists(target)) {
    move_towards_point(target.x, target.y, 2); // speed = 2
}
