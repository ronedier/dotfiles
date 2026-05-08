function reboot_to_windows -d "Set Windows bootloader as a default for the next reboot"
    set windows_title (sudo grep -i windows /boot/grub2/grub.cfg | cut -d "'" -f 2)
    sudo grub2-reboot "$windows_title" && sudo reboot
end
