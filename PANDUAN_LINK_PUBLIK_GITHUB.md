# Panduan Mempublikasikan Portfolio Siti Najwa ke Internet (Link Publik Gratis)

Website portfolio ini sudah berupa file static HTML, CSS, JavaScript, dan aset lengkap sehingga bisa dipublikasikan secara **100% GRATIS** menggunakan **GitHub Pages** atau platform hosting gratis lainnya (seperti Vercel / Netlify).

---

## CARA TERCEPAT: Menggunakan Script Otomatis `upload-ke-github.bat`

Cukup ikuti langkah mudah berikut:

### Langkah 1: Buat Repository di GitHub
1. Buka browser dan login ke akun GitHub Anda di [github.com](https://github.com/).
2. Klik tombol hijau **New** (atau tanda `+` di kanan atas > **New repository**).
3. Isi:
   - **Repository name**: misalnya `najwa-portfolio`
   - Pilih opsi **Public** (wajib Public agar fitur GitHub Pages gratis bisa aktif)
   - **JANGAN** centang *"Add a README file"* (biarkan kosong karena file website lokal kita sudah lengkap)
4. Klik tombol hijau **Create repository**.
5. Salin (copy) link HTTPS repository yang muncul (contoh: `https://github.com/username-anda/najwa-portfolio.git`).

---

### Langkah 2: Jalankan Script `upload-ke-github.bat`
1. Buka folder proyek di komputer Anda:
   `C:\Users\Admin\.gemini\antigravity\scratch\najwa-portfolio\`
2. Klik ganda (double-click) file **`upload-ke-github.bat`**.
3. Saat jendela command prompt muncul, **paste** link repository GitHub yang sudah Anda salin tadi, lalu tekan **Enter**.
4. Script akan otomatis:
   - Menginisialisasi Git lokal
   - Menyiapkan branch `main`
   - Menghubungkan ke GitHub
   - Meng-upload (push) seluruh file HTML, CSS, JS, dan seluruh aset foto/video ke GitHub.

*(Jika diminta login oleh GitHub, jendela browser akan terbuka otomatis untuk konfirmasi otorisasi login akun GitHub Anda).*

---

### Langkah 3: Aktifkan Link Publik (GitHub Pages)
Setelah upload selesai di Langkah 2:
1. Kembali ke halaman repository Anda di GitHub.
2. Klik tab **Settings** (ikon gear di menu atas repository).
3. Di panel menu sebelah kiri, klik **Pages**.
4. Di bagian **Build and deployment**:
   - **Source**: pilih `Deploy from a branch`
   - **Branch**: pilih `main` dan biarkan folder `/ (root)`
   - Klik tombol **Save**.
5. Tunggu sekitar 1 - 2 menit, lalu refresh halaman tersebut.
6. Anda akan melihat kotak berwarna hijau bertuliskan:
   > **Your site is live at https://username-anda.github.io/najwa-portfolio/**

Link tersebut adalah link publik resmi portfolio Anda yang bisa langsung dicantumkan di CV, bio Instagram/TikTok, LinkedIn, maupun dikirim ke calon klien/HRD!

---

## Alternatif: Upload Manual Lewat Git Terminal

Jika Anda lebih suka menjalankan perintah git sendiri di terminal:

```bash
cd "C:\Users\Admin\.gemini\antigravity\scratch\najwa-portfolio"
git init
git branch -M main
git remote add origin https://github.com/<username-anda>/<nama-repo>.git
git add .
git commit -m "Deploy Najwa Portfolio 2026"
git push -u origin main
```
Lalu aktifkan GitHub Pages di menu **Settings > Pages** seperti pada Langkah 3 di atas.
