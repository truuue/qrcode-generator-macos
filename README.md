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
3. `qrencode` installed via Homebrew:
   ```sh
   brew install qrencode
   ```

## Installation

### 1. Use the installer script

The `qrcode-install.sh` installer installs Homebrew if needed, installs `qrencode`, copies the `qrcode` script into `~/bin`, and updates your `PATH` when necessary:

```sh
./qrcode-install.sh
```

After the script finishes, open a new terminal session or run `source ~/.zshrc` if the installer modified your shell configuration.

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

Not specified (free to use — customize as you like).
