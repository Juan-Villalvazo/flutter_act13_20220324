import 'package:flutter/material.dart';
import 'package:flutter_act13_20220324/model/movie_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();

}
  
class _SearchPageState extends State<SearchPage> {

  static List<MovieModel> main_movies_list = [
    MovieModel ("Phineas and Ferb - The movie", 2020, 
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDe_PzwkGdzJfsgCbKNT_hciEXyVAZrdE-gTB7D-33cQ&s", 7.2),
    MovieModel ("Grow Ups 2", 2013,
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT28NtS1JZ3Ye3Q0btAjyRxopX33tBZSZ0vUdU9criXrg&s", 9.4),
    MovieModel ("Fast and Furious 8", 2017,
    "https://m.media-amazon.com/images/I/81nEFN2HHuL._AC_UF894,1000_QL80_.jpg", 8.2),
    MovieModel ("Gravity Falls", 2012,
    "https://image.tmdb.org/t/p/original/pLOWuYnhozZnXMpnCyT0aNfBMGa.jpg", 9.8),
    MovieModel ("Scary Movie 3", 2003,
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTdwWQXfpGVLJ7n6k3_i8wukwMqqni8IaO4crBPaDkrQ&s", 8.9),
    MovieModel ("Sex Education", 2019,
    "https://m.media-amazon.com/images/M/MV5BNjJkYTI1MjAtNTcxZC00YmU5LWExMDAtZTg3YzRhMDNmYmEwXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_FMjpg_UX1000_.jpg", 10.0),
    MovieModel ("Spongebob Squarepants - The movie", 2004,
    "https://static.wikia.nocookie.net/doblaje/images/3/3f/Bob_Esponja_La_Pelicula.jpg/revision/latest?cb=20200724212420&path-prefix=es", 9.7),
    MovieModel ("El infierno", 2010,
    "https://m.media-amazon.com/images/I/919Q47+yySL._AC_UF894,1000_QL80_.jpg", 10),
    MovieModel ("Salvando al soldado Pérez", 2011,
    "https://m.media-amazon.com/images/S/pv-target-images/e9c2b54f91511c948d15c70a813abef2e211cb3e5eab364771b66b299ba83059.jpg", 9.6),
    MovieModel ("Los indestructubles 3", 2014,
    "https://es.web.img3.acsta.net/pictures/14/07/22/13/18/155845.jpg", 8.5),
  ];

  List<MovieModel> display_list = List.from(main_movies_list);

  void updateList(String value) {

    setState(() {
      display_list = main_movies_list
      .where((element) => element.movie_titlle!.toLowerCase().contains(value.toLowerCase())).toList()
      .toList();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: Color(0xFF1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a movie", 
              style: TextStyle(
                color: Colors.white, 
                fontSize: 22, 
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none
                ),
                hintText: "eg: The Dark Knight",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.purple.shade900,
              ),
            ),
            SizedBox(
              height: 20
            ),
            
            Expanded(
              child: display_list.length == 0 
              ?Center(child: Text(
                "Now result found", 
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 22, 
                  fontWeight: FontWeight.bold
                  )
                ))

              :ListView.builder(
                itemCount: display_list.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text(
                    display_list[index].movie_titlle!, 
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${display_list[index].movie_release_year!}',
                    style: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  trailing: Text(
                    "${display_list[index].rating}",
                    style: TextStyle(color: Colors.amber),
                  ),
                  leading: Image.network(display_list[index].movie_poster_url!),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}