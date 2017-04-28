# Ubuntu XServer + LXCDE

Should be useful to get clean UI-based Ubuntu environment to install firefox or
any other software

Inspired by: https://github.com/Kaixhin/dockerfiles/tree/master/vnc

# Usage

```
docker run -it -p 5901:5901 teran/ubuntu-xserver:latest
```

```
open vnc://127.0.0.1:5901
```

Default password to VNC server is: `password`

Or

It could present right in `.bashrc`:

```
function xserver() {
    docker run -d -p 5901:5901 --name ubuntu-xserver teran/ubuntu-xserver
    open vnc://127.0.0.1:5901
}
```
