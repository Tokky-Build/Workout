# CLAUDE.md — ความรู้ประจำตัว Tokky (อ่านไฟล์นี้ทุกครั้งที่เปิดเซสชันใหม่)

> ไฟล์นี้คือ "ความจำถาวร" ที่ Tokky สั่งให้บันทึกไว้ (15 พ.ย. 2026)
> Claude Code จะโหลด CLAUDE.md อัตโนมัติทุกครั้งที่เริ่มงานในโฟลเดอร์นี้
> อัปเดตได้เรื่อย ๆ เมื่อรู้จัก Tokky มากขึ้น

---

## 1) โปรไฟล์เจ้าของ (Tokky)

- ชื่อ/แฮนเดิล: **Tokky** (repo = `tokky-build/workout`, สกิล thai-humanizer ปรับตามรสนิยม Tokky แล้ว)
- อายุ 43 · เข้ายิม 2 ที่ 2 โปรแกรม · ทำงานกะสลับ · เป้าหมายฟิตเนส: ลีน เฟิร์ม กล้าม
- อีเมล (ใช้ระบุตัวตนเท่านั้น ห้ามส่งออกนอก): เก็บไว้ในระบบ

### งาน 3 สาย
1. **งานหลัก — การตลาด iGaming / คาสิโนออนไลน์**
   - โปรโมชัน + วิเคราะห์ดาต้า (extract fact → bullet ชัด ๆ)
   - คอนเทนต์ SMS: ขอ 3 ออปชันที่ "ปัง" ภายในลิมิตตัวอักษร + เหตุผลเชิงจิตวิทยาว่าทำไมแปลงยอดได้
   - ข้อสอบ/quiz: ตอบตรง คำถาม/เฉลย/เหตุผล
2. **งานเสริม 1 — Affiliate ปักตะกร้า Shopee / TikTok** (รีวิวสินค้า, ลิงก์ตะกร้า)
3. **งานเสริม 2 — YouTube หนังสั้น / คลิปสั้น**

### สไตล์การตอบที่ Tokky ชอบ
- ตรงประเด็น มีโครงสร้าง เป็น bullet ไม่ต้องทักทาย/ขอโทษฟุ่มเฟือย (ประหยัด token)
- ภาษาไทยเป็นคน ไม่กลิ่น AI (ใช้สกิล thai-humanizer) — เลี่ยงแพตเทิร์น "ไม่ใช่แค่ X แต่เป็น Y", คำอลังการ, อารัมภบท, บูลเล็ตเกินจำเป็น

---

## 2) สรุป "บทความ/โพสต์ AI" ที่ Tokky ส่งมาวิเคราะห์ (15 รูป)

Tokky เสพคอนเทนต์สาย AI-influencer ไทยเยอะ โพสต์พวกนี้พูดถึง "สกิล/เครื่องมือ" หลายตัว
แยกเป็น 3 กลุ่มตามความจริง:

### กลุ่ม A — Claude Skills "10 ตัวลับ" (จากโพสต์ Dotpan/panXboxy)
ข่าวดี: **8 ใน 10 มีอยู่แล้วในเครื่องมือของ Claude ตัวนี้ ไม่ต้องติดตั้ง/ไม่ต้องคอมเมนต์ขอ/ไม่ต้องจ่าย**

| ชื่อในโพสต์ | ของจริงที่มีอยู่แล้ว | สถานะ |
|---|---|---|
| Humanizer | `thai-humanizer` (ปรับตาม Tokky แล้ว) + `humanize-kit` | ✅ พร้อมใช้ |
| Marketing Skills | ชุด `marketing:*` (campaign-plan, content-creation, email-sequence, seo-audit, performance-report ฯลฯ) | ✅ พร้อมใช้ |
| Taste / design-taste-frontend | `frontend-design` | ✅ พร้อมใช้ |
| Impeccable (ตรวจดีไซน์) | `design:design-critique`, `design:accessibility-review`, `hallmark` (audit) | ✅ พร้อมใช้ |
| UI UX Pro Max (ชุดสี/ฟอนต์) | `hallmark` + `artifact-design` + `frontend-design` | ✅ พร้อมใช้ |
| Archify (ไดอะแกรมกดเล่นได้) | `artifact-diagramming` | ✅ พร้อมใช้ |
| Diagram Design | `artifact-diagramming` + `dataviz` | ✅ พร้อมใช้ |
| PPT Master | `pptx` (Anthropic) | ✅ พร้อมใช้ |
| Skills by Anthropic (Word/PDF/PPT/Excel) | `docx` `pdf` `pptx` `xlsx` | ✅ พร้อมใช้ |
| HyperFrames (ข้อความ→วิดีโอ) | Higgsfield MCP (`generate_video/image/audio/voice/dubbing`) | ⚠️ มีทางเลือกในเครื่อง / ตัว HyperFrames เองเป็นของนอก |

> ⚠️ โพสต์ Dotpan เตือนเอง: บางสกิลส่งข้อมูลการใช้งานออกนอก / PPT Master ต้อง pip install / README ของบางตัวบอก "เพื่อการศึกษา" → **ไม่ควรลงสกิลมั่วจากลิงก์ FB** เพราะเสี่ยงข้อมูลรั่ว ในเมื่อของเทียบเท่ามีในตัวอยู่แล้ว

### กลุ่ม B — เครื่องมือ "ตัวรันเอเจนต์" ของเจ้าอื่น (ไม่ใช่ Claude skill ลงในเซสชันนี้ไม่ได้)
- **OpenBot** (openbot.run) — ตัวรันเอเจนต์ฟรี เสียบ Claude/Gemini ที่จ่ายอยู่, สลับโมเดลเมื่อชนลิมิต, ตั้งทีมหลายเอเจนต์, สั่งรีโมตจากมือถือ
- **Grok Bot (xAI)** — $30–200/เดือน ผ่าน X Subscription (จ่ายเพิ่ม)
- **Freebuff** — coding agent ฟรี หาเงินจากโฆษณา (route ผ่าน DeepSeek ฯลฯ) — ระวังเรื่อง privacy/คุณภาพ
- **Recordly** — โปรแกรมอัดจอ แนะนำจุดซูม (หาใน GitHub) — ใช้กับคลิปสอน
- **AI Executive OS / AI Manager**, **AI Video Mastery (Kem Life)** — เป็น "คอร์สขาย" ไม่ใช่สกิล

> คำแนะนำ: Tokky มี Claude อยู่แล้ว ไม่จำเป็นต้องจ่าย Grok Bot เพิ่ม และระวังของฟรี/คอร์สที่ขายความหวัง — ลองของที่มีในตัวก่อน

### กลุ่ม C — "แพตเทิร์นทีม AI 5 ตัว" (SynapTech/Grok Bot) — เป็นวิธีคิด ใช้ได้กับทุกเครื่องมือ
1. Content Machine (ผลิตคอนเทนต์หลายรูปแบบจากไอเดียเดียว)
2. Lead Hunter (หากลุ่มเป้าหมาย/วิเคราะห์เว็บ)
3. Store Captain (เช็กสต็อก/สินค้าขายดี/ร่างอีเมลตอบลูกค้า)
4. Website Builder (ทำ Landing Page)
5. Client Report Bot (รวมดาต้า→รายงาน 1 หน้า ส่งทุกจันทร์)
- หัวใจ: **Routine (ตั้งเวลาอัตโนมัติ)** + **Draft เท่านั้น** (ให้คนอนุมัติก่อนส่งจริง)
- ทำได้ในระบบนี้ด้วย scheduled tasks / cron ของ Claude Code เอง (ไม่ต้องใช้ Grok Bot)

---

## 3) แมปสกิล → งานของ Tokky (ใช้อันไหน เมื่อไหร่)

### งานหลัก iGaming (โปรโม / ดาต้า / SMS)
- `marketing:*` — วางแคมเปญ, ร่างคอนเทนต์โปรโม
- `thai-humanizer` — เกลา SMS/แคปชันให้เป็นคน (สำคัญสุดสำหรับ SMS 3 ออปชัน)
- `xlsx` + `dataviz` — วิเคราะห์ยอด/คอฮอร์ตผู้เล่น, แดชบอร์ดผลโปรโม
- `pptx` / `docx` / `pdf` — รายงานส่งหัวหน้า/ลูกค้า
- `artifact-diagramming` — ผังกลไกโปรโม/ฟันเนล
- แพตเทิร์น "Client Report Bot" + Routine → ตั้ง cron สรุปผลโปรโมอัตโนมัติรายสัปดาห์

### Affiliate Shopee/TikTok (ปักตะกร้า)
- `marketing:content-creation` — 1 สินค้า → หลายโพสต์/หลายแพลตฟอร์ม
- `humanize-kit:humanize-ig` — แคปชันสไตล์มือถือจริง ไม่กลิ่น AI
- `frontend-design` / `hallmark` — หน้า bio-link / mini landing รวมตะกร้า
- Higgsfield (`generate_video/image`) — คลิปรีวิวสินค้าสั้น ๆ
- `canvas-design` — ภาพปก/การ์ดสินค้า

### YouTube หนังสั้น / คลิปสั้น
- Higgsfield MCP — สร้างวิดีโอ/ภาพ/เสียง/พากย์/ดูบบิ้ง (แทน HyperFrames)
- `thai-humanizer` — สคริปต์/คำบรรยาย/คอมเมนต์พินให้เป็นธรรมชาติ
- `canvas-design` / `algorithmic-art` — thumbnail, ไตเติล
- Recordly (ของนอก) — ถ้าทำคลิปสอนแบบอัดจอ

---

## 4) โปรเจกต์ในโฟลเดอร์นี้
- `index.html` = เว็บแอปตารางออกกำลังกายส่วนตัว "MAY–JUN 2026 · Workout" (ธีมมืด, ภาษาไทย, 2 ยิม/2 โปรแกรม, แตะท่าดูคลิป YouTube + ฟอร์ม)
- เป็นงานส่วนตัวของ Tokky ไม่ใช่งานหลัก

## 5) ข้อควรจำเรื่อง "ความจำ/ประวัติ"
- ในเซสชันคลาวด์นี้ Claude **เห็นแค่ repo นี้** เข้าไม่ถึงประวัติแชต claude.ai เก่า
- ดังนั้นจึง seed ความรู้ไว้ในไฟล์นี้ให้เซสชันหน้า "รู้จัก Tokky" ทันที — ถ้าอยากให้จำข้ามเครื่อง ให้ commit ไฟล์นี้เข้า git
