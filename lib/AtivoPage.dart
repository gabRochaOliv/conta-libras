import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AtivoPage extends StatefulWidget {
  const AtivoPage({Key? key}) : super(key: key);

  @override
  State<AtivoPage> createState() => _AtivoPageState();
}

class _AtivoPageState extends State<AtivoPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Widget> _tabContents;

  VideoPlayerController? _videoController;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _tabContents = [
      _buildVideoPlayerTab(), // Aqui você insere o widget do vídeo na aba 'Sinal'
      Center(child: Text('Conteúdo da Tab 2')),
      Center(child: Text('Conteúdo da Tab 3')),
    ];

    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    _videoController = VideoPlayerController.asset(
      'assets/bemvindo.mp4',
    );

    _initializeVideoPlayerFuture = _videoController?.initialize();
    _initializeVideoPlayerFuture?.whenComplete(() {
      if (mounted) {
        setState(() {}); // Atualiza o estado após a inicialização do vídeo
        _videoController
            ?.play(); // Inicia a reprodução do vídeo após a inicialização
        _videoController?.setLooping(true); // Define a reprodução em loop
      }
    });
  }

  Widget _buildVideoPlayerTab() {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: AspectRatio(
              aspectRatio: _videoController?.value.aspectRatio ?? 16 / 9,
              child: VideoPlayer(_videoController ??
                  VideoPlayerController.asset(
                      '')), // fallback video player if _videoController is null
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void _handleTabSelection() {
    setState(() {
      // Atualiza o índice da aba selecionada
      _selectedTabIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  int _selectedTabIndex = 0; // Índice da aba selecionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ativo'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor ??
            const Color.fromRGBO(33, 150, 243, 1),
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
                labelStyle: TextStyle(
                  fontSize: 18,
                ),
                labelPadding: EdgeInsets.symmetric(
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
