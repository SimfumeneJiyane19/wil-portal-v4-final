# WIL Portal — Work Integrated Learning Management System

A complete, self-contained placement management system. No cloud services, no API keys — runs 100% on your own PC.

---

## Quick Start

### Windows
Double-click **`start.bat`**

The script will:
1. Create a Python virtual environment
2. Install Flask and dependencies
3. Install React/Vite dependencies (first time only)
4. Start both servers
5. Open the browser automatically

### Mac / Linux
```bash
chmod +x start.sh
./start.sh
```

---

## Login

| Field | Value |
|-------|-------|
| URL | http://localhost:3000 |
| Admin email | admin@wilportal.ac.za |
| Admin password | admin123 |

> Change the admin password after first login via the database or by editing `app.py`.

---

## Manual Start (if start.bat doesn't work)

**Terminal 1 — Backend:**
```cmd
cd backend
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
python app.py
```

**Terminal 2 — Frontend:**
```cmd
cd frontend
npm install
npm run dev
```

Then open **http://localhost:3000**

---

## Features

### Students
- Browse open WIL opportunities
- Apply with a cover letter
- Track application status in real time
- Upload documents (CV, ID, Matric certificate, etc.)
- Bookmark / save favourite opportunities
- Receive notifications for new postings and status changes
- Update your student profile

### Admins / Coordinators
- Dashboard with live statistics
- Review, approve, or reject student applications
- View student documents in the review modal
- Post new opportunities (all students are notified automatically)
- Manage companies
- View and manage all registered students
- Promote students to Coordinator
- Statistics page with status distribution and industry breakdown

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Backend | Python 3 + Flask + SQLite |
| Frontend | React 18 + Vite (single-file, no Tailwind needed) |
| Auth | Session-based (Flask sessions + SHA-256 hashing) |
| Database | SQLite (`backend/wil_portal.db`, auto-created) |
| File uploads | Local disk (`backend/uploads/`, auto-created) |

---

## Project Structure

```
wil-portal/
├── start.bat              ← Windows launcher (double-click this)
├── start.sh               ← Mac/Linux launcher
├── README.md
│
├── backend/
│   ├── app.py             ← All routes, models, and logic (single file)
│   ├── requirements.txt
│   ├── wil_portal.db      ← Auto-created on first run
│   └── uploads/           ← Uploaded student files
│
└── frontend/
    ├── index.html
    ├── vite.config.js     ← Proxies /api → localhost:5000
    ├── package.json
    └── src/
        ├── main.jsx
        ├── api.js         ← All API calls in one place
        └── App.jsx        ← All pages and components (single file)
```

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| `pip install` fails | Switch to mobile hotspot — campus WiFi may block pip |
| `npm install` fails | Same — use mobile data |
| Port 5000 in use | Change `port=5000` in `app.py` and `target` in `vite.config.js` |
| Port 3000 in use | Change `port: 3000` in `vite.config.js` |
| White screen | Check the terminal running Flask for errors |
| Login says "Invalid credentials" | Make sure the backend is running (`python app.py`) |
| Files won't upload | Check that `backend/uploads/` folder exists (it's auto-created) |

---

## Database

The SQLite database is created automatically at `backend/wil_portal.db`.

To reset everything: delete `wil_portal.db` and restart the backend. A fresh admin account will be created.

To view the database: download [DB Browser for SQLite](https://sqlitebrowser.org/) — free and easy.
