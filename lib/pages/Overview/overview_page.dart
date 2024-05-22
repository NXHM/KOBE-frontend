import 'package:flutter/material.dart';

class overviewPage extends StatefulWidget {
  final int? showPercentages;

  overviewPage({this.showPercentages});

  @override
  _overviewPageState createState() => _overviewPageState();
}

class _overviewPageState extends State<overviewPage> {
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Text("Counter ${widget.showPercentages ?? 0}")
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: showValues,
            child: Text('Mostrar datos'),
          ),
        ),
      ],
    );
  }

  void showValues () {
    print("Valor del contador: ${widget.showPercentages} \n");
  }

  Widget _buildPercentagesView() {
    return Text(
        'Vista de Porcentajes',
    );
  }

  Widget _buildRealNumbersView() {
    return Text(
        'Vista de Números Reales',
    );
  }
}
