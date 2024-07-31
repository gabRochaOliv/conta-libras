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
  late VideoPlayerController _videoController;

  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _videoController = VideoPlayerController.asset(
      'aplicacao-financeira.mp4',
    );

    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    await _videoController.initialize();
    setState(() {}); // Atualiza o estado após a inicialização do vídeo
    await _videoController
        .play(); // Inicia a reprodução do vídeo após a inicialização
    await _videoController.setLooping(true); // Define a reprodução em loop
  }

  Widget _buildVideoPlayerTab() {
    if (_videoController.value.isInitialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: _videoController.value.aspectRatio,
          child: VideoPlayer(_videoController),
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }

  void _handleTabSelection() {
    setState(() {
      _selectedTabIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabContents = [
      _buildVideoPlayerTab(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'CONCEITO: É uma demonstração contábil destinada a '
              'evidenciar, qualitativa e quantitativamente, numa determinada '
              'data, a posição patrimonial e financeira da entidade. O Balanço '
              'é composto por contas do Ativo, Passivo e Patrimônio Líquido '
              'da empresa.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'EXEMPLO: '
              'O contador registra todas as movimentações patrimoniais '
              'da empresa (bens, direitos e obrigações) e as classifica em seus '
              'respectivos grupos de contas.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Língua Brasileira de Sinais',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset(
            'assets/sinal-balanco.png',
            height: 200,
            width: 400,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Representação Visual',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset(
            'assets/tabela-balanco.png',
            height: 200,
            width: 400,
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicação Financeira'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor ??
            const Color.fromRGBO(33, 150, 243, 1),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            color: const Color.fromARGB(255, 244, 243, 243),
            child: Center(
              child: TabBar(
                controller: _tabController,
                isScrollable: false,
                tabs: [
                  Tab(
                    child: Text(
                      'Sinal',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Língua\nPortuguesa',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Visual',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                labelStyle: const TextStyle(
                  fontSize: 18,
                ),
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
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
