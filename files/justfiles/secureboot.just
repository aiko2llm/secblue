# Enroll secblue's signing key for secure boot - Enter password "secureblue" if prompted
enroll-secblue-secure-boot-key:
    #! /bin/run0 /bin/bash
    mokutil --timeout -1
    echo 'The next line will prompt for a MOK password. Input "secureblue".'
    mokutil --import /etc/pki/akmods/certs/akmods-secblue.der
    echo 'At next reboot, the mokutil UEFI menu UI will be displayed (*QWERTY* keyboard input and navigation).'
    echo 'Then, select "Enroll MOK", and input "secureblue" as the password.'
