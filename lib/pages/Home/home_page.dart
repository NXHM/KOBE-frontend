import 'package:flutter/material.dart';
import 'package:myapp/pages/Overview/overview_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _percentage = false;
  String _title = "";

  static final List<Widget> _widgetOptions = <Widget>[
    OverviewPage(),
    OverviewPage(),
    OverviewPage(),
    OverviewPage(),
    OverviewPage(),
    /* BudgetPage(),
    EnterMovementPage(),
    HistoryPage(),
    ProfilePage(), */
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch(index){
        case 0: {_title = "Resumen";}
        break;
        case 1: {_title = "Categorías";}
        break;
        case 2: {_title = "Ingresar Movimiento";}
        break;
        case 3: {_title = "Historial";}
        break;
        case 4: {_title = "Perfil";}
        break;
      }
    });
  }

  void _changePercentage(int button) {
    button == 0 ? _percentage = true : _percentage = false;
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

  @override
  void initState() {
    super.initState();
    _title = "Resumen";
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
          onPressed: () {_changePercentage(0);}
        ),
        IconButton(
          icon: const Icon(Icons.attach_money),
          onPressed: () {_changePercentage(1);}
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
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: _bottomNavigation(),
    );
  }
}