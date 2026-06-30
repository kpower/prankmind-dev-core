# PrankMindDevCore

Common scripting tools and utils. Crossplatform (with Linux support).

## Testing on Linux

Linux can't be compile-time checked right now. And sometimes you have problems running correct code there. For example,
Linux Foundation doesn't include networking part and additional FoundationNetworking doesn't fully support all methods.

So the easiest way to test - is to build container using docker and run tests there. Just call `test-on-linux.sh` to
make all the magic happen.

Script is made for `Apple Silicon` only and builds natively for `linux/arm64` (the same architecture as the colima VM),
so there is no CPU emulation. The goal is to catch Linux-only problems (e.g. `FoundationNetworking`), which are
architecture-independent. You can try using similar commands with `docker build` (not `buildx`) on `Intel` to achieve
similar effect. But some fine tuning may be necessary.  

### Prerequisites

1. Install `docker`
  - Recommended: `colima + docker`.
    ```bash
    brew install docker
    brew install colima
    brew services start colima
    ```

2. Install `buildx`
  - Installation:
    ```bash
    brew install docker-buildx
    ```
        
  - Don’t forget to add this to `~/.docker/config.json`:
    ```json
    "cliPluginsExtraDirs": [
      "/opt/homebrew/lib/docker/cli-plugins"
    ]
    ```

  - Create and select a custom builder with the `docker-container` driver (the default one cannot select architectures):
    ```bash
    docker buildx create --use
    ```

### Additional references:
  - [General instructions about Docker Distribution](https://wiki.yandex-team.ru/qloud/docker-registry/)
  - [colima + docker (inspired by Atuska)](https://yandex-team.ru/atushka/post/117417?user=maxlog)

