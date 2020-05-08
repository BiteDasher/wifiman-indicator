namespace Custom {
    public static void update_indicator_icon () {
        string shell_command = "get_iw_signal";
        string stdout;
        try {
            Process.spawn_command_line_sync (shell_command, out stdout);
        } catch (SpawnError e) {
            print ("Error running command \"%s\": %s\n", shell_command, e.message);
        }
        string[] signal = stdout.split ("/");
        int percentage = (int) ((float.parse (signal[0]) / float.parse (signal[1])) * 100);

        int pos = percentage + 5;

        uint8 r;
        uint8 g;
        uint8 b;

        if (percentage > 70) {
            r = 0;
            g = 1;
            b = 0;
        } else if (percentage > 30) {
            r = 1;
            g = 1;
            b = 0;
        } else {
            r = 1;
            g = 0;
            b = 0;
        }

        Cairo.ImageSurface surface = new Cairo.ImageSurface (Cairo.Format.ARGB32, 120, 120);
        Cairo.Context context = new Cairo.Context (surface);

        context.set_source_rgba (r, g, b, 0.5);

        context.move_to (110.0, 110.0);
        context.rel_line_to (-100.0, 0.0);
        context.rel_line_to (100.0, -100.0);
        context.close_path ();
        context.stroke ();

        context.move_to (10.0, 110.0);
        context.rel_line_to (pos, 0.0);
        context.rel_line_to (0.0, -pos);
        context.close_path ();
        context.fill ();
        context.stroke ();


        context.set_source_rgb (r, g, b);
        context.select_font_face ("FreeSans", Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
        context.set_font_size (60);
        context.move_to (5, 50);
        string text;
        if (percentage == 0) {
            text = "✖";
        } else {
            text = percentage.to_string ();
        }
        context.show_text (text);

        surface.write_to_png ("/tmp/signal.png");
    }
}
