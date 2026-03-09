#!/bin/bash

PATHS=(
    "/org/gnome/desktop/interface/"
    "/org/gnome/desktop/wm/preferences/"
    "/org/gnome/shell/"
    "/org/gnome/settings-daemon/plugins/media-keys/"
)

BACKUP_DIR="$HOME/Downloads/satori_backup_$(date +%Y%m%d%H%M%S)"
# BACKUP_DIR=~/Downloads/"satori_backup_$(date +%Y%m%d%H%M%S)"
mkdir -p "$BACKUP_DIR"
BACKUP_FILE="$BACKUP_DIR/interface_settings.ini"
echo "🚀 備份開始..."

> "$BACKUP_FILE"

for p in "${PATHS[@]}"; do
    dconf dump "$p" >> "$BACKUP_FILE"
done

echo "✅ 備份完成：$BACKUP_FILE"

echo "🦊 正在拷貝Firefox設定..."
rsync -ah --info=progress2 \
    --exclude='Crash Reports' \
    --exclude='Pending Pings' \
    --exclude='firefox-mpris' \
    ~/.config/mozilla/firefox \
    "$BACKUP_DIR/"
echo "✅ .config備份完成。"



cp -r ~/.ssh "$BACKUP_DIR"
echo "✅ SSH金鑰備份完成。"

echo "✨ 備份成功！你的設定已安全存放在：$BACKUP_DIR"
echo "Namaste. 守護智慧邊界，從備份開始。"