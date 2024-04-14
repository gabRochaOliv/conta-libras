import 'package:flutter/material.dart';

class AplicacaoFinanceiraPage extends StatefulWidget {
  const AplicacaoFinanceiraPage({Key? key}) : super(key: key);

  @override
  State<AplicacaoFinanceiraPage> createState() =>
      _AplicacaoFinanceiraPageState();
}

class _AplicacaoFinanceiraPageState extends State<AplicacaoFinanceiraPage> {
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
          title: const Text('Aplicação Financeira'),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor ??
              const Color.fromRGBO(33, 150, 243, 1),
          actions: [
            IconButton(
              icon: const Icon(Icons.star),
              onPressed: () {
                // lógica para lidar com a ação do botão de estrela
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Sinal'),
              Tab(
                child: Text(
                  'Língua\nPortuguesa',
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(text: 'Visual'),
            ],
            onTap: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
            indicatorSize: TabBarIndicatorSize
                .label, // Exibe o indicador do tamanho do rótulo
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold, // Define o peso da fonte
              fontSize: 17, // Define o tamanho da fonte
            ),
            indicatorColor: Color.fromARGB(
                255, 77, 77, 77), // Cor de fundo quando selecionado
            unselectedLabelColor: Color.fromARGB(255, 222, 222, 222),
            labelColor: Color.fromARGB(
                255, 255, 255, 255), // Cor do texto não selecionado
          ),
        ),
        body: TabBarView(
          children: _tabContents,
        ),
      ),
    );
  }
}
