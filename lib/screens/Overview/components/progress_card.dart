import 'package:flutter/material.dart';
import 'package:myapp/screens/Overview/components/progress_bar.dart';

class ProgressCard extends StatefulWidget {
  final String type;
  final Color color;
  final List<Map<String, dynamic>> data;

  const ProgressCard({
    Key? key,
    required this.type,
    required this.color,
    required this.data,
  }) : super(key: key);

  @override
  _ProgressCardState createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double progress = calculateProgress(widget.data);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16,4,16,16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.type, style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  }, 
                  icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more))
              ],
            ),
            !_isExpanded ? ProgressBar(progress: progress, color:  widget.color,) :  _buildExpandedProgressBars(widget.data)
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedProgressBars (List<Map<String,dynamic>> data) {
    return Column(
        children: data.map((item) {
          double progress = item["real"]/item["planeado"];
          return Padding(
            padding: item == data[data.length - 1] ? EdgeInsets.only(bottom: 0) : EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(item["col1"].toString(), style: TextStyle(fontSize: 16,),),
                ),
                SizedBox(height: 4,),
                ProgressBar(progress: progress, color:  widget.color,)
              ],
            ),
          );
        }).toList(),
    );
  }

  double calculateProgress(List<Map<String,dynamic>> data) {
    int total = 0;
    int progress = 0;
    int real;
    int planeado;

    for(int i = 0; i < data.length; i++){
      Map<String, dynamic>item = data[i];
      real = item["real"];
      progress += real;
      planeado = item["planeado"];
      total += planeado;
    }

    double x = progress/total;

    return x >= 1 ? 1 : x;
  }
}