# CLAUDE.md

คู่มือสั้น ๆ สำหรับ Claude Code ในรีโปนี้

## สกิล YouTube (อยู่ใน `.claude/skills/`)

มี 2 สกิลสำหรับดึงเนื้อหาจาก YouTube

### 1. `youtube-transcript` — ดึงคำบรรยาย (เบา เร็ว)
ได้เฉพาะ "คำพูด" เป็นข้อความ ไม่เห็นภาพบนจอ เหมาะกับสรุป / แปล / ทำโน้ต / หา quote

วิธีเรียก (พิมพ์ภาษาคน):
- "สรุปคลิปนี้ให้หน่อย <ลิงก์>"
- "ดึง transcript พร้อม timestamp จาก <ลิงก์>"

รันตรง:
```bash
uv run .claude/skills/youtube-transcript/scripts/get_transcript.py "<URL-หรือ-video-id>" --timestamps
```

### 2. `watch` (`/watch`) — "ดู" คลิปจริง (ภาพ + เสียง)
Claude เห็นภาพบนจอ + ฟังเสียง ตอบเรื่องที่ transcript อย่างเดียวตอบไม่ได้ เช่น tutorial / demo / UI

สองโหมด:
- **gemini** (แนะนำ) — ส่งลิงก์ให้ Gemini ดูทั้งคลิป ต้องมี `GEMINI_API_KEY` (ฟรีจาก https://aistudio.google.com/apikey)
- **local** — โหลดคลิปด้วย yt-dlp → ตัดเฟรมด้วย ffmpeg → ถอดเสียงด้วย WhisperX ในเครื่อง ไม่ต้องใช้ key

ครั้งแรกต้องตั้งค่าก่อน (รันครั้งเดียว มันจะถามโหมดแล้วลงของที่ขาดให้):
```bash
python3 .claude/skills/watch/scripts/setup.py --json
```

วิธีเรียก:
- "/watch <ลิงก์> <คำถาม>"
- "ดูคลิปนี้แล้วบอกว่าเกิดอะไรช่วงนาที 5-8 <ลิงก์>"

## ติดตั้ง `/watch` ให้ใช้ได้ทุกโปรเจกต์ / ทุกเครื่อง
ดูคู่มือเต็ม: [`docs/watch-setup.md`](docs/watch-setup.md) — ทางลัด (macOS/Linux):
```bash
bash scripts/install-watch.sh
```

## ข้อจำกัดสำคัญ

- สกิล YouTube ทั้งสองตัว **ใช้ได้เฉพาะ Claude Code บนเครื่องเดสก์ท็อป** (เน็ตบ้าน/ออฟฟิศ)
- **บนคลาวด์ (เว็บ/มือถือ) ใช้ไม่ได้** เพราะ YouTube บล็อก IP ดาต้าเซ็นเตอร์ (bot-check) และ CDN ของ YouTube ใช้ hostname สุ่มที่ allowlist ครอบคลุมไม่ได้
- สกิลเป็น "skill" ไม่ใช่ "slash command" ปกติ — เรียกด้วยการพิมพ์ภาษาคนได้เลย ไม่จำเป็นต้องพิมพ์ `/`

## เลือกตัวไหน
- อยากได้แค่เนื้อหาที่พูด (สรุป/แปล/โน้ต) → `youtube-transcript`
- ต้องเห็นภาพบนจอด้วย → `watch` โหมด gemini
