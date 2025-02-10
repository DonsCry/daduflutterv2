import 'package:flutter/material.dart';
import 'package:roll_dice_teach/dice_roller.dart';

// Konstanta untuk posisi awal dan akhir gradient
const startAlignment = Alignment.topLeft; // Posisi awal gradient di pojok kiri atas
const endAlignment = Alignment.bottomRight; // Posisi akhir gradient di pojok kanan bawah

// Kelas GradientContainer untuk membuat container dengan gradient
class GradientContainer extends StatelessWidget {
  // Konstruktor untuk membuat objek GradientContainer
  const GradientContainer(this.color1, this.color2, {super.key});

  // Variabel untuk warna pertama dan kedua gradient
  final Color color1; // Warna pertama gradient
  final Color color2; // Warna kedua gradient

  @override
  // Fungsi untuk membuat widget
  Widget build(context) {
    // Membuat container dengan gradient
    return Container(
      // Dekorasi untuk container 
      decoration: BoxDecoration(
        // Membuat gradient
        gradient: LinearGradient(
          // Daftar warna untuk gradient
          colors: [color1, color2],
          // Posisi awal gradient
          begin: startAlignment,
          // Posisi akhir gradient
          end: endAlignment,
        ),
      ),
      // Anak widget dari container
      child: Center(
        // Membuat widget DiceRoller di tengah-tengah container
        child: DiceRoller(),
      ),
    );
  }
}