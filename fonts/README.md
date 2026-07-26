# Fonts

This directory contains scripts and documentation for installing fonts used by the workstation.

## Current Font

The workstation uses:

- **JetBrainsMono Nerd Font**

This font provides:

- Powerline glyphs
- Nerd Font icons
- Excellent readability
- Support for Starship prompt
- Support for terminal applications such as Git, Docker, Kubernetes and Neovim

---

## Installation

Run:

```bash
./fonts/install.sh
```

The installer will:

1. Download the latest supported JetBrainsMono Nerd Font.
2. Install it under:

```text
~/.local/share/fonts/JetBrainsMono
```

3. Refresh the font cache.

---

## Configure the terminal

After installation, configure your terminal to use:

```
JetBrainsMono Nerd Font
```

Example (GNOME Terminal):

```
Preferences
→ Profile
→ Text
→ Custom Font
→ JetBrainsMono Nerd Font
```

---

## Verification

Check whether the font was installed:

```bash
fc-list | grep -i "JetBrains"
```

You can also verify that Powerline glyphs are available:

```bash
echo "        ☸ "
```

All symbols should render correctly.

---

## Why JetBrainsMono?

The workstation standardizes on JetBrainsMono Nerd Font because it offers:

- Great readability
- Wide icon support
- Excellent compatibility with Starship
- Consistent rendering across Linux terminals