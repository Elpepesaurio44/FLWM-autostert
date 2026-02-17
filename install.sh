#!/bin/bash

# --- COLORES PARA LA TERMINAL ---
AZUL='\033[0;34m'
VERDE='\033[0;32m'
ROJO='\033[0;31m'
NC='\033[0m' # Sin color

echo -e "${AZUL}===========================================${NC}"
echo -e "${AZUL}   INSTALADOR DE FLWM NORD EDITION         ${NC}"
echo -e "${AZUL}===========================================${NC}"

# 1. COMPILACIÓN
echo -e "\n${AZUL}[1/4] Compilando el código fuente...${NC}"
make clean
if make; then
    echo -e "${VERDE}✔ Compilación completada con éxito.${NC}"
else
    echo -e "${ROJO}✘ Error en la compilación. Revisa las dependencias (FLTK/X11).${NC}"
    exit 1
fi

# 2. INSTALACIÓN DEL BINARIO
echo -e "\n${AZUL}[2/4] Instalando binario en /usr/local/bin...${NC}"
sudo make install
if [ $? -eq 0 ]; then
    echo -e "${VERDE}✔ Binario instalado correctamente.${NC}"
else
    echo -e "${ROJO}✘ Error al instalar el binario.${NC}"
    exit 1
fi

# 3. INSTALACIÓN DEL ARCHIVO .DESKTOP (SESSIONS)
echo -e "\n${AZUL}[3/4] Configurando sesión de escritorio...${NC}"
if [ -f flwm.desktop ]; then
    # Creamos el directorio de sesiones si no existe
    sudo mkdir -p /usr/share/xsessions
    sudo cp flwm.desktop /usr/share/xsessions/
    echo -e "${VERDE}✔ Archivo flwm.desktop copiado a /usr/share/xsessions/.${NC}"
else
    echo -e "${ROJO}⚠ Advertencia: No se encontró flwm.desktop en esta carpeta.${NC}"
fi

# 4. CONFIGURACIÓN DEL AUTOSTART
echo -e "\n${AZUL}[4/4] Configurando entorno de usuario (~/.flwm)...${NC}"
mkdir -p ~/.flwm

if [ ! -f ~/.flwm/autostart.sh ]; then
    echo -e "${AZUL}Creando script autostart.sh por defecto...${NC}"
    cat <<EOF > ~/.flwm/autostart.sh
#!/bin/bash
# --- CONFIGURACIÓN DE INICIO FLWM ---
# Los programas que pongas aquí se ejecutarán al iniciar sesión.
# ¡No olvides el '&' al final de cada comando!

# Ejemplo: Fondo de pantalla (requiere feh)
# feh --bg-fill /ruta/a/tu/imagen.jpg &

# Ejemplo: Compositor para transparencias
# picom &

# Ejemplo: Barra de estado
# polybar &
EOF
    chmod +x ~/.flwm/autostart.sh
    echo -e "${VERDE}✔ Archivo ~/.flwm/autostart.sh creado.${NC}"
else
    echo -e "${VERDE}✔ El archivo autostart.sh ya existía, no se ha modificado.${NC}"
fi

echo -e "\n${VERDE}===========================================${NC}"
echo -e "${VERDE}   ¡INSTALACIÓN FINALIZADA CON ÉXITO!      ${NC}"
echo -e "${VERDE}   Reinicia tu sesión para ver los cambios.${NC}"
echo -e "${VERDE}===========================================${NC}"
