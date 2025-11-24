# Générateur QR pour macOS

Un outil très léger pour créer un QR code d'une URL directement depuis ton terminal macOS. Le script `qrcode` se charge de générer l'image, de l'ouvrir et de lui donner un nom lisible.

## Fonctionnalités

- Détection du nom de domaine pour nommer automatiquement le fichier (`qrcode-exemple.com.png`).
- Utilisation de `qrencode`, disponible via Homebrew.
- Génération et affichage du QR en une seule commande (`qrcode <url>`).
- Script d'installation `qrcode-install.sh` pour placer le binaire dans `~/bin` et le rendre immédiatement disponible.

## Prérequis

1. macOS avec un terminal zsh.
2. Homebrew installé (https://brew.sh/).
3. `qrencode` installé :
   ```sh
   brew install qrencode
   ```

## Installation

### 1. Via le script d'installation

Le script `qrcode-install.sh` installe automatiquement la commande `qrcode` dans `~/bin` et s'occupe d'ajouter ce répertoire au `PATH` si nécessaire :

```sh
./qrcode-install.sh
```

Tu peux relancer le terminal ou `source ~/.zshrc` après l'exécution si le script ne l'a pas déjà fait.

### 2. Installation manuelle

Si tu préfères installer le script toi-même :

```sh
mkdir -p "$HOME/bin"
cp qrcode "$HOME/bin/qrcode"
chmod +x "$HOME/bin/qrcode"
```

Ajoute `~/bin` au `PATH` dans `~/.zshrc` si ce n'est pas déjà fait :

```sh
export PATH="$HOME/bin:$PATH"
```

## Utilisation

```sh
qrcode https://example.com
```

- Le fichier `qrcode-example.com.png` est généré dans le dossier courant.
- L'image s'ouvre automatiquement dans l'application par défaut (aperçu, etc.).
- Tu peux utiliser n'importe quelle URL valide (http ou https).

Pour forcer un nom de fichier différent, modifie `qrcode.sh` ou copie-le dans un autre script en adaptant la variable `OUTPUT`.

## Débogage

- Vérifie que `qrencode` est installé et accessible (`which qrencode`).
- Assure-toi que `~/bin` est bien dans ton `PATH` en relançant ton shell ou `source ~/.zshrc`.
- Les erreurs sont affichées dans la console, le script quitte avec un code non nul si l'URL est absente.

## Structure

- `qrcode.sh` : script principal exécuté par la commande `qrcode`.
- `qrcode-install.sh` : script d'installation qui copie `qrcode` dans `~/bin`.

## Licence

Non définie (utilisation libre, adapte à ton usage).
