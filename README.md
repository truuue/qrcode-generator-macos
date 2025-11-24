# macOS QR code generator

A tiny command-line utility that turns any URL into a QR code image and opens it automatically. The `qrcode` script names the file after the domain, runs `qrencode`, and saves the PNG beside your terminal session.

## Features

- Automatically extracts the domain from the URL to generate filenames like `qrcode-example.com.png`.
- Delegates QR generation to `qrencode`, which is readily available through Homebrew.
- Opens the generated image with the macOS preview app immediately after creation.
- Provides an installer script (`qrcode-install.sh`) that copies the command into `~/bin` and ensures the directory is on your `PATH`.

## Prerequisites

1. macOS with the default `zsh` shell (Big Sur or later is preferred).
2. Homebrew available at [https://brew.sh](https://brew.sh).
3. `curl` installed via Homebrew:
   ```sh
   brew install curl
   ```

## Installation

### 1. Installer via shell download

Download and run the installer from the repository in one command:

```sh
curl -fsSL https://raw.githubusercontent.com/truuue/qrcode-generator-macos/refs/heads/main/qrcode-install.sh | zsh
```

This single step installs Homebrew (if needed), installs `qrencode`, copies `qrcode` into `~/bin`, and ensures the directory is on your `PATH`. Open a new terminal session or run `source ~/.zshrc` if the installer updated your shell configuration.

### 2. Manual installation

If you'd rather install everything yourself:

```sh
mkdir -p "$HOME/bin"
cp qrcode "$HOME/bin/qrcode"
chmod +x "$HOME/bin/qrcode"
```

Ensure `~/bin` is exported in your `~/.zshrc` if it isn't already:

```sh
export PATH="$HOME/bin:$PATH"
```

## Usage

```sh
qrcode https://example.com
```

- Creates `qrcode-example.com.png` in the current directory.
- Automatically opens the image with the default macOS viewer.
- Accepts any valid `http` or `https` URL.

To override the output filename, edit the `OUTPUT` variable inside `qrcode.sh` or wrap the script in another helper.

## Troubleshooting

- Run `which qrencode` to confirm the dependency is installed and reachable.
- Verify `~/bin` appears in your `PATH` by running `echo $PATH` after sourcing `~/.zshrc`.
- The script exits with code 1 if no URL is provided, and shell errors are printed directly to the terminal.

## Project structure

- `qrcode.sh`: the main script executed by the `qrcode` command.
- `qrcode-install.sh`: installer that sets up dependencies, copies the script to `~/bin`, and updates your `PATH`.
- `README.md`: this documentation.

## License

Apache 2.0
