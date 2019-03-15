
## Table of Contents

<!-- vim-markdown-toc GFM -->

* [The problem](#the-problem)

<!-- vim-markdown-toc -->

## The problem

I hate how all of the major Linux distributions are the exact same now. A name, logo and a package manager. The rest of the system functions identically to the others.

If you would like to try something different your options are limited to the more niche Linux distributions; [Alpine Linux](https://alpinelinux.org/), [Void Linux](https://voidlinux.org/), [Gentoo](https://www.gentoo.org/) etc. However the downside is a lack of manpower and usually a lack of documentation.

Each major distribution is setup in the following way:

- `glibc`
- `gnu coreutils`
- `systemd`
- `dbus`
- `polkit`
- `pulseaudio`

As more distributions swap to this model and more software starts to only work on this model; it gets harder and harder for the distributions doing things differently.

Already we've seen Firefox drop `alsa` support and audio will outright not work without `pulseaudio` installed. There is a build flag to re-enable `alsa` support however this build flag is only temporary.

The `dbus` program also insists on creating the `/etc/machine-id` file. This file is a unique identifier for your system and it is read by running applications (*even those not using `dbus`*).

Firefox outright doesn't launch if it can't read the `/etc/machine-id` file. This is on a machine without `dbus` installed. Creating the file and zeroing the ID fixes the issue.

This file is a privacy concern to me. We have gone years without needing a system-wide `uuid` (*hostname or ipv4 address was used*)  and now all of a sudden applications will not launch without it.
