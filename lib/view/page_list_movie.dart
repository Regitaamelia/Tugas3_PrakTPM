import '../controller/api_data_source.dart';
import '../model/list_movie.dart';
import 'package:flutter/material.dart';
import 'page_detail_movie.dart';

class PageListMovies extends StatefulWidget {
  final String text;
  const PageListMovies({Key? key,  required this.text}) : super(key: key);
  @override
  State<PageListMovies> createState() => _PageListMoviesState();
}
class _PageListMoviesState extends State<PageListMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Movie"),
      ),
      body: _buildListUsersBody(),
    );
  }

  Widget _buildListUsersBody(){
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadListMovie(widget.text),
        builder: (BuildContext context, AsyncSnapshot<dynamic>
        snapshot) {
          if(snapshot.hasError){
            // Jika data ada error maka akan ditampilkan hasil error
            return _buildErrorSection();
          }
          if(snapshot.hasData){
            // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
            MovieList movieModel = MovieList.fromJson(snapshot.data);
            return _buildSuccessSection(movieModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(MovieList movieModel) {
    return ListView.builder(
      itemCount: movieModel.search!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemUsers(movieModel.search![index]);
      },
    );
  }

  Widget _buildItemUsers(Search movie) {
    return InkWell(
      onTap: () =>
          Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailMovies(imdbID:
              movie.imdbID!,))
      ),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Image.network(movie.poster!),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title!),
                Text(movie.year!)
              ],
            ),
          ],
        ),
      ),
    );
  }
}