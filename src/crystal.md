# Upcoming Linux Distribution

I will start work on a new Linux distribution the name of which is presently unknown. The distribution will not provide binary packages and users will need to compile the software through the provided package manager.

The system will run `busybox`. Using its `coreutils`, `init` and `shell`. The package manager will be written in POSIX `sh` and linted accordingly with `shellcheck`.

`musl` will be used as the system's `libc` and packages which cannot be built without `glibc` will outright not be provided. Software which can be built with `musl` using minor patches will be packaged.

Proprietary software will not be packaged either and binary blobs will be removed from the provided kernel. You can make packages for these yourself if needed.

Web browsers will by default build with all telemetry disabled. As an alternative to Firefox/Chromium; Smaller browsers like Otter Browser and Falkon will also be packaged.


## FAQ

<!-- vim-markdown-toc GFM -->

* [What kind of release schedule is expected?](#what-kind-of-release-schedule-is-expected)
* [Why shell scripts?](#why-shell-scripts)
* [Where will package build scripts be stored?](#where-will-package-build-scripts-be-stored)
* [Will binaries be offered for Firefox/Chromium?](#will-binaries-be-offered-for-firefoxchromium)
* [What about `/etc/machine-id`?](#what-about-etcmachine-id)

<!-- vim-markdown-toc -->


### What kind of release schedule is expected?

The distribution will be of the rolling release kind. Packages will be updated as soon as they are available (*keeping in mind minor testing in case things go awry*). That being said, this is a compile-your-own-packages type of distribution so the choice is ultimately up to you.


### Why shell scripts?

Writing the package manager (*and some miscellaneous programs*) as shell scripts will increase development time while also providing first class support for a `PKGBUILD`/`APKBUILD` alternative.

The shell scripts will all be linted with `shellcheck` and have to pass through me before they hit the distribution. Shell scripts are my forte and the majority of my projects are written in `bash` or `sh`.

See: [neofetch](https://github.com/dylanaraps/neofetch), [fff](https://github.com/dylanaraps/fff), [pure bash bible](https://github.com/dylanaraps/pure-bash-bible)


### Where will package build scripts be stored?

The package build scripts will be stored in a `git` repository on GitHub and the issue tracker will be used for issues and pull requests.


### Will binaries be offered for Firefox/Chromium?

This is on my radar. Nobody is currently offering pre-built `musl` binaries for any of the major web browsers. If we go this route, I will ensure the binaries also run correctly on Alpine Linux and other `musl` distributions.

The browsers will be built with all telemetry disabled as both Firefox and Chromium disrespect the user's privacy by default. For Chromium this will most likely entail the usage of `ungoogled-chromium` in Chromium's place.


### What about `/etc/machine-id`?

The `/etc/machine-id` file is a new FreeDesktop standard to provide a unique identifier for every Linux system. The idea originally started in `dbus` but has now become a generic `uuid`.

Firefox outright refuses to launch if this file is not present or it does not contain a valid `uuid`. The same is happening with more and more software.

This is a privacy concern to me and this file will not be used in the traditional sense. The solution will be to create this file at boot with a zeroed `uuid`. This goes against the standard and also prevents the file from being used to identify you.

Example zeroed `/etc/machine-id` file:

```
00000000000000000000000000000000
```

The distro, [Devuan](https://devuan.org/) will use a similar solution and there has been talk in the [Gentoo](https://www.gentoo.org/) forums about possible alternative solutions. You can follow the discussion of the former [here](https://lists.dyne.org/lurker/message/20190308.124740.2b7329de.en.html).
