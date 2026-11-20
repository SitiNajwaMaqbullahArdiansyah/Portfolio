@echo off
setlocal enabledelayedexpansion
title Push Portfolio ke GitHub - Siti Najwa
color 0B

echo =======================================================================
echo          PUSH PORTFOLIO SITI NAJWA KE REPOSITORY GITHUB
echo =======================================================================
echo Target Repository : https://github.com/SitiNajwaMaqbullahArdiansyah/Portfolio
echo Target Branch     : main
echo =======================================================================
echo.

cd /d "%~dp0"

:: 1. Atur identitas Git
git config user.name "SitiNajwaMaqbullahArdiansyah"
git config user.email "najwamaqbullah2005@gmail.com"

:: 2. Pastikan remote sudah benar
git remote remove origin >nul 2>&1
git remote add origin https://github.com/SitiNajwaMaqbullahArdiansyah/Portfolio.git

:: 3. Tambahkan semua file dan commit
echo [1/3] Menyiapkan file-file portfolio...
git add .
git commit -m "Deploy Siti Najwa Maqbullah Ardiansyah - Social Media Specialist Portfolio 2026" >nul 2>&1

:: 4. Hapus cache credential lama yang konflik jika ada
echo [2/3] Menyiapkan koneksi ke GitHub...
echo url=https://github.com | git credential reject >nul 2>&1

:: 5. Push ke GitHub
echo [3/3] Mengunggah file ke GitHub (Force Push ke main)...
echo.
echo ***********************************************************************
echo CATATAN PENTING:
echo Jika muncul jendela browser / popup untuk login:
echo 1. Pilih 'Sign in with your browser'
echo 2. Klik tombol hijau 'Authorize git-ecosystem' / 'Authorize'
echo    (karena di browser Anda sudah login sebagai SitiNajwaMaqbullahArdiansyah)
echo ***********************************************************************
echo.

git push -u origin main --force

if %ERRORLEVEL% equ 0 (
    color 0A
    echo.
    echo =======================================================================
    echo               BERHASIL! PORTFOLIO SUDAH TER-UPLOAD KE GITHUB!
    echo =======================================================================
    echo.
    echo Link Publik Website Anda:
    echo https://sitinajwamaqbullahardiansyah.github.io/Portfolio/
    echo.
    echo (Tunggu sekitar 1 menit agar GitHub Pages selesai memproses tampilan)
    echo =======================================================================
) else (
    color 0C
    echo.
    echo =======================================================================
    echo                         UPLOAD MENGALAMI KENDALA
    echo =======================================================================
    echo Penyebab umum: Akun GitHub yang tersimpan di Windows berbeda (Permission Denied).
    echo.
    echo SOLUSI PALING MUDAH (1 Menit):
    echo 1. Buka browser Anda (yang sedang login akun SitiNajwaMaqbullahArdiansyah)
    echo 2. Buka link ini:
    echo    https://github.com/SitiNajwaMaqbullahArdiansyah/Portfolio/settings/access
    echo 3. Klik tombol hijau 'Add people'
    echo 4. Ketik: GalangMuhamadArifin
    echo 5. Klik 'Add to this repository'
    echo 6. Jalankan kembali file batch ini!
    echo =======================================================================
)

echo.
pause
