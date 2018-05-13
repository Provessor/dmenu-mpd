# dmenu-mpd

A simple script for controlling mpd from dmenu

## Installation
### Dependencies
* bash

* mpd

* dmenu

* pywal (optional)

### Running

Download the repo:
```
git clone https://github.com/provessor/dmenu-mpd
```

Run `dmenu-mpd.sh` or `dmenu-mpd-wal.sh` to use your pywal colourscheme (if it exists).

The script currently does not take any arguments. 

### i3

Bind to a key:
```
bindsym $mod+n exec "[DOWNLOAD-DIR]/dmenu-mpd/dmenu-mpd.sh"
```

Change `$mod+n` to whatever keybinding you want and `[DOWNLOAD-DIR]` to your
download location.

## Contributing

If you make any changes and want to share, send a pull request. You will get
full credit for any improvements.

## License

This project is not under any liscence.

Do whatever you want.

## Acknowledgments

* This script originally used snippets from
[cdown/mpdmenu](https://github.com/cdown/mpdmenu)

* Inspired by Luke Smith's [video](https://youtu.be/R9m723tAurA)
