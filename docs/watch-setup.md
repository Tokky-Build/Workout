# คู่มือติดตั้ง `/watch` — ใช้ได้ทุกโปรเจกต์ ทุกเครื่อง

`/watch` ให้ Claude Code "ดู" คลิป (เห็นภาพ + ได้ยินเสียง) แล้วตอบคำถามเกี่ยวกับคลิปได้

> ⚠️ ใช้ได้เฉพาะ **Claude Code บนเครื่องคอมของคุณ** — บนเว็บ/มือถือ (คลาวด์) ใช้กับ YouTube ไม่ได้ เพราะ YouTube บล็อก IP ดาต้าเซ็นเตอร์

---

## ทางลัด: คำสั่งเดียวจบ (macOS / Linux)

ใน Terminal ที่โฟลเดอร์รีโปนี้:

```bash
bash scripts/install-watch.sh
```

สคริปต์จะ:
1. เช็คว่ามี `python3` และ `npx` (Node.js)
2. ติดตั้งสกิลแบบ global ไปที่ `~/.claude/skills/watch`
3. ถาม `GEMINI_API_KEY` (พิมพ์แล้วไม่โชว์บนจอ) แล้วเก็บไว้ที่ `~/.config/watch/.env` แบบสิทธิ์ 600
4. ตั้งค่าโหมด gemini และตรวจว่าพร้อมใช้

ไม่อยากใช้ key? ใช้โหมด local (โหลด yt-dlp + ffmpeg + WhisperX — นานกว่า):

```bash
bash scripts/install-watch.sh --local
```

รันซ้ำได้ ไม่พัง — ถ้ามี key แล้วจะข้ามให้

---

## ทำเองทีละขั้น (ทุกระบบ รวม Windows)

### 0. ของที่ต้องมี
| ของ | ใช้ทำอะไร | ลิงก์ |
|---|---|---|
| Node.js | ให้มีคำสั่ง `npx` | https://nodejs.org/ |
| Python 3 | รันสคริปต์ของสกิล | https://www.python.org/downloads/ |
| Claude Code | ตัวเรียก `/watch` | https://claude.com/claude-code |
| Gemini API key | โหมด gemini (ฟรี) | https://aistudio.google.com/apikey |
| yt-dlp + ffmpeg | เฉพาะโหมด local | `brew install yt-dlp ffmpeg` / `winget install yt-dlp.yt-dlp Gyan.FFmpeg` |

### 1. ติดตั้งสกิลแบบ global
รันจากโฟลเดอร์ไหนก็ได้:
```bash
npx -y skills add bradautomates/claude-video --skill watch --agent claude-code -g
```
(`-g` = ติดตั้งระดับผู้ใช้ → ใช้ได้ทุกโปรเจกต์)

### 2. ใส่ API key
สร้างไฟล์ config ก่อน:
```bash
python3 ~/.claude/skills/watch/scripts/setup.py --engine gemini
```
เปิดไฟล์ `~/.config/watch/.env` (Windows: `%USERPROFILE%\.config\watch\.env`) แล้วแก้บรรทัดนี้:
```
GEMINI_API_KEY=ใส่คีย์ของคุณ
```
> อย่าใส่ key ในไฟล์ที่อยู่ในรีโป และอย่าวาง key ในแชท

### 3. ยืนยันการตั้งค่า
```bash
python3 ~/.claude/skills/watch/scripts/setup.py --engine gemini
```
ต้องเห็น `[setup] Gemini engine is ready.`

ดูสถานะละเอียด:
```bash
python3 ~/.claude/skills/watch/scripts/setup.py --json
```

---

## วิธีใช้

เปิด `claude` ในโฟลเดอร์ไหนก็ได้ แล้วพิมพ์:

- `/watch https://youtu.be/xxxx คลิปนี้สอนท่าอะไรบ้าง`
- `ดูคลิปนี้แล้วบอกว่านาที 5-8 เกิดอะไรขึ้น https://youtu.be/xxxx`

ถ้าอยากได้แค่คำพูด (สรุป/แปล) ใช้ `youtube-transcript` ในรีโปนี้แทน เร็วกว่า

---

## ย้ายไปเครื่องใหม่

1. ลง Node.js + Python 3 + Claude Code
2. `git clone` รีโปนี้ แล้วรัน `bash scripts/install-watch.sh`
   (หรือทำ "ทีละขั้น" ข้อ 1–3 — ไม่ต้อง clone ก็ได้)
3. ใส่ key เดิม (เก็บไว้ในตัวจัดการรหัสผ่าน เช่น 1Password / Bitwarden)

สิ่งที่ **ไม่** ตามไปเอง: API key, yt-dlp/ffmpeg, โมเดล WhisperX — ต้องลงทุกเครื่อง

---

## แก้ปัญหา

| อาการ | วิธีแก้ |
|---|---|
| `/watch` ไม่ขึ้นใน Claude Code | เช็คว่ามี `~/.claude/skills/watch/SKILL.md` แล้วปิด-เปิด `claude` ใหม่ |
| `Add GEMINI_API_KEY privately to ...` | ยังไม่ได้ใส่ key — ทำขั้นที่ 2 |
| `Missing yt-dlp` | ลง yt-dlp หรือใช้โหมด gemini (ไม่ต้องใช้ yt-dlp กับลิงก์ YouTube) |
| YouTube ขึ้น bot-check / 403 | กำลังรันบนคลาวด์ — ต้องรันบนเครื่องตัวเอง |
| `npx: command not found` | ลง Node.js |
| อัปเดตสกิลเป็นเวอร์ชันใหม่ | `npx -y skills update -g` |
