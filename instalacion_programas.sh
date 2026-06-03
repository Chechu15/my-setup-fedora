#!/bin/bash

### Instalando Mullvad VPN y Mullvad Browser

echo "Paso 1: Instalando Mullvad VPN y Mullvad Browser"

sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo

sudo dnf install mullvad-vpn mullvad-browser -y

### Instalando programas
echo "Paso 2: Instalando Programas varios"

sudo dnf install libreoffice-langpack-es vlc kleopatra keepassxc syncthing distrobox -y


## Instalar VSCodium

##wget https://github.com/VSCodium/vscodium/releases/download/1.121.03429/codium-1.121.03429-el8.x86_64.rpm
##sudo dnf install -y ./codium-1.121.03429-el8.x86_64.rpm
##rm -f codium-1.121.03429-el8.x86_64.rpm

## Instalación de VSCodium de manera más eficiente
echo "Paso 3: Instalando VSCoidum"

sudo tee -a /etc/yum.repos.d/vscodium.repo << 'EOF'
[gitlab.com_paulcarroty_vscodium_repo]
name=gitlab.com_paulcarroty_vscodium_repo
baseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
metadata_expire=1h
EOF

sudo dnf install codium -y


### Ir a la pagina web , descargar el archivo rpm , e instalarlo con sudo rpm -i codium*

####FLatpak
echo "Paso 4: Añadiendo repositorio de flathub y descargando programas de flathub"

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo


flatpak install flathub io.freetubeapp.FreeTube \
  org.localsend.localsend_app \
  com.github.johnfactotum.Foliate \
  com.github.tchx84.Flatseal \
  io.gitlab.librewolf-community \
  org.cryptomator.Cryptomator \
  org.mozilla.firefox -y

###Instaladno brave

echo "Paso 5: Descargando Brave"

sudo dnf install dnf-plugins-core -y

sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo dnf install brave-browser -y

echo "Paso 6: Descargando Qemu para virtualización"

#instalacion de qemu
sudo dnf install @virtualization -y

## para soporte EFI en Qemu
sudo dnf install edk2-ovmf -y

echo "Paso 7: Creación de reglas para el cortafuegos"

##regla de firewall-cmd para abrir puerto solamente en la sesion para localsend

#firewall-cmd --zone=public --add-port=53317/tcp

sudo firewall-cmd --permanent --zone=home --add-port=53317/tcp

#### Instalar paquete de colores en libreoffice (codehighlighter2)

echo "Paso 8: Descarga de paquete de libreoffice"

wget https://extensions.libreoffice.org/assets/downloads/508/1735925190/codehighlighter2.oxt && mv codehighlighter2.oxt /home/$USER/

echo "Paso 9: Descarga de codecs propietarios en rpm-fusion"

### instalaacion de codecs faltantes rpm-fusion

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y


sudo dnf5 swap ffmpeg-free ffmpeg --allowerasing  -y || true


#### Instalcion de codecss

echo "Paso 10: Descarga de codescs para habilitar la aceleración por hardware"

##Este controlador es necesario para habilitar la aceleración por hardware (decodificación y codificación) mediante VA-API
sudo dnf install intel-media-driver libva libva-utils -y

###Comprobacion qeu funione automaticamete

vainfo

echo "Paso 11: Limpieza de paquetes"

sudo dnf autoremove -y


