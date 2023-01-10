import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Data model class
class MyDataModel with ChangeNotifier {
  List<String> _items = [];

  List<String> get items => _items;

  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }
}

class ProjectView extends StatelessWidget {
  final Widget verticalBody;
  final Widget horizontalBody;

  const ProjectView({
    super.key,
    required this.verticalBody,
    required this.horizontalBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return verticalBody;
        } else {
          return horizontalBody;
        }
      },
    );
  }
}
