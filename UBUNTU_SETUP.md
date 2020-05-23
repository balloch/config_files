This is a file for going throught the GUI setup of Ubuntu. This should be done after all other setup is done.

WARNING: as it states in the README, always install CUDA first. CUDA is the Achilles heal of this whole setup and will remain as such until I move 100% of my code over to virtual environments and containers.

# Important Software 

Simple: its the stuff that isn't for coding. Some is best installed by apt, some by snap. Rarely by flatpak. In general, that is the order we should be considering things in, where an apt needs to work with the whole system, snaps are selfcontained for better or worse, and flatpak is weird and esoteric. Needless to say, install only important, stable things with apt, changing things with snap, and then avoid flatpak if you can.

'sudo snap install chromium-browser shotwell slack slack-desktop`

and then

`sudo snap install vlc gimp inkscape mathpix-snipping-tool spotify zotero-snap`

## Optional

For photo and video editing:
`sudo snap install darktable shotcut handbrake-jz`

If you have an android phone: 
`sudo apt install android-messages-desktop`

## Stuff you will need to go get the .deb or .run for:

This is entirely an optional list

 * PyCharm 
 * IntelliJ
 * TeamViewer
 

For GATech:
* [Cisco Anyconnect](https://software.cisco.com/download/home/286281283/type/282364313/release/4.8.03036)

# Gnome and GTK

Ubuntu 18.04+ doesn't have Unity, and frankly that is for the better. I haven't used KDE, I hear its just swell, but I use GTK. Why? Because its everywhere and conforming when possible simplifies life.

Install Tweaks and the shell extension for gnome. Heads up: most people prefer the chrome gnome shell over the firefox one. IDK, I just try to go with the flow. They're basically identical.

`sudo apt install gnome-tweaks gnome-shell-extensions chrome-gnome-shell`

## Windowing
I use Put Windows. Install it from here: https://extensions.gnome.org/extension/39/put-windows/
I have tooled around with i3. Its greate for what it is, but I have a fear of commitment to grand systems like that

