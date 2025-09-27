#!/usr/bin/env bash

# =====================================================
#  🔧 PYTHON SETUP SCRIPT (by KangHory)
#  Tujuan: Menyiapkan Python + Dependensi Otomatis
#  Cocok untuk Termux / Linux environment
# =====================================================

set -e  # hentikan script jika ada error

# 🎨 Warna Terminal
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
BLUE="\033[1;34m"
NC="\033[0m"

echo -e "${BLUE}============================================${NC}"
echo -e "${GREEN}🚀 Memulai Setup Lingkungan Python...${NC}"
echo -e "${BLUE}============================================${NC}"

# 1️⃣ Update daftar paket
echo -e "${GREEN}📦 Memperbarui daftar paket...${NC}"
pkg update -y || { echo -e "${RED}❌ Gagal update paket.${NC}"; exit 1; }

# 2️⃣ Instal Python
echo -e "${GREEN}🐍 Menginstal Python...${NC}"
pkg install python -y || { echo -e "${RED}❌ Gagal instal Python.${NC}"; exit 1; }

# 3️⃣ Instal Pillow (opsional tapi umum dipakai)
echo -e "${GREEN}🧩 Menginstal Pillow (python-pillow)...${NC}"
pkg install python-pillow -y || { echo -e "${RED}❌ Gagal instal Pillow.${NC}"; exit 1; }

# 4️⃣ Pastikan pip terpasang & terbaru
echo -e "${GREEN}🔧 Memastikan pip terbaru...${NC}"
python -m ensurepip --upgrade || true
pip install --upgrade pip

# 5️⃣ Instal semua dependensi di requirements.txt (jika ada)
if [ -f "requirements.txt" ]; then
    echo -e "${GREEN}📜 Menginstal dependensi dari requirements.txt...${NC}"
    pip install -r requirements.txt || { echo -e "${RED}❌ Gagal instal dependensi.${NC}"; exit 1; }
else
    echo -e "${YELLOW}⚠️  File requirements.txt tidak ditemukan. Lewati langkah ini.${NC}"
fi

# 6️⃣ Pesan sukses
echo -e "\n${BLUE}============================================${NC}"
echo -e "${GREEN}✅ Instalasi selesai! Semua siap digunakan.${NC}"
echo -e "${BLUE}============================================${NC}"

# 7️⃣ Instruksi selanjutnya
if [ -f "main.py" ]; then
    echo -e "${YELLOW}💡 Untuk menjalankan program utama, ketik:${NC}"
    echo -e "${BLUE}python main.py${NC}\n"
else
    echo -e "${YELLOW}💡 Tidak ada file main.py terdeteksi.${NC}"
    echo -e "   Pastikan kamu tahu file utama yang akan dijalankan.\n"
fi

echo -e "${GREEN}🎉 Setup selesai! Selamat coding 😎${NC}"
