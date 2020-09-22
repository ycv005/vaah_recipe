import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FliterPage extends StatefulWidget {
  static const routeName = "/filter";
  final Function saveFilter;
  final Map filters;
  const FliterPage(this.saveFilter, this.filters);
  @override
  _FliterPageState createState() => _FliterPageState();
}

class _FliterPageState extends State<FliterPage> {
  @override
  void initState() {
    newFilter = widget.filters;
    super.initState();
  }

  Map newFilter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Page"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Adjust your meal selection",
              style: TextStyle(fontSize: 26),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text("Gluten-Free"),
                  onChanged: (bool value) => setState(() {
                    newFilter["gluten"] = value;
                  }),
                  value: newFilter["gluten"],
                  subtitle: Text("Enable to see gluten-free meals"),
                ),
                SwitchListTile(
                  title: Text("Vegatarian"),
                  onChanged: (bool value) => setState(() {
                    newFilter["vegtarian"] = value;
                  }),
                  value: newFilter["vegtarian"],
                  subtitle: Text("Enable to see vegatarian meals"),
                ),
                SwitchListTile(
                  title: Text("Lactose-Free"),
                  onChanged: (bool value) => setState(() {
                    newFilter["lactose"] = value;
                  }),
                  subtitle: Text("Enable to see lactose free meal"),
                  value: newFilter["lactose"],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          FlatButton(
            child: Text("Save"),
            onPressed: () {
              widget.saveFilter(newFilter);
            },
          )
        ],
      ),
    );
  }
}
