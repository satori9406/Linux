#!/bin/bash
BACKUP_FILE="all_settings.ini"

dconf load / < "$BACKUP_FILE"

echo "✅ 界面設定還原成功！"