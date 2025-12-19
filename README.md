# pipewire-spa-plugin-csound
This repository is the result of trying to run Csound as a PipeWire spa filter

First install Csound version 7 (currently in beta).
https://csound.com
https://github.com/csound/csound/blob/develop/BUILD.md

Then get PipeWire source code, for example from their GitLab:
https://gitlab.freedesktop.org/pipewire/pipewire

Apply the patch file found in this repository to add the Csound functionality.
Build the spa csound plugin and copy it to somewhere on library path.

**Example steps**:

```sh
# Go to PipeWire source directory:
cd pipewire
# Apply patch:
git apply path/to/where/you/have/the/patch/file/0001-spa-csound-Csound-version-7-based-spa-plugin-effects.patch
# Configure:
meson setup --prefix ~/.local build
# Build:
cd build
ninja spa/plugins/csound/libspa-csound.so
# Install:
mkdir -p ~/.local/lib64/spa-0.2/csound
cp spa/plugins/csound/libspa-csound.so ~/.local/lib64/spa-0.2/csound/libspa-csound.so

```

The patch was diffed againts current at the time PipeWire git HEAD so above the patching step may fail if there have been many changes.

Example configuration using this plugin can be found in the config sub directory here (including instructions about where to put those files).
The example Csound file (crossfeed.csd) is just a simplified spatialization / basic crossfeed kind of effect for headphones listening. No realism guarantees here.

*Once they are in place run:*

```sh
systemctl --user restart pipewire
```
To make sure the configs get loaded.

After that you should have a new virtual output device called "Csound Sink". 
Just set this as the default and then your music should play with effects applied from just about any player utilizing a PipeWire backend.

Of course running your audio all the time through heavy filtering might not sound too good in the end, especially if your laptop fan starts to chime in. :D
