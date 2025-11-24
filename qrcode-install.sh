#!/bin/zsh

echo "📦 Installation de la commande 'qrcode'..."

# 1. Créer ~/bin si nécessaire
mkdir -p "$HOME/bin"

# 2. Télécharger le script qrcode dans ~/bin
curl -fsSL https://raw.githubusercontent.com/truuue/qrcode-generator-macos/refs/heads/main/qrcode -o "$HOME/bin/qrcode"

# 3. Rendre le script exécutable
chmod +x "$HOME/bin/qrcode"

# 4. Ajouter ~/bin au PATH si pas encore présent
if ! echo "$PATH" | grep -q "$HOME/bin"; then
  echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.zshrc"
  echo "🔧 Ajout de ~/bin dans ton PATH"
fi

# 5. Recharger le shell
source "$HOME/.zshrc"

echo "✅ Installation terminée !"
echo "Tu peux maintenant utiliser : qrcode <url>"

