import 'package:flutter/material.dart';

void main() {
  runApp(ChequeApp());
}

class ChequeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Protección de Cheques',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChequeScreen(),
    );
  }
}

class ChequeScreen extends StatefulWidget {
  @override
  _ChequeScreenState createState() => _ChequeScreenState();
}

class _ChequeScreenState extends State<ChequeScreen> {
  TextEditingController montoController = TextEditingController();
  String montoProtegido = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Protección de Cheques'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingrese el monto a imprimir en el cheque:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              controller: montoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Monto',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                protegerMonto();
              },
              child: Text('Proteger Cheque'),
            ),
            SizedBox(height: 20),
            Text(
              'Monto Protegido:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              montoProtegido,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void protegerMonto() {
    String monto = montoController.text;

    if (monto.isEmpty) {
      setState(() {
        montoProtegido = 'Por favor ingrese un monto.';
      });
      return;
    }

    double montoDouble = double.tryParse(monto) ?? 0.0;

    if (montoDouble >= 1000) {
      setState(() {
        montoProtegido = monto;
      });
    } else {
      String montoFormateado = montoDouble.toStringAsFixed(2);
      String montoProtegidoStr = '********'.substring(0, 8 - montoFormateado.length) + montoFormateado;
      setState(() {
        montoProtegido = montoProtegidoStr;
      });
    }
  }
}
