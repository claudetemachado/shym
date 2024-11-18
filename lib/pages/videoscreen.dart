import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class VideoScreen extends StatefulWidget {
  final String videoUrl;

  const VideoScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // Inicializar o WebViewController com suporte para Android e iOS.
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      final creationParams = WebKitWebViewControllerCreationParams();
      _controller = WebViewController.fromPlatformCreationParams(creationParams);
    } else if (WebViewPlatform.instance is AndroidWebViewPlatform) {
      final creationParams = AndroidWebViewControllerCreationParams();
      _controller = WebViewController.fromPlatformCreationParams(creationParams);
    } else {
      _controller = WebViewController();
    }

    // Configurar o WebViewController
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.videoUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Voltar para a tela anterior
          },
        ),
        title: const Text('Tanto faz - Urias', 
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'LexendGiga',
          fontSize: 16)),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
