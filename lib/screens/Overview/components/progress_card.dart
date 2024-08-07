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

    if (budgetExists(widget.data)) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
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
              !_isExpanded ?
                  ProgressBar(progress: progress, color:  widget.color,)
              :
                _buildExpandedProgressBars(widget.data)
            ],
          ),
        ),
      );
    } else {
      return const SizedBox(height: 0);
    }
  }

  Widget _buildExpandedProgressBars (List<Map<String,dynamic>> data) {
    double progress = 0;

    return Column(
        children: data.map((item) {
          if(item["planeado"] > 0){
            progress = item["real"]/item["planeado"];
            return Padding(
            padding: item == data[data.length - 1] ? EdgeInsets.only(bottom: 0) : EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(item["nombre_categoria"].toString(), style: TextStyle(fontSize: 16,),),
                ),
                const SizedBox(height: 4,),
                ProgressBar(progress: progress, color:  widget.color,)
              ],
            ),
          );
          } else {
            return SizedBox(height: 0,);
          }
        }).toList()
    );
  }

  double calculateProgress(List<Map<String,dynamic>> data) {
    int total = 0;
    int progress = 0;
    int real = 0;
    int planeado = 0;
    double x = 0;

    for(int i = 0; i < data.length; i++){
      Map<String, dynamic>item = data[i];
      real = item["real"];
      progress += real;
      planeado = item["planeado"];
      total += planeado;
    }

    if(progress > 0){
      x = progress/total;
    }else x = 0;

    return x >= 1 ? 1 : x;
  }

  bool budgetExists(List<Map<String,dynamic>> data) {
    int planeado = 0;

    for(int i = 0; i < data.length; i++){
      Map<String, dynamic>item = data[i];
      planeado = item["planeado"];
    }

    return planeado > 0 ? true : false;
  }
}