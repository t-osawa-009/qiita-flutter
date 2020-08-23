import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qiita/views/home/home_view_model.dart';
import 'package:qiita/model/Article.dart';
import 'package:qiita/views/article/ArticleDetail_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: HomePageBody(),
      ),
    );
  }
}

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    // todo: ここに処理を書く
    var viewModel = Provider.of<HomeViewModel>(context, listen: true);
    viewModel.fetchArticle();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(context, listen: true);
    return content(context, model);
  }

  Widget content(BuildContext context, HomeViewModel viewModel) {
    if (viewModel.articles.isEmpty) {
      return Center(child: Text("No Items"));
    }

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final article = viewModel.articles[index];
        return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(article.user.iconUrl),
            ),
            title: Text(article.title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ArticleDetailPage(article: article)),
              );
            });
      },
      itemCount: viewModel.articles.length,
    );
  }
}
