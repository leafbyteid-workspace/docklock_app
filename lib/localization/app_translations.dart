import 'package:get/get.dart';

import 'locale_keys.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "id_ID": {
          LocaleKeys.appName: "Aplikasi",
          LocaleKeys.login: "Masuk",
          LocaleKeys.logout: "Keluar",
          LocaleKeys.email: "Email",
          LocaleKeys.password: "Kata Sandi",
          LocaleKeys.settings: "Pengaturan",
          LocaleKeys.language: "Bahasa",
          LocaleKeys.theme: "Tema",
          LocaleKeys.save: "Simpan",
          LocaleKeys.cancel: "Batal",
          LocaleKeys.profile: "Profil",

          // Beranda
          // Feature Card
          LocaleKeys.home: "Beranda",
          LocaleKeys.homeDesc: "Pusat pengelolaan keamanan dokumen Anda",
          // Enkripsi
          LocaleKeys.security: "Keamanan",
          LocaleKeys.lockFiles: "Kunci Berkas",
          LocaleKeys.lockFilesDesc:
              "Ubah dokumen menjadi data terenkripsi agar hanya dapat diakses oleh pihak yang memiliki kunci.",
          LocaleKeys.startlockFiles: "Mulai Kunci",
          // Dekripsi
          LocaleKeys.dataAccess: "Akses Data",
          LocaleKeys.unlockFiles: "Buka Berkas",
          LocaleKeys.unlockFilesDesc:
              "Pulihkan dokumen terenkripsi kembali ke bentuk aslinya menggunakan kunci yang valid.",
          LocaleKeys.startunlockFiles: "Mulai Unlock",
          // Ringkasan
          LocaleKeys.activitySummary: "Ringkasan Aktivitas",
          LocaleKeys.latestActivity: "Aktivitas Terbaru",

          LocaleKeys.documents: "Dokumen",
          LocaleKeys.stored: "Tersimpan",

          LocaleKeys.total: "Total",
          LocaleKeys.successful: "Berhasil",

          // Kunci Berkas
          LocaleKeys.lockFile: "Kunci Berkas",

          LocaleKeys.selectFile: "Pilih Berkas",
          LocaleKeys.fileName: "Nama Berkas",

          LocaleKeys.passwordHint: "Petunjuk Kata Sandi",
          LocaleKeys.confirmPassword: "Konfirmasi Kata Sandi",

          LocaleKeys.enterPassword: "Masukkan kata sandi...",
          LocaleKeys.repeatPassword: "Ulangi kata sandi...",

          LocaleKeys.passwordHintPlaceholder:
              "Petunjuk untuk mengingat kata sandi",

          LocaleKeys.description: "Deskripsi",
          LocaleKeys.descriptionPlaceholder: "Tambahkan deskripsi berkas...",

          LocaleKeys.lockingFile: "Mengunci Berkas",
          LocaleKeys.lockingFileDesc:
              "Berkas sedang diamankan menggunakan enkripsi",

          LocaleKeys.encrypting: "Sedang Mengenkripsi...",
          LocaleKeys.lockAgain: "Kunci Berkas Ulang",
          LocaleKeys.startLocking: "Lakukan Penguncian",

          LocaleKeys.fileLockedSuccess: "Berkas Berhasil Dikunci",

          LocaleKeys.encryptedFileName: "Nama File",
          LocaleKeys.lockedDate: "Tanggal Dikunci",

          LocaleKeys.downloadFile: "Unduh Berkas",

          LocaleKeys.encryptingData: "Mengenkripsi Data",
          LocaleKeys.encryptingDataDesc:
              "Mohon tunggu, proses sedang berlangsung...",

          LocaleKeys.encryptionCompleted: "Enkripsi berhasil diselesaikan",

          LocaleKeys.encryptionProcessing: "Sedang memproses enkripsi...",

          // Buka Kunci Berkas
          LocaleKeys.unlockFile: "Buka Kunci Berkas",

          LocaleKeys.encryptedFile: "Berkas Terenkripsi",

          LocaleKeys.selectEncryptedFile: "Pilih Berkas .dclock",

          LocaleKeys.openingFile: "Membuka Kunci Berkas",
          LocaleKeys.openingFileDesc: "Sedang melakukan proses dekripsi...",

          LocaleKeys.opening: "Sedang Membuka...",

          LocaleKeys.openAnotherFile: "Buka Berkas Lain",

          LocaleKeys.fileOpenedSuccess: "Berkas Berhasil Dibuka",

          LocaleKeys.sourceFile: "Sumber",

          LocaleKeys.createdAt: "Dibuat Pada",

          LocaleKeys.fileType: "Tipe",

          LocaleKeys.version: "Versi",

          LocaleKeys.noEncryptedFile: "Belum Ada Berkas",

          LocaleKeys.noEncryptedFileDesc:
              "Silakan pilih berkas .dclock terlebih dahulu untuk melihat informasi berkas dan melakukan proses dekripsi.",

          LocaleKeys.decryptingFile: "Mendekripsi Berkas",

          LocaleKeys.decryptingFileDesc:
              "Mohon tunggu, proses sedang berlangsung...",

          LocaleKeys.decryptionCompleted: "Dekripsi berhasil diselesaikan",

          LocaleKeys.decryptionProcessing: "Sedang memproses dekripsi...",

          // Aktivitas
          // Daftar Aktivitas
          LocaleKeys.activity: "Aktivitas",
          LocaleKeys.activityDesc: "Riwayat Proses Aktivitas Keamanan Dokumen",

          LocaleKeys.searchDocument: "Cari dokumen...",

          LocaleKeys.all: "Semua",
          LocaleKeys.locked: "Terkunci",
          LocaleKeys.unlocked: "Terbuka",

          LocaleKeys.noActivity: "Belum Ada Aktivitas",
          LocaleKeys.noActivityDesc:
              "Riwayat Enkripsi dan Dekripsi akan muncul di sini.",

          LocaleKeys.fileDeletedSuccess: "Berkas berhasil dihapus.",
          // Detail Berkas
          LocaleKeys.fileDetail: "Detail Berkas",

          LocaleKeys.fileInformation: "Informasi Berkas",

          LocaleKeys.originalName: "Nama Asli",
          LocaleKeys.encryptedName: "Nama Enkripsi",
          LocaleKeys.fileSize: "Ukuran",
          LocaleKeys.extension: "Ekstensi",
          LocaleKeys.status: "Status",
          LocaleKeys.lockedAt: "Waktu Dikunci",
          LocaleKeys.openedAt: "Terakhir Dibuka",

          LocaleKeys.fileLocked: "Berkas Terkunci",
          LocaleKeys.fileUnlocked: "Berkas Terbuka",

          LocaleKeys.fileLockedDesc:
              "Dokumen berhasil diamankan menggunakan enkripsi.",

          LocaleKeys.fileUnlockedDesc: "Dokumen telah berhasil didekripsi.",

          LocaleKeys.share: "Bagikan",
          LocaleKeys.download: "Unduh",

          LocaleKeys.deleteFile: "Hapus Berkas",
          LocaleKeys.deleting: "Menghapus...",

          LocaleKeys.dataNotFound: "Data Tidak Ditemukan",
          LocaleKeys.dataNotFoundDesc:
              "Silakan tambahkan data berkas terlebih dahulu.",

          // Profil
          LocaleKeys.myProfile: "Profil Saya",
          LocaleKeys.personalInformation: "Informasi Pribadi",
          LocaleKeys.active: "Aktif",
          LocaleKeys.account: "Akun",
          LocaleKeys.themePreference: "Preferensi Tema",
          LocaleKeys.manageAccount:
              "Kelola informasi akun dan pengaturan aplikasi",
          LocaleKeys.personalInformationDesc: "Kelola data profil pengguna",
          LocaleKeys.accountSecurity: "Keamanan Akun",
          LocaleKeys.accountSecurityDesc: "Kelola kata sandi dan keamanan akun",
          LocaleKeys.preference: "Preferensi",
          LocaleKeys.themeDesc: "Atur tampilan terang, gelap, atau sistem",
          LocaleKeys.languageDesc:
              "Pilih bahasa yang akan digunakan untuk aplikasi",
          LocaleKeys.help: "Bantuan",
          LocaleKeys.privacyPolicy: "Kebijakan Privasi",
          LocaleKeys.privacyPolicyDesc:
              "Pelajari cara kami mengelola data Anda",
          LocaleKeys.terms: "Syarat dan Ketentuan",
          LocaleKeys.termsDesc: "Ketentuan penggunaan aplikasi",
          LocaleKeys.rateApp: "Beri Penilaian",
          LocaleKeys.rateAppDesc:
              "Bagikan pengalaman Anda menggunakan aplikasi",
          LocaleKeys.feedback: "Kirim Saran",
          LocaleKeys.feedbackDesc:
              "Sampaikan masukan untuk pengembangan aplikasi",
          LocaleKeys.aboutApp: "Tentang Aplikasi",
          LocaleKeys.aboutAppDesc: "Informasi versi dan pengembang aplikasi",
          LocaleKeys.session: "Sesi",
          LocaleKeys.logoutDesc: "Keluar dari aplikasi",
          LocaleKeys.chooseTheme: "Pilih Tema",
          LocaleKeys.chooseThemeDesc:
              "Tema akan langsung diterapkan setelah dipilih.",
          LocaleKeys.followSystem: "Ikuti Sistem",
          LocaleKeys.followSystemDesc:
              "Mengikuti tema terang/gelap sesuai pengaturan perangkat.",
          LocaleKeys.lightTheme: "Tema Terang",
          LocaleKeys.lightThemeDesc: "Selalu menggunakan tema terang.",
          LocaleKeys.darkTheme: "Tema Gelap",
          LocaleKeys.darkThemeDesc: "Selalu menggunakan tema gelap.",
          LocaleKeys.userDataDetails: "Detail Data Pengguna",
          LocaleKeys.fullName: "Nama Lengkap",
          LocaleKeys.userName: "Nama Pengguna",
          LocaleKeys.age: "Usia",
          LocaleKeys.gender: "Jenis Kelamin",

          // Keamanan Akun
          // Ubah Kata Sandi
          LocaleKeys.changePassword: "Ubah Kata Sandi",
          LocaleKeys.changePasswordDesc:
              "Perbarui kata sandi untuk menjaga keamanan akun Anda.",
          LocaleKeys.deleteAccount: "Hapus Akun",
          LocaleKeys.deleteAccountDesc:
              "Hapus akun beserta seluruh data yang terkait secara permanen.",

          LocaleKeys.accountSecurityTitle: "Keamanan Akun",
          LocaleKeys.accountSecurityInstruction:
              "Silakan masukkan kata sandi lama dan kata sandi baru Anda.",

          LocaleKeys.currentPassword: "Kata Sandi Lama",
          LocaleKeys.newPassword: "Kata Sandi Baru",
          LocaleKeys.confirmNewPassword: "Konfirmasi Kata Sandi",

          LocaleKeys.currentPasswordHint: "Masukkan kata sandi lama",
          LocaleKeys.newPasswordHint: "Masukkan kata sandi baru",
          LocaleKeys.confirmNewPasswordHint: "Ulangi kata sandi baru",

          LocaleKeys.savePassword: "Simpan Kata Sandi",

          LocaleKeys.passwordRequirement:
              "Kata sandi minimal terdiri dari 8 karakter. Gunakan kombinasi huruf besar, huruf kecil, angka, dan simbol agar akun lebih aman.",
        },
        "en_US": {
          LocaleKeys.appName: "Application",
          LocaleKeys.login: "Login",
          LocaleKeys.logout: "Logout",
          LocaleKeys.email: "Email",
          LocaleKeys.password: "Password",
          LocaleKeys.settings: "Settings",
          LocaleKeys.language: "Language",
          LocaleKeys.theme: "Theme",
          LocaleKeys.save: "Save",
          LocaleKeys.cancel: "Cancel",
          LocaleKeys.profile: "Profile",

          // Beranda
          // Feature Card
          LocaleKeys.home: "Home",
          LocaleKeys.homeDesc: "Your Document Security Management Center",
          // Enkripsi
          LocaleKeys.security: "Security",
          LocaleKeys.lockFiles: "Lock Files",
          LocaleKeys.lockFilesDesc:
              "Convert the document into encrypted data so that it can only be accessed by those who have the key.",
          LocaleKeys.startlockFiles: "Start Lock",
          // Dekripsi
          LocaleKeys.dataAccess: "Data Access",
          LocaleKeys.unlockFiles: "Open Files",
          LocaleKeys.unlockFilesDesc:
              "Restore the encrypted document to its original form using a valid key.",
          LocaleKeys.startunlockFiles: "Start Open",
          // Ringkasan
          LocaleKeys.activitySummary: "Activity Summary",
          LocaleKeys.latestActivity: "Recent Activities",

          LocaleKeys.documents: "Documents",
          LocaleKeys.stored: "Stored",

          LocaleKeys.total: "Total",
          LocaleKeys.successful: "Successful",

          // Lock File
          LocaleKeys.lockFile: "Lock File",

          LocaleKeys.selectFile: "Select File",
          LocaleKeys.fileName: "File Name",

          LocaleKeys.passwordHint: "Password Hint",
          LocaleKeys.confirmPassword: "Confirm Password",

          LocaleKeys.enterPassword: "Enter password...",
          LocaleKeys.repeatPassword: "Repeat password...",

          LocaleKeys.passwordHintPlaceholder:
              "Hint to help remember the password",

          LocaleKeys.description: "Description",
          LocaleKeys.descriptionPlaceholder: "Add a file description...",

          LocaleKeys.lockingFile: "Locking File",
          LocaleKeys.lockingFileDesc:
              "The file is being secured using encryption",

          LocaleKeys.encrypting: "Encrypting...",
          LocaleKeys.lockAgain: "Lock Another File",
          LocaleKeys.startLocking: "Start Locking",

          LocaleKeys.fileLockedSuccess: "File Locked Successfully",

          LocaleKeys.encryptedFileName: "Encrypted File Name",

          LocaleKeys.lockedDate: "Locked Date",

          LocaleKeys.downloadFile: "Download File",

          LocaleKeys.encryptingData: "Encrypting Data",
          LocaleKeys.encryptingDataDesc:
              "Please wait while the process is running...",

          LocaleKeys.encryptionCompleted: "Encryption completed successfully",

          LocaleKeys.encryptionProcessing: "Encrypting file...",

          // Unlock File
          LocaleKeys.unlockFile: "Unlock File",

          LocaleKeys.encryptedFile: "Encrypted File",

          LocaleKeys.selectEncryptedFile: "Select a .dclock file",

          LocaleKeys.openingFile: "Unlocking File",

          LocaleKeys.openingFileDesc: "Decrypting the file...",

          LocaleKeys.opening: "Unlocking...",

          LocaleKeys.openAnotherFile: "Open Another File",

          LocaleKeys.fileOpenedSuccess: "File Opened Successfully",

          LocaleKeys.sourceFile: "Source",

          LocaleKeys.createdAt: "Created At",

          LocaleKeys.fileType: "Type",

          LocaleKeys.version: "Version",

          LocaleKeys.noEncryptedFile: "No File Selected",

          LocaleKeys.noEncryptedFileDesc:
              "Please select a .dclock file to view its information and decrypt it.",

          LocaleKeys.decryptingFile: "Decrypting File",

          LocaleKeys.decryptingFileDesc:
              "Please wait while the process is running...",

          LocaleKeys.decryptionCompleted: "Decryption completed successfully",

          LocaleKeys.decryptionProcessing: "Decrypting file...",

          // Aktivitas
          // Daftar Aktivitas
          LocaleKeys.activity: "Activity",
          LocaleKeys.activityDesc: "History of Document Security Activities",

          LocaleKeys.searchDocument: "Search documents...",

          LocaleKeys.all: "All",
          LocaleKeys.locked: "Locked",
          LocaleKeys.unlocked: "Unlocked",

          LocaleKeys.noActivity: "No Activities Yet",
          LocaleKeys.noActivityDesc:
              "Encryption and decryption history will appear here.",

          LocaleKeys.fileDeletedSuccess: "File deleted successfully.",
          // Detail Berkas
          LocaleKeys.fileDetail: "Detail Berkas",

          LocaleKeys.fileInformation: "Informasi Berkas",

          LocaleKeys.originalName: "Nama Asli",
          LocaleKeys.encryptedName: "Nama Enkripsi",
          LocaleKeys.fileSize: "Ukuran",
          LocaleKeys.extension: "Ekstensi",
          LocaleKeys.status: "Status",
          LocaleKeys.lockedAt: "Waktu Dikunci",
          LocaleKeys.openedAt: "Terakhir Dibuka",

          LocaleKeys.fileLocked: "Berkas Terkunci",
          LocaleKeys.fileUnlocked: "Berkas Terbuka",

          LocaleKeys.fileLockedDesc:
              "Dokumen berhasil diamankan menggunakan enkripsi.",

          LocaleKeys.fileUnlockedDesc: "Dokumen telah berhasil didekripsi.",

          LocaleKeys.share: "Bagikan",
          LocaleKeys.download: "Unduh",

          LocaleKeys.deleteFile: "Hapus Berkas",
          LocaleKeys.deleting: "Menghapus...",

          LocaleKeys.dataNotFound: "Data Tidak Ditemukan",
          LocaleKeys.dataNotFoundDesc:
              "Silakan tambahkan data berkas terlebih dahulu.",

          // Profil
          LocaleKeys.myProfile: "My Profile",
          LocaleKeys.active: "Active",
          LocaleKeys.account: "Account",
          LocaleKeys.personalInformation: "Personal Information",
          LocaleKeys.manageAccount:
              "Manage account information and application settings",
          LocaleKeys.personalInformationDesc: "Manage your profile information",
          LocaleKeys.accountSecurity: "Account Security",
          LocaleKeys.accountSecurityDesc:
              "Manage password and account security",
          LocaleKeys.preference: "Preferences",
          LocaleKeys.themeDesc: "Set light, dark, or follow system appearance",
          LocaleKeys.languageDesc:
              "Choose the language used in the application",
          LocaleKeys.help: "Help",
          LocaleKeys.privacyPolicy: "Privacy Policy",
          LocaleKeys.privacyPolicyDesc: "Learn how we manage your data",
          LocaleKeys.terms: "Terms & Conditions",
          LocaleKeys.termsDesc: "Application terms of use",
          LocaleKeys.rateApp: "Rate App",
          LocaleKeys.rateAppDesc: "Share your experience using the application",
          LocaleKeys.feedback: "Send Feedback",
          LocaleKeys.feedbackDesc: "Send suggestions for future improvements",
          LocaleKeys.aboutApp: "About App",
          LocaleKeys.aboutAppDesc: "Version and developer information",
          LocaleKeys.session: "Session",
          LocaleKeys.logoutDesc: "Sign out from the application",
          LocaleKeys.themePreference: "Theme Preference",
          LocaleKeys.chooseTheme: "Choose Theme",
          LocaleKeys.chooseThemeDesc:
              "The theme will be applied immediately after selection.",
          LocaleKeys.followSystem: "Follow System",
          LocaleKeys.followSystemDesc:
              "Follow the device light/dark appearance.",
          LocaleKeys.lightTheme: "Light Theme",
          LocaleKeys.lightThemeDesc: "Always use light mode.",
          LocaleKeys.darkTheme: "Dark Theme",
          LocaleKeys.darkThemeDesc: "Always use dark mode.",
          LocaleKeys.userDataDetails: "User Data Details",
          LocaleKeys.fullName: "Full Name",
          LocaleKeys.userName: "Username",
          LocaleKeys.age: "Age",
          LocaleKeys.gender: "Gender",

          // Keamanan Akun
          // Ubah Kata Sandi
          LocaleKeys.changePassword: "Change Password",
          LocaleKeys.changePasswordDesc:
              "Update your password to help keep your account secure.",
          LocaleKeys.deleteAccount: "Delete Account",
          LocaleKeys.deleteAccountDesc:
              "Permanently delete your account and all associated data.",
          LocaleKeys.accountSecurityTitle: "Account Security",
          LocaleKeys.accountSecurityInstruction:
              "Please enter your current password and your new password.",

          LocaleKeys.currentPassword: "Current Password",
          LocaleKeys.newPassword: "New Password",
          LocaleKeys.confirmNewPassword: "Confirm New Password",

          LocaleKeys.currentPasswordHint: "Enter your current password",
          LocaleKeys.newPasswordHint: "Enter your new password",
          LocaleKeys.confirmNewPasswordHint: "Re-enter your new password",

          LocaleKeys.savePassword: "Save Password",

          LocaleKeys.passwordRequirement:
              "Your password must contain at least 8 characters. Use a combination of uppercase letters, lowercase letters, numbers, and symbols to keep your account secure.",
        },
      };
}
