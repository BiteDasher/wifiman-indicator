namespace Custom {
public static async void update_indicator_icon () {	
	string shell_command = "get_iw_signal";
	string stdout;
	Process.spawn_command_line_sync (shell_command, out stdout);
	string[] signal = stdout.split ("/");
	int percentage = (int) ((float.parse (signal[0]) / float.parse (signal[1])) * 100);
	print(percentage.to_string());
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

	context.set_source_rgb (r, g, b);

	context.move_to (110.0, 110.0);
	context.rel_line_to (-100.0, 0.0);
	context.rel_line_to (100.0, -100.0);
	context.close_path ();
	context.stroke();

	context.move_to (10.0, 110.0);
	context.rel_line_to (pos, 0.0);
	context.rel_line_to(0.0, -pos);
	context.close_path ();
	context.fill ();
	context.stroke();


	context.set_source_rgb (r, g, b);
	context.select_font_face ("FreeSans", Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
	context.set_font_size (60);
	context.move_to (5, 50);
	context.show_text (percentage.to_string ()); 

	surface.write_to_png ("/tmp/signal.png");
}
}
