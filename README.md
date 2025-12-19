# pipewire-spa-plugin-csound
This repository is the result of trying to run Csound as a PipeWire spa filter-graph plugin

First install Csound version 7 (currently in beta).
https://csound.com
https://github.com/csound/csound/blob/develop/BUILD.md

Then get PipeWire source code, for example from their GitLab:
https://gitlab.freedesktop.org/pipewire/pipewire

Apply the patch files found in this repository (in order) to add the Csound functionality.
Build the spa filter-graph csound plugin and copy it system (pipewire) accessible library path.

**Example steps**:

```sh
# Go to PipeWire source directory:
cd pipewire
# Apply patches:
git apply path/to/where/you/have/the/patch/file/0001-spa-filter-graph-csound-Csound-version-7-based-filte.patch
git apply path/to/where/you/have/the/patch/file/0002-spa-filter-graph-csound-Updated-csound_connect_port.patch
# Configure:
meson setup --prefix ~/.local build
# Build:
cd build
ninja spa/plugins/filter-graph/libspa-filter-graph-plugin-csound.so
# Install:
sudo cp spa/plugins/filter-graph/libspa-filter-graph-plugin-csound.so /usr/lib64/spa-0.2/filter-graph/libspa-filter-graph-plugin-csound.so

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
