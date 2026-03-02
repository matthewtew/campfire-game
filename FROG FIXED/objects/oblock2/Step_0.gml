if (!audio_is_playing(snd_music)) {
    if (mouse_check_button_pressed(mb_left)) {
        audio_play_sound(snd_music, 1, true);
    }
}


