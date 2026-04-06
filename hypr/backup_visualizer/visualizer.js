import Astal from 'gi://Astal?version=3.0';
import Gtk from 'gi://Gtk?version=3.0';
import Gdk from 'gi://Gdk?version=3.0';
import GLib from 'gi://GLib';
import AstalCava from 'gi://AstalCava';

const app = new Astal.Application({
    instance_name: "audio-viz",
});

const CSS = `
* {
    background-color: transparent;
    background-image: none;
    box-shadow: none;
    border: none;
}
.cat-mask {
    background-image: url("/home/levi4tan/.config/hypr/sinfondo.png");
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center bottom;
    min-height: 500px;
}
.cava-bar {
    background: linear-gradient(to top, #fbf1e5 0%, #fef6e9 50%, #e5c890 100%);
    margin: 0 4px;
    min-width: 40px;
    border-radius: 4px 4px 0 0;
}
`;

app.connect('activate', () => {
    const provider = new Gtk.CssProvider();
    provider.load_from_data(CSS);
    Gtk.StyleContext.add_provider_for_screen(Gdk.Screen.get_default(), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);

    const win = new Astal.Window({
        namespace: "visualizer",
        layer: Astal.Layer.BOTTOM,
        anchor: Astal.WindowAnchor.TOP | Astal.WindowAnchor.BOTTOM | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT,
        exclusivity: Astal.Exclusivity.IGNORE,
        application: app,
    });

    const overlay = new Gtk.Overlay();
    win.add(overlay);

    const barsBox = new Gtk.Box({
        valign: Gtk.Align.END,
        halign: Gtk.Align.CENTER,
    });
    overlay.add(barsBox);

    const catMask = new Gtk.Box({
        hexpand: true,
        vexpand: true,
    });
    catMask.get_style_context().add_class('cat-mask');
    overlay.add_overlay(catMask);

    const cava = AstalCava.get_default();
    const MAX_HEIGHT = 450;
    const GAP_WIDTH = 600;

    let barsArgs = [];

    GLib.timeout_add(GLib.PRIORITY_DEFAULT, 16, () => {
        try {
            const values = cava.get_values();
            if (values.length === 0) return true;

            if (barsArgs.length !== values.length) {
                barsBox.get_children().forEach(ch => barsBox.remove(ch));
                barsArgs = [];

                const half = Math.floor(values.length / 2);
                const leftBox = new Gtk.Box({ valign: Gtk.Align.END });
                for (let i = 0; i < half; i++) {
                    const bar = new Gtk.Box({ valign: Gtk.Align.END, width_request: 40, height_request: 2 });
                    bar.get_style_context().add_class('cava-bar');
                    barsArgs.push(bar);
                    leftBox.pack_start(bar, false, false, 0);
                }
                barsBox.pack_start(leftBox, false, false, 0);

                const spacer = new Gtk.Box({ width_request: GAP_WIDTH });
                barsBox.pack_start(spacer, false, false, 0);

                const rightBox = new Gtk.Box({ valign: Gtk.Align.END });
                for (let i = half; i < values.length; i++) {
                    const bar = new Gtk.Box({ valign: Gtk.Align.END, width_request: 40, height_request: 2 });
                    bar.get_style_context().add_class('cava-bar');
                    barsArgs.push(bar);
                    rightBox.pack_start(bar, false, false, 0);
                }
                barsBox.pack_start(rightBox, false, false, 0);
                barsBox.show_all();
            }

            for (let i = 0; i < barsArgs.length; i++) {
                const h = Math.max(2, values[i] * MAX_HEIGHT);
                barsArgs[i].set_size_request(40, h);
            }
        } catch (e) { }
        return true;
    });

    win.show_all();
});

app.run(null);
