#!/bin/bash

PATHS=(
    "/org/gnome/desktop/interface/"
    "/org/gnome/desktop/wm/preferences/"
    "/org/gnome/shell/"
    "/org/gnome/settings-daemon/plugins/media-keys/"
)


# BACKUP_DIR=~/Downloads/"satori_backup_$(date +26%m%d%H%M%S)"
BACKUP_DIR="$HOME/Downloads/satori_backup_$(date +26%m%d%H%M%S)"
mkdir -p $BACKUP_DIR
BACKUP_FILE="$BACKUP_DIR/interface.ini"
echo "🚀 備份開始..."

> "$BACKUP_FILE"

for p in "${PATHS[@]}"; do
    dconf dump "$p" >> "$BACKUP_FILE"
done

echo "✨ 備份成功！你的設定已安全存放在：$BACKUP_FILE"