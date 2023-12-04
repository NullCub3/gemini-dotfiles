# fbterm setup and config hacks

## Installation and setup

Install `fbterm` via your favorite package manager

```sh
pacman -S fbterm
```

Next you will need to grant a little bit of root to the fbterm executable so
that it can do some magic with keyboards.

```sh
setcap 'cap_sys_tty_config+ep' $(command -v fbterm)
```

Finally you will need to add your user to the `video` group so you can access
the device frame buffer `/dev/fb0`

```sh
usermod -aG video USERNAME
```

## Run at login hacks

Running fbterm at login is easy, setting your shell variables is surprisingly
not. I find that it works best just appending values to your `/etc/profile`
rather than a new script in `/etc/profile.d/` but I will probably revisit this
at a later date.

Add the code in [profile](#file-profile) to the end of `/etc/profile` it sets a
flag so you can wrangle your `$TERM` variable later, executes `fbterm` for you
and injects a few color codes so that everything will render properly.

Next add the code in [shellrc](#file-shellrc) to your shell configurations
somewhere. It will help to auto-dectect and set your `$TERM` variable
properly. If `$TERM` is wrong, your colors won't work.

## &c.

After installing fbterm and changing those config files you can just use normal
color escapes in your display variables.

Configuration of `fbterm` is handled by `$HOME/.fbtermrc` which you should get a
default copy of.
