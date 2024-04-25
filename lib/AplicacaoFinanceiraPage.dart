import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AplicacaoFinanceiraPage extends StatefulWidget {
  const AplicacaoFinanceiraPage({Key? key}) : super(key: key);

  @override
  State<AplicacaoFinanceiraPage> createState() =>
      _AplicacaoFinanceiraPageState();
}

class _AplicacaoFinanceiraPageState extends State<AplicacaoFinanceiraPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Widget> _tabContents;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _tabContents = [
      Center(child: Text('Conteúdo da Tab 1111111')),
      Center(child: Text('Conteúdo da Tab 2')),
      Center(child: Text('Conteúdo da Tab 3')),
    ];
  }

  void _handleTabSelection() {
    setState(() {
      // Atualiza o índice da aba selecionada
      _selectedTabIndex = _tabController.index;
    });
  }

  int _selectedTabIndex = 0; // Índice da aba selecionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Color.fromARGB(255, 244, 243, 243),
            child: Center(
              child: TabBar(
                controller: _tabController,
                isScrollable: false,
                tabs: [
                  Tab(
                    text: 'Sinal',
                    // child: Text(
                    //   'Sinal',
                    //   textAlign: TextAlign.center,
                    // ),
                  ),
                  Tab(
                    child: Text(
                      'Língua\nPortuguesa',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Tab(
                    text: 'Visual',
                    // child: Text(
                    //   'Visual',
                    //   textAlign: TextAlign.center,
                    // ),
                  ),
                ],
                labelStyle: TextStyle(
                  fontSize: 17, // Define o tamanho da fonte
                ),
                labelPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Color.fromARGB(255, 0, 140, 255),
                unselectedLabelColor: Color.fromRGBO(64, 64, 64, 1),
                labelColor: Color.fromRGBO(33, 150, 243, 1),
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabContents,
      ),
    );
  }
}
