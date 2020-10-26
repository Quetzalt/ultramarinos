import 'package:flutter/material.dart';
import 'package:ultramarinos/src/bloc/proveedorBloc.dart';

class Dropdown extends StatefulWidget {
  Dropdown({Key key}) : super(key: key);

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  //* Dropdown Configuration
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  List<String> _proveedorList = <String>[];
  ProveedorBloc provBloc = new ProveedorBloc();

  String _currentProv;

  _cargarProv() async {
    provBloc.obtenerProv();
    final cargarProv = await provBloc.obtenerProv();
    cargarProv.toList();

    setState(() {});

    for (var i = 0; i < 100; i++) {
      _proveedorList[i] = cargarProv;
    }
  }

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentProv = _dropDownMenuItems[0].value;
    super.initState();

    _cargarProv();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String providers in _proveedorList) {
      items.add(new DropdownMenuItem(
        value: providers,
        child: new Text(providers),
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.accessibility),
        SizedBox(width: 15),
        Text('Proveedor', style: TextStyle(fontSize: 20)),
        SizedBox(width: 10),
        DropdownButton(
          value: _currentProv,
          items: _dropDownMenuItems,
          onChanged: changedDropDownItem,
        ),
      ],
    );
  }

  void changedDropDownItem(String selectedProvider) {
    setState(() {
      _currentProv = selectedProvider;
    });
  }
}
