#!/usr/bin/env bash
# ติดตั้งสกิล /watch แบบ global (ใช้ได้ทุกโปรเจกต์บนเครื่องนี้) — macOS / Linux
# ใช้:  bash scripts/install-watch.sh            (โหมด gemini — แนะนำ)
#       bash scripts/install-watch.sh --local    (โหมด local — ไม่ต้องใช้ key)
set -euo pipefail

MODE="gemini"
[[ "${1:-}" == "--local" ]] && MODE="local"

SKILL_DIR="$HOME/.claude/skills/watch"
CONFIG_FILE="$HOME/.config/watch/.env"

say()  { printf '\n\033[1m==> %s\033[0m\n' "$*"; }
fail() { printf '\n\033[31m[x] %s\033[0m\n' "$*" >&2; exit 1; }
has()  { command -v "$1" >/dev/null 2>&1; }

say "1/4 เช็คของที่ต้องมี"
has python3 || fail "ไม่พบ python3 — ลงก่อน: https://www.python.org/downloads/"
has npx     || fail "ไม่พบ npx — ลง Node.js ก่อน: https://nodejs.org/"
echo "python3 ✓  npx ✓"

install_pkg() {  # ลง yt-dlp / ffmpeg ถ้ายังไม่มี
  local pkg="$1"
  has "$pkg" && { echo "$pkg ✓"; return; }
  if has brew; then brew install "$pkg"
  elif has apt-get; then sudo apt-get install -y "$pkg"
  elif [[ "$pkg" == "yt-dlp" ]] && has pipx; then pipx install yt-dlp
  else fail "ไม่พบ $pkg และหาตัวติดตั้งไม่เจอ — ลง $pkg เองแล้วรันสคริปต์นี้ใหม่"
  fi
}

if [[ "$MODE" == "local" ]]; then
  install_pkg ffmpeg
  install_pkg yt-dlp
else
  # โหมด gemini ส่งลิงก์ YouTube ให้ Gemini ตรง ๆ — yt-dlp/ffmpeg ไม่บังคับ
  for p in ffmpeg yt-dlp; do has "$p" && echo "$p ✓" || echo "$p — ไม่มี (ไม่บังคับในโหมด gemini)"; done
fi

say "2/4 ติดตั้งสกิล watch แบบ global → $SKILL_DIR"
npx -y skills add bradautomates/claude-video --skill watch --agent claude-code -g -y </dev/null
[[ -f "$SKILL_DIR/scripts/setup.py" ]] || fail "ติดตั้งไม่สำเร็จ: ไม่พบ $SKILL_DIR/scripts/setup.py"

SETUP="$SKILL_DIR/scripts/setup.py"

if [[ "$MODE" == "gemini" ]]; then
  say "3/4 ตั้งค่า GEMINI_API_KEY"
  python3 "$SETUP" --engine gemini </dev/null >/dev/null 2>&1 || true   # สร้างไฟล์ config ถ้ายังไม่มี
  mkdir -p "$(dirname "$CONFIG_FILE")"; touch "$CONFIG_FILE"; chmod 600 "$CONFIG_FILE"
  if grep -qE '^GEMINI_API_KEY=.+' "$CONFIG_FILE"; then
    echo "มี key อยู่แล้วใน $CONFIG_FILE — ข้าม"
  else
    echo "ขอ key ฟรีได้ที่ https://aistudio.google.com/apikey"
    read -r -s -p "วาง GEMINI_API_KEY (พิมพ์แล้วจะไม่แสดงบนจอ): " KEY; echo
    [[ -n "$KEY" ]] || fail "ไม่ได้ใส่ key"
    tmp="$(mktemp)"
    grep -vE '^GEMINI_API_KEY=' "$CONFIG_FILE" > "$tmp" || true
    printf 'GEMINI_API_KEY=%s\n' "$KEY" >> "$tmp"
    mv "$tmp" "$CONFIG_FILE"; chmod 600 "$CONFIG_FILE"
    echo "บันทึก key ไว้ที่ $CONFIG_FILE (สิทธิ์ 600)"
  fi
  say "4/4 ตั้งค่าโหมด gemini"
  python3 "$SETUP" --engine gemini
else
  say "3/4 ตั้งค่าโหมด local (WhisperX — โหลดนานหน่อย)"
  python3 "$SETUP" --engine local --install-whisperx
  say "4/4 ตรวจสถานะ"
fi

python3 "$SETUP" --check && say "เสร็จ! เปิด 'claude' ที่โฟลเดอร์ไหนก็ได้ แล้วพิมพ์: /watch <ลิงก์> <คำถาม>"
