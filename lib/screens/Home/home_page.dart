import 'package:flutter/material.dart';
import 'package:myapp/controllers/authController.dart';
import 'package:myapp/screens/Overview/overview_page.dart';
import 'package:myapp/screens/IngresarMovimientos/ingresar_movimientos_page.dart';
import 'package:myapp/screens/Categories/budgetCategories.dart';
import 'package:myapp/screens/Historial/historial_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _title = "Resumen";

  bool showPercentages = true;

  static const List<String> _titles = <String>[
    "Resumen",
    "Categorías",
    "Ingresar Movimiento",
    "Historial",
    "Perfil"
  ];

  /* 
  Aquí van las páginas. Estan puestas todos como overview pq salia error si estan vacias.
  Las cambian mis causas. :)
   */
  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return overviewPage(
          showPercentages: showPercentages,
        );
      case 1:
        return BudgetCategories();
      case 2:
        return BudgetCategories();
      case 3:
        return BudgetCategories();
      case 4:
        return overviewPage(
          showPercentages: showPercentages,
        );
      default:
        return overviewPage(
          showPercentages: showPercentages,
        );
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _title = _titles[index];
      _selectedIndex = index;
    });
  }

  void _toggleView() {
    setState(() {
      showPercentages = !showPercentages;
    });
  }

  Widget _bottomNavigation() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 0,
      iconSize: 30,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: "Resumen",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_list_outlined),
          activeIcon: Icon(Icons.view_list),
          label: "Presupuestos",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle,
            size: 72,
            color: Color.fromARGB(255, 0, 20, 60),
          ),
          label: "Ingresar Movimientos",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.text_snippet_outlined),
          activeIcon: Icon(Icons.text_snippet),
          label: "Historial",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_outlined),
          activeIcon: Icon(Icons.person_outline),
          label: "Perfil",
        ),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }

  PreferredSizeWidget _overviewAppBar() {
    return AppBar(
      title: Text(
        _title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 4),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[400],
            child: IconButton(
              icon: Icon(!showPercentages ? Icons.percent : Icons.attach_money),
              onPressed: _toggleView,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(
        _title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          _onItemTapped(0);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0 ? _overviewAppBar() : _buildAppBar(),
      //actions: [],
      body: Container(
        color: Color(0xFFEBEDF0),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(child: _buildBody()),
      ),
      bottomNavigationBar: _bottomNavigation(),
    );
  }
}
