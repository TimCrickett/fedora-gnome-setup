#!/bin/bash

# Fedora Setup Script For Daily Use

# Change DNF Parameters

        sudo cp /etc/dnf/dnf.conf /etc/dnf/dnf.conf.bak &&
        echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf &&
        echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf &&

# Setup Flathub Repo

        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&
        flatpak update -y &&

# Setup RPM Fusion Repo

        sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarc &&
        sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora) &&
        sudo dnf update -y &&

# Remove Apps

	sudo dnf autoremove -y gnome-software gnome-clocks gnome-weather gnome-calendar cheese libreoffice* rhythmbox gnome-maps gnome-tour gnome-photos gnome-contacts firefox &&

# Install Apps

	sudo dnf install -y gtk-murrine-engine gnome-shell-extension-user-theme gnome-shell-extension-appindicator chromium-freeworld gnome-tweaks gnome-extensions-app &&

# Setup Wallpapers

        wget https://github.com/TimCrickett/wallpapers/archive/refs/heads/main.zip -P $HOME/Pictures &&
        unzip $HOME/Pictures/main.zip &&
        mv $HOME/Pictures/wallpapers-main $HOME/Pictures/wallpapers &&
        rm $HOME/Pictures/main.zip &&

# EOF

        echo "Script Has Finished Running"
