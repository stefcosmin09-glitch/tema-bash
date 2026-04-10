#!/bin/bash

if ! systemctl is-active --quiet sshd; then
    echo "SSHD ESTE OPRIT. RESTART..."
    systemctl restart sshd
fi
