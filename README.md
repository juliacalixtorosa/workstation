# 💻 Workstation

> Personal Linux workstation configuration focused on Software Engineering, Cloud and DevOps.

This repository contains all configuration files and bootstrap scripts required to reproduce my development environment on a new machine.

The project follows the **dotfiles + bootstrap** philosophy:

- Configuration files are versioned.
- Existing files are automatically backed up.
- Symbolic links are created safely.
- Installation is idempotent.

---

# Features

- ✅ Automatic backup of existing configuration files
- ✅ Symbolic link management
- ✅ Installation script
- ✅ Status verification
- ✅ Starship prompt
- ✅ Kitty terminal
- ✅ Git configuration
- ✅ Bash configuration
- ✅ Nerd Fonts support

---

# Repository Structure

```text
.
├── assets/
│   └── wallpapers/
│
├── bootstrap/
│   ├── backup.sh
│   ├── common.sh
│   ├── install.sh
│   ├── status.sh
│   └── symlinks.sh
│
├── config/
│   ├── bash/
│   ├── git/
│   ├── kitty/
│   └── starship/
│
├── docs/
│
├── Makefile
└── README.md
```

---

# Installation

Clone the repository.

```bash
git clone https://github.com/<username>/workstation.git
cd workstation
```

Run the installation.

```bash
make install
```

---

# Available Commands

| Command | Description |
|----------|-------------|
| `make install` | Install all symbolic links |
| `make status` | Verify symbolic links |
| `make backup FILE=...` | Backup a file |
| `make check` | Validate shell scripts |
| `make help` | Show available commands |

---

# Technologies

- Bash
- Git
- Starship
- Kitty
- Nerd Fonts

---

# Roadmap

- [x] Bootstrap
- [x] Symbolic links
- [x] Backup system
- [x] Starship
- [x] Kitty
- [ ] ShellCheck
- [ ] GNOME automation
- [ ] Dev tools installation
- [ ] CI pipeline