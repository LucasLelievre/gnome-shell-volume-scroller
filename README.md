# Volume Scroller for GNOME Shell

Use the mouse wheel on the GNOME Top Bar to increase or decrease volume.

This was forked from https://github.com/francislavoie/gnome-shell-volume-scroller with an added setting which limits the scrolling area to the quick settings panel button.

## Manual Installation

To install the extension, run the following bash command: `make install`

Then restart GNOME Shell by logging out and back in.

## Contributing

If you need to update the schema file, run this to update the compiled schema:

```bash
glib-compile-schemas src/schemas/
```
