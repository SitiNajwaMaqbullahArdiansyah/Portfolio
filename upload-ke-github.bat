@echo off
setlocal enabledelayedexpansion
title Upload Portfolio ke GitHub (GitHub Pages)
color 0A

echo =====================================================================
echo       UPLOAD PORTFOLIO SITI NAJWA KE GITHUB (UNTUK LINK PUBLIK)
echo =====================================================================
echo.

:: 1. Cek apakah Git sudah terinstall
where git >nul 2>&1
if %ERRORLEVEL% neq 0 (
    color 0C
    echo [ERROR] Git belum terinstall di komputer ini atau belum masuk PATH!
    echo Silakan download dan install Git terlebih dahulu dari: https://git-scm.com/
    echo Setelah diinstall, jalankan kembali script ini.
    echo.
    pause
    exit /b
)

echo [OK] Git terdeteksi di komputer Anda!
echo.

:: 2. Masukkan URL Repository GitHub
echo ---------------------------------------------------------------------
echo PETUNJUK:
echo 1. Buka browser dan login ke akun GitHub Anda: https://github.com
echo 2. Buat repository baru (klik tombol hijau 'New'):
echo    - Beri nama repository (misal: najwa-portfolio)
echo    - Pilih 'Public' (agar bisa diakses publik gratis)
echo    - JANGAN centang 'Add a README file' (karena file sudah siap)
echo    - Klik 'Create repository'
echo 3. Salin (copy) link HTTPS repository tersebut.
echo ---------------------------------------------------------------------
echo.

set /p REPO_URL="Masukkan URL Repository GitHub Anda (contoh: https://github.com/username/najwa-portfolio.git): "

if "%REPO_URL%"=="" (
    color 0C
    echo.
    echo [ERROR] URL Repository tidak boleh kosong!
    pause
    exit /b
)

echo.
echo Menyiapkan file dan repository lokal...

:: Pindah ke folder script
cd /d "%~dp0"

:: Konfigurasi identitas Git agar tidak error
git config user.name "SitiNajwaMaqbullahArdiansyah"
git config user.email "najwamaqbullah2005@gmail.com"

:: Inisialisasi git jika belum ada
if not exist ".git" (
    git init
    echo [OK] Inisialisasi repository Git lokal berhasil.
) else (
    echo [OK] Repository Git lokal sudah ada.
)

:: Rename branch utama ke main
git branch -M main

:: Tambahkan remote origin
git remote remove origin >nul 2>&1
git remote add origin %REPO_URL%
echo [OK] Menghubungkan ke remote: %REPO_URL%

:: Tambahkan semua file dan commit
echo.
echo Menambahkan file ke Git...
git add .
git commit -m "Deploy Siti Najwa Maqbullah Ardiansyah - Social Media Specialist Portfolio 2026"

:: Hapus cache credential lama yang konflik
echo url=https://github.com | git credential reject >nul 2>&1

:: Push ke GitHub
echo.
echo Mengunggah (Push) file ke GitHub...
git push -u origin main --force

if %ERRORLEVEL% neq 0 (
    color 0E
    echo.
    echo ---------------------------------------------------------------------
    echo [CATATAN]: Jika push meminta login / Personal Access Token, silakan
    echo selesaikan login di browser atau masukkan token GitHub Anda.
    echo.
    echo Jika remote ditolak karena repository di GitHub sudah memiliki file,
    echo kita coba lakukan sinkronisasi paksa:
    echo ---------------------------------------------------------------------
    set /p RETRY="Coba push paksa (force push)? (Y/N): "
    if /i "!RETRY!"=="Y" (
        git push -u origin main --force
    )
)

echo.
echo =====================================================================
echo                 UPLOAD KE GITHUB SELESAI!
echo =====================================================================
echo.
echo CARA MENGAKTIFKAN LINK PUBLIK (GITHUB PAGES GRATIS):
echo ---------------------------------------------------------------------
echo 1. Buka repository Anda di browser: %REPO_URL%
echo 2. Klik menu 'Settings' (Pengaturan) di tab bagian atas repository.
echo 3. Di menu bilah samping kiri (sidebar), klik 'Pages'.
echo 4. Di bagian 'Build and deployment':
echo    - Source : Deploy from a branch
echo    - Branch : Pilih 'main' dan folder '/ (root)'
echo    - Klik tombol 'Save'
echo 5. Tunggu sekitar 1 - 2 menit, lalu REFRESH halaman Settings Pages itu.
echo 6. Link publik website portfolio Anda akan muncul di bagian atas:
echo    "Your site is live at: https://<username>.github.io/<nama-repo>/"
echo ---------------------------------------------------------------------
echo.
echo Website Anda sekarang sudah online dan bisa dibagikan ke siapa saja!
echo.
pause
