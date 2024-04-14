import 'package:flutter/material.dart';

class BalancoContabilPage extends StatefulWidget {
  const BalancoContabilPage({Key? key}) : super(key: key);

  @override
  State<BalancoContabilPage> createState() => _BalancoContabilPageState();
}

class _BalancoContabilPageState extends State<BalancoContabilPage> {
  late int _selectedTabIndex;
  late List<Widget> _tabContents;

  @override
  void initState() {
    super.initState();
    _selectedTabIndex = 0;
    _tabContents = [
      Center(child: Text('Conteúdo da Tab 1')),
      Center(child: Text('Conteúdo da Tab 2')),
      Center(child: Text('Conteúdo da Tab 3')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabContents.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Balanço Contábil'),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor ??
              const Color.fromRGBO(33, 150, 243, 1),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(
                child: Text(
                  'Língua\nPortuguesa',
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(text: 'Tab 3'),
            ],
            onTap: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
            indicatorColor: const Color.fromARGB(255, 77, 77, 77),
            unselectedLabelColor: const Color.fromARGB(255, 222, 222, 222),
            labelColor: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        body: TabBarView(
          children: _tabContents,
        ),
      ),
    );
  }
}
