import 'package:flutter/material.dart';
import 'package:myapp/screens/Overview/overview_page.dart';
import 'package:myapp/screens/IngresarMovimientos/ingresar_movimientos_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _title = "";

  bool showPercentages = true;

  /* 
  Aquí van las páginas. Estan puestas todos como overview pq salia error si estan vacias.
  Las cambian mis causas. :)
   */
  Widget _buildBody() {
    switch(_selectedIndex) {
      case 0: 
        _title = "Resumen";
        return overviewPage(showPercentages: showPercentages,);
      case 1:
        _title = "Categorías";
        return overviewPage(showPercentages: showPercentages,);
      case 2:
        _title = "Ingresar Movimiento";
        return ingresar_movimientos_page();
      case 3:
        _title = "Historial";
        return overviewPage(showPercentages: showPercentages,);
      case 4:
        _title = "Perfil";
        return overviewPage(showPercentages: showPercentages,);
      default:
        _title = "Resumen";
        return overviewPage(showPercentages: showPercentages,);
    }
  }

  void _onItemTapped (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _title = "Resumen";
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
          icon: Icon(Icons.add_circle, size: 72,color: Color.fromARGB(255, 0, 20, 60),),
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
      title: Text(_title,
        style: const TextStyle(fontWeight: FontWeight.bold,),
      ),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.percent),
          selectedIcon: Icon(Icons.attach_money),
          onPressed: _toggleView,
        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar( 
      title: Text(_title,
        style: const TextStyle(fontWeight: FontWeight.bold,),
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {_onItemTapped(0);},
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
        child: SingleChildScrollView(
          child:  _buildBody()
        ),
      ),
      bottomNavigationBar: _bottomNavigation(),
    );
  }
}