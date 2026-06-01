### Instalando Mullvad VPN y Mullvad Browser

sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo

sudo dnf install mullvad-vpn mullvad-browser -y

### Instalando programas


sudo dnf install libreoffice-langpack-es vlc kleopatra keepassxc syncthing git -y


## Instalar VSCodium

wget https://github.com/VSCodium/vscodium/releases/download/1.121.03429/codium-1.121.03429-el8.x86_64.rpm
sudo dnf install -y ./codium-1.121.03429-el8.x86_64.rpm
rm -f codium-1.121.03429-el8.x86_64.rpm

### Ir a la pagina web , descargar el archivo rpm , e instalarlo con sudo rpm -i codium*

####FLatpak

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo


flatpak install flathub io.freetubeapp.FreeTube flathub org.localsend.localsend_app com.github.johnfactotum.Foliate -y

flatpak install com.github.tchx84.Flatseal io.gitlab.librewolf-community  org.cryptomator.Cryptomator org.mozilla.firefox -y

###Instaladno brave

sudo dnf install dnf-plugins-core

sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo dnf install brave-browser




#instalacion de qemu
sudo dnf install @virtualization

## para soporte EFI en Qemu
sudo dnf install edk2-ovmf


##regla de firewall-cmd para abrir puerto solamente en la sesion para localsend

#firewall-cmd --zone=public --add-port=53317/tcp

firewall-cmd --permanent --zone=home --add-port=53317/tcp

#### Instalacion de distrobox

sudo dnf install distrobox -y


#### Instalar paquete de colores en libreoffice (codehighlighter2)

wget https://extensions.libreoffice.org/assets/downloads/508/1735925190/codehighlighter2.oxt


### instalaacion de codecs faltantes rpm-fusion

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


sudo dnf5 swap ffmpeg-free ffmpeg --allowerasing


#### Instalcion de codecss

##Este controlador es necesario para habilitar la aceleración por hardware (decodificación y codificación) mediante VA-API
sudo dnf install intel-media-driver libva libva-utils

###Comprobacion qeu funione automaticamete

vainfo

sudo dnf autoremove -y


