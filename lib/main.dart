import 'package:flutter/material.dart';

void main() => runApp(const AppEdad());

class AppEdad extends StatelessWidget {
  const AppEdad({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Edad',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF335C67),
        ),
      ),

      home: const PantallaEdad(),
    );
  }
}

class PantallaEdad extends StatefulWidget {
  const PantallaEdad({super.key});

  @override
  State<PantallaEdad> createState() => _PantallaEdadState();
}

class _PantallaEdadState extends State<PantallaEdad> {
  final TextEditingController _controller = TextEditingController();

  int? _edad;
  String? _error;

  void _calcular() {
    final texto = _controller.text.trim();
    final anio = int.tryParse(texto);
    final anioActual = DateTime.now().year;

    setState(() {
      if (anio == null) {
        _error = 'Ingresa un año válido';
        _edad = null;
      } else if (anio < 1900 || anio > anioActual) {
        _error = 'El año debe estar entre 1900 y $anioActual';
        _edad = null;
      } else {
        _error = null;
        _edad = anioActual - anio;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const fondo = Color(0xFF335C67);
    const crema = Color(0xFFF2E8CF);

    return Scaffold(
      backgroundColor: fondo,

      appBar: AppBar(
        backgroundColor: fondo,
        elevation: 0,
        centerTitle: true,

        title: const Text(
          'Calculadora de Edad',
          style: TextStyle(
            color: crema,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Icon(
              Icons.cake_outlined,
              size: 90,
              color: crema,
            ),

            const SizedBox(height: 20),

            const Text(
              'Descubre tu edad',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: crema,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Ingresa tu año de nacimiento',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 35),

            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              maxLength: 4,

              style: const TextStyle(
                color: crema,
              ),

              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF26444D),

                counterStyle: const TextStyle(
                  color: Colors.white70,
                ),

                labelText: 'Año de nacimiento',

                labelStyle: const TextStyle(
                  color: crema,
                ),

                errorText: _error,

                prefixIcon: const Icon(
                  Icons.calendar_month,
                  color: crema,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),

                  borderSide: const BorderSide(
                    color: crema,
                    width: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: FilledButton.icon(
                onPressed: _calcular,

                style: FilledButton.styleFrom(
                  backgroundColor: crema,
                  foregroundColor: fondo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),

                icon: const Icon(Icons.calculate),

                label: const Text(
                  'Calcular edad',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 35),

            if (_edad != null)
              Card(
                color: const Color(0xFF26444D),
                elevation: 10,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(24),

                  child: Column(
                    children: [
                      const Icon(
                        Icons.celebration,
                        size: 55,
                        color: crema,
                      ),

                      const SizedBox(height: 15),

                      Text(
                        'Tu edad es de $_edad años',
                        textAlign: TextAlign.center,

                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: crema,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}