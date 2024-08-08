void main() {
  // 1. Kumpulan data (List)
  List<Map<String, dynamic>> students = [
    {"name": "Farhan", "Pemrograman": 85, "Basis Data": 78, "Desain Web": 90},
    {"name": "Ardi", "Pemrograman": 60, "Basis Data": 65, "Desain Web": 70},
    {"name": "Ansar", "Pemrograman": 92, "Basis Data": 89, "Desain Web": 94},
    {"name": "Raihan", "Pemrograman": 75, "Basis Data": 72, "Desain Web": 80},
  ];

  // 2. Perulangan untuk iterasi data siswa
  for (var student in students) {
    String name = student["name"];
    int pemrograman = student["Pemrograman"];
    int basisData = student["Basis Data"];
    int desainWeb = student["Desain Web"];
    
    // 3. Menghitung nilai rata-rata menggunakan operator aritmatika
    double averageGrade = calculateAverage([pemrograman, basisData, desainWeb]);
    
    // 4. Percabangan untuk menentukan kelulusan
    // Siswa lulus jika nilai rata-rata >= 75 dan semua mata pelajaran tidak ada yang kurang dari 70
    String status = (averageGrade >= 75 && pemrograman >= 70 && basisData >= 70 && desainWeb >= 70)
        ? "Lulus"
        : "Tidak Lulus";
    
    // 5. Output hasil menggunakan closure
    displayResults(name, averageGrade, status);
  }
}

// Fungsi untuk menghitung nilai rata-rata
double calculateAverage(List<int> grades) {
  int total = 0;

  // Inner function untuk menjumlahkan nilai
  void addGrade(int grade) {
    total += grade;
  }

  // Perulangan untuk menambahkan setiap nilai ke total
  for (int grade in grades) {
    addGrade(grade); // Menggunakan inner function
  }

  return total / grades.length;
}

// Function parameter dan closure
void displayResults(String name, double averageGrade, String status) {
  // Function parameter yang menerima fungsi sebagai parameter
  String formatResult(String title, String value) {
    return "$title: $value";
  }

  // Closure untuk menampilkan hasil, mengakses variabel luar (name, averageGrade, status)
  void show() {
    print(formatResult("Siswa", name));
    print(formatResult("Nilai Rata-rata", averageGrade.toStringAsFixed(2)));
    print(formatResult("Status", status));
    print(""); // Newline for better readability
  }

  // Memanggil closure
  show();
}
