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

      // Splash Screen
      LocaleKeys.splashTitle: "DocLock",
      LocaleKeys.splashDescription:
          "Lindungi dokumen penting dengan\nkeamanan yang hanya dapat Anda akses.",
      LocaleKeys.appVersion: "Versi",

      // Auth
      // Login
      LocaleKeys.copyright: "© 2026 DocLock. Hak cipta dilindungi.",
      LocaleKeys.loginDescription:
          "Keamanan data dimulai dari sini. Masuk ke akun DocLock Anda.",
      LocaleKeys.noAccountYet: "Belum Punya Akun?",
      LocaleKeys.loginFailedTitle: "Masuk Gagal",

      LocaleKeys.emailNotRegistered: "Email tidak terdaftar.",

      LocaleKeys.incorrectPassword: "Kata sandi yang dimasukkan salah.",

      LocaleKeys.userNotFound: "Data pengguna tidak ditemukan.",

      LocaleKeys.loginSuccess: "Berhasil Masuk",

      // Validasi
      LocaleKeys.fullNameRequired: "Nama lengkap wajib diisi.",
      LocaleKeys.fullNameMinLength: "Minimal 3 karakter.",

      LocaleKeys.usernameRequired: "Nama pengguna wajib diisi.",
      LocaleKeys.usernameNoSpaces:
          "Nama pengguna tidak boleh mengandung spasi.",
      LocaleKeys.usernameMinLength: "Minimal 4 karakter.",

      LocaleKeys.emailRequired: "Email wajib diisi.",
      LocaleKeys.invalidEmailFormat: "Format email tidak valid.",

      LocaleKeys.passwordRequired: "Kata sandi wajib diisi.",
      LocaleKeys.passwordMinLength: "Minimal 8 karakter.",

      LocaleKeys.confirmPasswordRequired: "Konfirmasi kata sandi wajib diisi.",
      LocaleKeys.confirmPasswordMismatch: "Konfirmasi kata sandi tidak sama.",

      LocaleKeys.emailTooLong: "Email terlalu panjang.",

      LocaleKeys.passwordTooLong: "Kata sandi terlalu panjang.",

      // Register
      // Register View
      LocaleKeys.register: "Daftar",

      LocaleKeys.createAccountDesc:
          "Buat akun untuk mulai melindungi dokumen penting Anda.",

      LocaleKeys.fullName: "Nama Lengkap",
      LocaleKeys.fullNameHint: "Masukkan Nama Lengkap...",

      LocaleKeys.username: "Nama Pengguna",
      LocaleKeys.usernameHint: "Masukkan Nama Pengguna...",

      LocaleKeys.emailHint: "Masukkan Email...",

      LocaleKeys.confirmPassword: "Ulangi Kata Sandi",
      LocaleKeys.confirmPasswordHint: "Masukkan Ulang Kata Sandi...",

      LocaleKeys.processing: "Memproses...",

      LocaleKeys.alreadyHaveAccount: "Sudah Punya Akun?",

      LocaleKeys.agreeRegister: "Dengan mendaftar, Anda menyetujui ",

      LocaleKeys.termsAndConditions: "Syarat & Ketentuan",

      LocaleKeys.and: " serta ",
      LocaleKeys.emailAlreadyExistsTitle: "Email Sudah Digunakan",
      LocaleKeys.emailAlreadyExistsDesc: "Gunakan alamat email lain yang unik.",

      LocaleKeys.usernameAlreadyExistsTitle: "Nama Pengguna Sudah Digunakan",
      LocaleKeys.usernameAlreadyExistsDesc:
          "Gunakan nama pengguna lain yang unik.",

      LocaleKeys.registerSuccess: "Pendaftaran Berhasil",

      LocaleKeys.fullNameMaxLength: "Nama lengkap maksimal 40 karakter.",

      LocaleKeys.fullNameInvalidCharacter: "Nama hanya boleh berisi huruf.",

      LocaleKeys.fullNameMultipleSpaces:
          "Nama tidak boleh memiliki spasi berulang.",

      LocaleKeys.usernameMaxLength: "Username maksimal 15 karakter.",

      LocaleKeys.usernameInvalidCharacter:
          "Username hanya boleh menggunakan huruf, angka, dan _.",

      LocaleKeys.usernameNotAllowed: "Username tidak dapat digunakan.",

      LocaleKeys.invalidEmailDoubleDot: "Format email tidak valid.",

      LocaleKeys.passwordMaxLength: "Kata sandi maksimal 24 karakter.",

      LocaleKeys.passwordNoSpaces: "Kata sandi tidak boleh mengandung spasi.",

      LocaleKeys.passwordRequireUppercase:
          "Kata sandi harus memiliki huruf kapital.",

      LocaleKeys.passwordRequireNumber: "Kata sandi harus memiliki angka.",

      // Registrasi Berhasil
      LocaleKeys.registerSuccessTitle: "Pendaftaran Berhasil",

      LocaleKeys.registerSuccessMessage:
          "Akun Anda berhasil dibuat. Silakan masuk menggunakan akun yang telah didaftarkan.",

      LocaleKeys.continueText: "Lanjut",

      // Logout
      LocaleKeys.logoutSuccess: "Akun Berhasil Dikeluarkan",
      LocaleKeys.logoutFailed: "Gagal Keluar Akun",

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
      LocaleKeys.startunlockFiles: "Mulai Buka",
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

      LocaleKeys.enterPassword: "Masukkan kata sandi...",
      LocaleKeys.repeatPassword: "Ulangi kata sandi...",

      LocaleKeys.passwordHintPlaceholder: "Petunjuk untuk mengingat kata sandi",

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

      LocaleKeys.fileNotSelectedTitle: "Berkas Belum Dipilih",
      LocaleKeys.fileNotSelectedDesc: "Silakan pilih berkas yang akan dikunci.",

      LocaleKeys.emptyFileNameTitle: "Nama Berkas Kosong",
      LocaleKeys.emptyFileNameDesc: "Masukkan nama berkas.",

      LocaleKeys.fileNameTooLongTitle: "Nama Berkas Terlalu Panjang",
      LocaleKeys.fileNameTooLongDesc: "Nama berkas maksimal 50 karakter.",

      LocaleKeys.emptyPasswordTitle: "Kata Sandi Kosong",
      LocaleKeys.emptyPasswordDesc: "Masukkan kata sandi.",

      LocaleKeys.passwordTooShortTitle: "Kata Sandi Terlalu Pendek",
      LocaleKeys.passwordTooShortDesc: "Kata sandi minimal 8 karakter.",

      LocaleKeys.passwordTooLongTitle: "Kata Sandi Terlalu Panjang",
      LocaleKeys.passwordTooLongDesc: "Kata sandi maksimal 15 karakter.",

      LocaleKeys.emptyConfirmPasswordTitle: "Konfirmasi Kata Sandi Kosong",
      LocaleKeys.emptyConfirmPasswordDesc: "Masukkan konfirmasi kata sandi.",

      LocaleKeys.passwordMismatchTitle: "Konfirmasi Tidak Sesuai",
      LocaleKeys.passwordMismatchDesc: "Konfirmasi kata sandi tidak sama.",

      LocaleKeys.passwordHintTooLongTitle: "Petunjuk Terlalu Panjang",
      LocaleKeys.passwordHintTooLongDesc:
          "Petunjuk kata sandi maksimal 25 karakter.",

      LocaleKeys.descriptionTooLongTitle: "Deskripsi Terlalu Panjang",
      LocaleKeys.descriptionTooLongDesc: "Deskripsi maksimal 150 karakter.",

      LocaleKeys.fileSizeTooLargeTitle: "Ukuran Berkas Terlalu Besar",
      LocaleKeys.fileSizeTooLargeDesc:
          "Ukuran berkas tidak boleh melebihi 100 MB.",

      LocaleKeys.encryptActivity: "Enkripsi Berkas",
      LocaleKeys.encryptActivityDesc: "Berkas %s berhasil dikunci.",

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

      LocaleKeys.invalidFileTitle: "Berkas Tidak Valid",
      LocaleKeys.okUnderstand: "Oke, Dimengerti!",

      LocaleKeys.invalidDoclockFile:
          "Berkas yang dipilih bukan berkas DocLock yang valid.",
      LocaleKeys.fileCannotBeVerified: "Berkas tidak dapat diverifikasi.",
      LocaleKeys.fileNotDoclock:
          "Berkas ini bukan berasal dari aplikasi DocLock.",
      LocaleKeys.manifestNotFound:
          "Manifest tidak ditemukan. File bukan berasal dari DocLock.",
      LocaleKeys.metadataNotFound:
          "Metadata tidak ditemukan. File bukan berasal dari DocLock.",
      LocaleKeys.cipherNotFound:
          "Cipher tidak ditemukan. File bukan berasal dari DocLock.",
      LocaleKeys.invalidSignature: "Signature DocLock tidak valid.",
      LocaleKeys.unsupportedVersion: "Versi berkas tidak didukung.",
      LocaleKeys.invalidAlgorithm: "Algoritma enkripsi tidak sesuai.",
      LocaleKeys.corruptedMetadata: "Metadata berkas rusak.",
      LocaleKeys.checksumMismatch:
          "Checksum tidak sesuai. File kemungkinan rusak.",
      LocaleKeys.enterPasswordMessage: "Masukkan kata sandi Anda!",
      LocaleKeys.wrongPassword: "Kata Sandi Salah",
      LocaleKeys.wrongPasswordDesc: "Kata sandi yang dimasukkan tidak sesuai.",

      LocaleKeys.decryptionFailed: "Dekripsi Gagal",

      LocaleKeys.decryptActivity: "Dekripsi Berkas",
      LocaleKeys.decryptActivityDesc: "Berkas %s berhasil didekripsi.",

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
      LocaleKeys.deleteFileConfirmation:
          "Apakah Anda yakin ingin menghapus berkas ini?",
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
      LocaleKeys.manageAccount: "Kelola informasi akun dan pengaturan aplikasi",
      LocaleKeys.personalInformationDesc: "Kelola data profil pengguna",
      LocaleKeys.accountSecurity: "Keamanan Akun",
      LocaleKeys.accountSecurityDesc: "Kelola kata sandi dan keamanan akun",
      LocaleKeys.preference: "Preferensi",
      LocaleKeys.themeDesc: "Atur tampilan terang, gelap, atau sistem",
      LocaleKeys.languageDesc:
          "Pilih bahasa yang akan digunakan untuk aplikasi",
      LocaleKeys.help: "Bantuan",
      LocaleKeys.privacyPolicy: "Kebijakan Privasi",
      LocaleKeys.privacyPolicyDesc: "Pelajari cara kami mengelola data Anda",
      LocaleKeys.terms: "Syarat dan Ketentuan",
      LocaleKeys.termsDesc: "Ketentuan penggunaan aplikasi",
      LocaleKeys.rateApp: "Beri Penilaian",
      LocaleKeys.rateAppDesc: "Bagikan pengalaman Anda menggunakan aplikasi",
      LocaleKeys.feedback: "Kirim Saran",
      LocaleKeys.feedbackDesc: "Sampaikan masukan untuk pengembangan aplikasi",
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
      LocaleKeys.age: "Usia",
      LocaleKeys.gender: "Jenis Kelamin",
      LocaleKeys.genderHint: "Belum Terisi",

      // Informasi Pribadi:
      // Enum Jenis Kelamin
      LocaleKeys.genderMale: "Pria",
      LocaleKeys.genderFemale: "Wanita",
      LocaleKeys.genderNotFilled: "Belum Terisi",

      // Field Informasi Pribadi
      LocaleKeys.enterFullNameDesc: "Masukkan nama lengkap Anda.",
      LocaleKeys.usernameDialogDesc: "Nama pengguna digunakan saat login.",
      LocaleKeys.emailDialogDesc: "Masukkan alamat email aktif.",

      LocaleKeys.ageDialogDesc: "Masukkan usia Anda.",
      LocaleKeys.ageHint: "Contoh: 25",
      LocaleKeys.ageRequired: "Usia tidak boleh kosong.",
      LocaleKeys.ageMustBeNumber: "Usia harus berupa angka.",
      LocaleKeys.ageInvalid: "Usia tidak valid.",

      LocaleKeys.genderDialogDesc: "Pilih jenis kelamin Anda.",

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

      // Keamanan Akun - Ubah Kata Sandi
      LocaleKeys.oldPasswordRequired: "Kata sandi lama wajib diisi.",
      LocaleKeys.newPasswordRequired: "Kata sandi baru wajib diisi.",
      LocaleKeys.confirmNewPasswordRequired:
          "Konfirmasi kata sandi wajib diisi.",

      LocaleKeys.newPasswordSameAsOld:
          "Kata sandi baru tidak boleh sama dengan kata sandi lama.",

      LocaleKeys.oldPasswordIncorrect: "Kata sandi lama tidak sesuai.",

      LocaleKeys.passwordChangedSuccess: "Kata sandi berhasil diperbarui.",

      LocaleKeys.sessionNotFound: "Sesi pengguna tidak ditemukan.",

      LocaleKeys.accountNotFound: "Akun tidak ditemukan.",

      LocaleKeys.passwordMinCharacter: "Minimal 8 karakter.",

      // Pesan Kesalahan
      // Keluar
      LocaleKeys.logoutTitle: "Keluar dari akun?",
      LocaleKeys.logoutSubtitle:
          "Anda akan keluar dari sesi saat ini dan perlu masuk kembali untuk menggunakan aplikasi.",
      LocaleKeys.logoutConfirm: "Keluar",

      // Hapus Akun
      LocaleKeys.deleteAccountTitle: "Hapus Akun",

      LocaleKeys.deleteAccountWarning: "Tindakan ini tidak dapat dibatalkan.",

      LocaleKeys.deleteAccountType: "Ketik",

      LocaleKeys.deleteAccountConfirmation: "konfirmasi penghapusan",

      LocaleKeys.deleteAccountPlaceholder: "konfirmasi penghapusan",

      LocaleKeys.confirmDelete: "Hapus",

      // Internet Connection
      LocaleKeys.noInternetConnection: "Tidak Ada Koneksi Internet",
      LocaleKeys.noInternetConnectionDesc:
          "Aplikasi membutuhkan koneksi internet untuk digunakan. Silakan aktifkan koneksi internet Anda.",
      LocaleKeys.understood: "Ya, Saya Mengerti!",

      // Snackbar:
      // Main
      LocaleKeys.anError: "Terjadi Kesalahan",
      LocaleKeys.anErrorDesc: "Gagal Dalam Memproses, Silahkan Coba lagi!",

      // List
      LocaleKeys.failed: "Gagal",
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

      // Splash Screen
      LocaleKeys.splashTitle: "DocLock",
      LocaleKeys.splashDescription:
          "Protect your important documents with\nsecurity that only you can access.",
      LocaleKeys.appVersion: "Version",

      // Auth
      // Login
      LocaleKeys.copyright: "© 2026 DocLock. All rights reserved.",
      LocaleKeys.loginDescription:
          "Data security starts here. Sign in to your DocLock account.",
      LocaleKeys.noAccountYet: "Don't Have an Account?",
      LocaleKeys.loginFailedTitle: "Login Failed",

      LocaleKeys.emailNotRegistered: "Email is not registered.",

      LocaleKeys.incorrectPassword: "The password you entered is incorrect.",

      LocaleKeys.userNotFound: "User data not found.",

      LocaleKeys.loginSuccess: "Login Successful",

      // Validation
      LocaleKeys.fullNameRequired: "Full name is required.",
      LocaleKeys.fullNameMinLength: "Minimum 3 characters.",

      LocaleKeys.usernameRequired: "Username is required.",
      LocaleKeys.usernameNoSpaces: "Username cannot contain spaces.",
      LocaleKeys.usernameMinLength: "Minimum 4 characters.",

      LocaleKeys.emailRequired: "Email is required.",
      LocaleKeys.invalidEmailFormat: "Invalid email format.",

      LocaleKeys.passwordRequired: "Password is required.",
      LocaleKeys.passwordMinLength: "Minimum 8 characters.",

      LocaleKeys.confirmPasswordRequired: "Password confirmation is required.",
      LocaleKeys.confirmPasswordMismatch:
          "Password confirmation does not match.",

      LocaleKeys.emailTooLong: "Email is too long.",

      LocaleKeys.passwordTooLong: "Password is too long.",

      // Register
      LocaleKeys.register: "Register",

      LocaleKeys.createAccountDesc:
          "Create an account to start protecting your important documents.",

      LocaleKeys.fullName: "Full Name",
      LocaleKeys.fullNameHint: "Enter Full Name...",

      LocaleKeys.username: "Username",
      LocaleKeys.usernameHint: "Enter Username...",

      LocaleKeys.emailHint: "Enter Email...",

      LocaleKeys.confirmPassword: "Confirm Password",
      LocaleKeys.confirmPasswordHint: "Enter Password Again...",

      LocaleKeys.processing: "Processing...",

      LocaleKeys.alreadyHaveAccount: "Already Have an Account?",

      LocaleKeys.agreeRegister: "By registering, you agree to ",

      LocaleKeys.termsAndConditions: "Terms & Conditions",

      LocaleKeys.and: " and ",
      LocaleKeys.emailAlreadyExistsTitle: "Email Already Exists",
      LocaleKeys.emailAlreadyExistsDesc:
          "Please use another unique email address.",

      LocaleKeys.usernameAlreadyExistsTitle: "Username Already Exists",
      LocaleKeys.usernameAlreadyExistsDesc:
          "Please use another unique username.",

      LocaleKeys.registerSuccess: "Registration Successful",

      LocaleKeys.fullNameMaxLength: "Full name cannot exceed 40 characters.",

      LocaleKeys.fullNameInvalidCharacter:
          "Full name can only contain letters.",

      LocaleKeys.fullNameMultipleSpaces:
          "Full name cannot contain multiple consecutive spaces.",

      LocaleKeys.usernameMaxLength: "Username cannot exceed 15 characters.",

      LocaleKeys.usernameInvalidCharacter:
          "Username can only contain letters, numbers, and _.",

      LocaleKeys.usernameNotAllowed: "This username cannot be used.",

      LocaleKeys.invalidEmailDoubleDot: "Invalid email format.",

      LocaleKeys.passwordMaxLength: "Password cannot exceed 24 characters.",

      LocaleKeys.passwordNoSpaces: "Password cannot contain spaces.",

      LocaleKeys.passwordRequireUppercase:
          "Password must contain an uppercase letter.",

      LocaleKeys.passwordRequireNumber: "Password must contain a number.",

      // Register Success Dialog
      LocaleKeys.registerSuccessTitle: "Registration Successful",

      LocaleKeys.registerSuccessMessage:
          "Your account has been created successfully. Please login using your registered account.",

      LocaleKeys.continueText: "Continue",

      // Logout
      LocaleKeys.logoutSuccess: "Account Signed Out Successfully",
      LocaleKeys.logoutFailed: "Failed to Sign Out",

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

      LocaleKeys.enterPassword: "Enter password...",
      LocaleKeys.repeatPassword: "Repeat password...",

      LocaleKeys.passwordHintPlaceholder: "Hint to help remember the password",

      LocaleKeys.description: "Description",
      LocaleKeys.descriptionPlaceholder: "Add a file description...",

      LocaleKeys.lockingFile: "Locking File",
      LocaleKeys.lockingFileDesc: "The file is being secured using encryption",

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

      LocaleKeys.emptyFileNameTitle: "File Name Required",
      LocaleKeys.emptyFileNameDesc: "Please enter the file name.",

      LocaleKeys.fileNameTooLongTitle: "File Name Too Long",
      LocaleKeys.fileNameTooLongDesc: "File name cannot exceed 50 characters.",

      LocaleKeys.emptyPasswordTitle: "Password Required",
      LocaleKeys.emptyPasswordDesc: "Please enter your password.",

      LocaleKeys.passwordTooShortTitle: "Password Too Short",
      LocaleKeys.passwordTooShortDesc:
          "Password must be at least 8 characters.",

      LocaleKeys.passwordTooLongTitle: "Password Too Long",
      LocaleKeys.passwordTooLongDesc: "Password cannot exceed 15 characters.",

      LocaleKeys.emptyConfirmPasswordTitle: "Confirmation Required",
      LocaleKeys.emptyConfirmPasswordDesc:
          "Please enter the password confirmation.",

      LocaleKeys.passwordMismatchTitle: "Password Mismatch",
      LocaleKeys.passwordMismatchDesc: "Password confirmation does not match.",

      LocaleKeys.passwordHintTooLongTitle: "Password Hint Too Long",
      LocaleKeys.passwordHintTooLongDesc:
          "Password hint cannot exceed 25 characters.",

      LocaleKeys.descriptionTooLongTitle: "Description Too Long",
      LocaleKeys.descriptionTooLongDesc:
          "Description cannot exceed 150 characters.",

      LocaleKeys.fileSizeTooLargeTitle: "File Size Too Large",
      LocaleKeys.fileSizeTooLargeDesc: "The file size must not exceed 100 MB.",

      LocaleKeys.encryptActivity: "File Encryption",
      LocaleKeys.encryptActivityDesc: "File %s was successfully encrypted.",

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

      LocaleKeys.invalidFileTitle: "Invalid File",
      LocaleKeys.okUnderstand: "OK, I Understand!",

      LocaleKeys.invalidDoclockFile:
          "The selected file is not a valid DocLock file.",
      LocaleKeys.fileCannotBeVerified: "The file could not be verified.",
      LocaleKeys.fileNotDoclock: "This file was not created by DocLock.",
      LocaleKeys.manifestNotFound:
          "Manifest not found. This is not a DocLock file.",
      LocaleKeys.metadataNotFound:
          "Metadata not found. This is not a DocLock file.",
      LocaleKeys.cipherNotFound:
          "Cipher not found. This is not a DocLock file.",
      LocaleKeys.invalidSignature: "Invalid DocLock signature.",
      LocaleKeys.unsupportedVersion: "Unsupported file version.",
      LocaleKeys.invalidAlgorithm: "Invalid encryption algorithm.",
      LocaleKeys.corruptedMetadata: "File metadata is corrupted.",
      LocaleKeys.checksumMismatch:
          "Checksum mismatch. The file may be corrupted.",

      LocaleKeys.enterPasswordMessage: "Please enter your password!",

      LocaleKeys.wrongPassword: "Incorrect Password",
      LocaleKeys.wrongPasswordDesc: "The password you entered is incorrect.",
      LocaleKeys.decryptionFailed: "Decryption Failed",

      LocaleKeys.decryptActivity: "File Decryption",
      LocaleKeys.decryptActivityDesc: "File %s was successfully decrypted.",

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
      // File Detail
      LocaleKeys.fileDetail: "File Detail",

      LocaleKeys.fileInformation: "File Information",

      LocaleKeys.originalName: "Original Name",
      LocaleKeys.encryptedName: "Encrypted Name",
      LocaleKeys.fileSize: "Size",
      LocaleKeys.extension: "Extension",
      LocaleKeys.status: "Status",
      LocaleKeys.lockedAt: "Locked At",
      LocaleKeys.openedAt: "Last Opened",

      LocaleKeys.fileLocked: "File Locked",
      LocaleKeys.fileUnlocked: "File Unlocked",

      LocaleKeys.fileLockedDesc:
          "The document has been successfully secured using encryption.",

      LocaleKeys.fileUnlockedDesc:
          "The document has been successfully decrypted.",

      LocaleKeys.share: "Share",
      LocaleKeys.download: "Download",

      LocaleKeys.deleteFile: "Delete File",
      LocaleKeys.deleteFileConfirmation:
          "Are you sure you want to delete this file?",
      LocaleKeys.deleting: "Deleting...",

      LocaleKeys.dataNotFound: "Data Not Found",
      LocaleKeys.dataNotFoundDesc: "Please add file data first.",

      // Profil
      LocaleKeys.myProfile: "My Profile",
      LocaleKeys.active: "Active",
      LocaleKeys.account: "Account",
      LocaleKeys.personalInformation: "Personal Information",
      LocaleKeys.manageAccount:
          "Manage account information and application settings",
      LocaleKeys.personalInformationDesc: "Manage your profile information",
      LocaleKeys.accountSecurity: "Account Security",
      LocaleKeys.accountSecurityDesc: "Manage password and account security",
      LocaleKeys.preference: "Preferences",
      LocaleKeys.themeDesc: "Set light, dark, or follow system appearance",
      LocaleKeys.languageDesc: "Choose the language used in the application",
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
      LocaleKeys.followSystemDesc: "Follow the device light/dark appearance.",
      LocaleKeys.lightTheme: "Light Theme",
      LocaleKeys.lightThemeDesc: "Always use light mode.",
      LocaleKeys.darkTheme: "Dark Theme",
      LocaleKeys.darkThemeDesc: "Always use dark mode.",
      LocaleKeys.userDataDetails: "User Data Details",
      LocaleKeys.age: "Age",
      LocaleKeys.gender: "Gender",
      LocaleKeys.genderHint: "Not filled in yet",

      // Informasi Pribadi:
      // Enum Jenis Kelamin
      LocaleKeys.genderMale: "Male",
      LocaleKeys.genderFemale: "Female",
      LocaleKeys.genderNotFilled: "Not filled",

      // Field Informasi Pribadi
      LocaleKeys.enterFullNameDesc: "Enter your full name.",
      LocaleKeys.usernameDialogDesc: "Your username is used for login.",
      LocaleKeys.emailDialogDesc: "Enter your active email address.",

      LocaleKeys.ageDialogDesc: "Enter your age.",
      LocaleKeys.ageHint: "Example: 25",
      LocaleKeys.ageRequired: "Age is required.",
      LocaleKeys.ageMustBeNumber: "Age must be a number.",
      LocaleKeys.ageInvalid: "Invalid age.",

      LocaleKeys.genderDialogDesc: "Select your gender.",

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

      LocaleKeys.oldPasswordRequired: "Current password is required.",

      LocaleKeys.newPasswordRequired: "New password is required.",

      LocaleKeys.confirmNewPasswordRequired:
          "Password confirmation is required.",

      LocaleKeys.newPasswordSameAsOld:
          "New password cannot be the same as the old password.",

      LocaleKeys.oldPasswordIncorrect: "Current password is incorrect.",

      LocaleKeys.passwordChangedSuccess:
          "Password has been updated successfully.",

      LocaleKeys.sessionNotFound: "User session not found.",

      LocaleKeys.accountNotFound: "Account not found.",

      LocaleKeys.passwordMinCharacter: "Minimum 8 characters.",

      // Pesan Kesalahan
      // Keluar
      LocaleKeys.logoutTitle: "Sign out of your account?",
      LocaleKeys.logoutSubtitle:
          "You will be signed out of your current session and need to sign in again to use the application.",
      LocaleKeys.logoutConfirm: "Sign Out",

      // Hapus Akun
      LocaleKeys.deleteAccountTitle: "Delete Account",
      LocaleKeys.deleteAccountWarning: "This action cannot be undone.",
      LocaleKeys.deleteAccountType: "Type",
      LocaleKeys.deleteAccountConfirmation: "delete my account",
      LocaleKeys.deleteAccountPlaceholder: "delete my account",
      LocaleKeys.confirmDelete: "Delete",

      // Internet Connection
      LocaleKeys.noInternetConnection: "No Internet Connection",
      LocaleKeys.noInternetConnectionDesc:
          "This application requires an internet connection to function. Please enable your internet connection and try again.",
      LocaleKeys.understood: "Yes, I Understand!",

      // Snackbar
      LocaleKeys.anError: "An error occurred",
      LocaleKeys.anErrorDesc: "Processing Failed. Please Try Again!",

      // List
      LocaleKeys.failed: "Failed",
    },
  };
}
