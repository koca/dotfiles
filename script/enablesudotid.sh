#!/bin/bash

if ! grep 'pam_tid.so' /etc/pam.d/sudo --silent; then
	awk 'NR==2 {print "auth       sufficient     pam_tid.so"} 1' /etc/pam.d/sudo | sudo dd of=/etc/pam.d/sudo
fi
