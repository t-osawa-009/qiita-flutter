import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:qiita/model/Article.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;
  ArticleDetailPage({Key key, this.article}) : super(key: key);
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebviewScaffold(
        url: article.url,
        appBar: new AppBar(
          title: new Text("Widget webview"),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  flutterWebViewPlugin.goBack();
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  flutterWebViewPlugin.goForward();
                },
              ),
              IconButton(
                icon: const Icon(Icons.autorenew),
                onPressed: () {
                  flutterWebViewPlugin.reload();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
