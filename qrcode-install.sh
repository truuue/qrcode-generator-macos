#!/bin/zsh

echo "📦 Installing the 'qrcode' command..."

# ----------------------------------------------------------
# 1. Install Homebrew if it is missing
# ----------------------------------------------------------
if ! command -v brew >/dev/null 2>&1; then
  echo "🍺 Homebrew not detected. Installing..."

  # Official Homebrew installer
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Brew to PATH for Apple Silicon and Intel
  if [ -d "/opt/homebrew/bin" ]; then
    echo 'export PATH="/opt/homebrew/bin:$PATH"' >> "$HOME/.zshrc"
    export PATH="/opt/homebrew/bin:$PATH"
  elif [ -d "/usr/local/bin" ]; then
    echo 'export PATH="/usr/local/bin:$PATH"' >> "$HOME/.zshrc"
    export PATH="/usr/local/bin:$PATH"
  fi

  echo "🍺 Homebrew installed."
else
  echo "🍺 Homebrew already installed."
fi

# ----------------------------------------------------------
# 2. Install qrencode if it is missing
# ----------------------------------------------------------
if ! command -v qrencode >/dev/null 2>&1; then
  echo "🔧 Installing qrencode..."
  brew install qrencode
else
  echo "🔧 qrencode already installed."
fi

# ----------------------------------------------------------
# 3. Create ~/bin if needed
# ----------------------------------------------------------
mkdir -p "$HOME/bin"

# ----------------------------------------------------------
# 4. Download your qrcode script into ~/bin
# ----------------------------------------------------------
echo "⬇️ Downloading the qrcode script..."
curl -fsSL https://raw.githubusercontent.com/truuue/qrcode-generator-macos/refs/heads/main/qrcode -o "$HOME/bin/qrcode"

# ----------------------------------------------------------
# 5. Make the script executable
# ----------------------------------------------------------
chmod +x "$HOME/bin/qrcode"

# ----------------------------------------------------------
# 6. Add ~/bin to PATH if needed
# ----------------------------------------------------------
if ! echo "$PATH" | grep -q "$HOME/bin"; then
  echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.zshrc"
  echo "🔧 Adding ~/bin to PATH"
fi

# ----------------------------------------------------------
# 7. Reload the shell
# ----------------------------------------------------------
source "$HOME/.zshrc"

echo ""
echo "🎉 Installation complete!"
echo "➡️ Command available: qrcode <url>"
echo ""
