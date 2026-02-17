```markdown
# FLWM Nord Edition ❄️

Esta es una versión personalizada de **FLWM** (Fast Light Window Manager), un gestor de ventanas extremadamente ligero y rápido para X11. Esta edición ha sido modificada para ofrecer una estética moderna basada en la paleta de colores **Nord** y añadir funcionalidades de automatización.

## ✨ Características principales

- **Tema Nord Nativo:** Colores integrados directamente en el código fuente para eliminar el gris clásico de FLTK.
- **Soporte de Autostart:** Ejecuta automáticamente scripts al iniciar sesión desde `~/.flwm/autostart.sh`.
- **Menú Optimizado:** Configurado para lanzar `st` (simple terminal) y `rofi` por defecto.
- **Instalador Automático:** Script incluido para compilar e instalar con un solo comando.

## 📦 Dependencias

Antes de compilar, necesitas instalar las librerías de desarrollo de **FLTK** y **X11**.

| Distribución | Comando de Instalación |
| :--- | :--- |
| **Arch Linux** | `sudo pacman -S base-devel fltk xorg-server xorg-xinit` |
| **Debian / Ubuntu** | `sudo apt install build-essential libfltk1.3-dev libx11-dev libxext-dev` |
| **Fedora** | `sudo dnf groupinstall "Development Tools" && sudo dnf install fltk-devel libX11-devel` |
| **Alpine Linux** | `sudo apk add build-base fltk-dev libx11-dev libxext-dev` |
| **Void Linux** | `sudo xbps-install -S base-devel fltk-devel libX11-devel libXext-devel` |
| **openSUSE** | `sudo zypper install -t pattern devel_C_C++ && sudo zypper install fltk-devel libX11-devel` |

## 🚀 Instalación Rápida

1. Clona este repositorio:
   ```bash
   git clone [https://github.com/Elpepesaurio44/FLWM-autostert.git](https://github.com/Elpepesaurio44/FLWM-autostert.git)
   cd FLWM-autostert

```

2. Ejecuta el instalador (compila, instala el binario y configura la sesión):
```bash
chmod +x install.sh
./install.sh

```



## 🛠️ Instalación Manual

Si prefieres hacerlo paso a paso:

```bash
make clean
make
sudo make install
# Para que aparezca en el gestor de login (Ly, SDDM, etc.)
sudo cp flwm.desktop /usr/share/xsessions/

```

## 📂 Configuración del Autostart

Para ejecutar programas al inicio (como fondos de pantalla con `feh`, compositores como `picom`, etc.), edita tu archivo de inicio:

```bash
nano ~/.flwm/autostart.sh

```

Asegúrate de que cada comando termine con un `&`. Ejemplo:

```bash
#!/bin/bash
feh --bg-fill /ruta/a/tu/fondo_nord.jpg &
picom &

```

## ⌨️ Atajos de Teclado (Hotkeys)

* **Alt + Enter:** Iconizar ventana.
* **Alt + Tab:** Cambiar entre ventanas.
* **Alt + RePág/AvPág:** Subir o bajar ventanas en la pila.
* **Click derecho en el escritorio:** Menú de aplicaciones y ventanas.

---

Desarrollado por **Elpepesaurio44** basado en el código original de Bill Spitzak.

```
