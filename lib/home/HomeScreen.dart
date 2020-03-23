import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home screen'),
      ),
      body: new Center(
        child: new FutureBuilder<List<User>>(
          future: fetchUsersFromGitHub(),
          builder: (context, snapshot) {

            if (snapshot.hasData) {
              return new ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 0.0)),
                          new Text('User Name : ' +  snapshot.data[index].name),
                          new Text('type : ' + snapshot.data[index].type),
                          new Divider()
                        ]
                    );
                  }
              );
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }

            // By default, show a loading spinner
            return new CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<List<User>> fetchUsersFromGitHub() async {
    final response = await http.get('https://api.github.com/users');
    print(response.body);
    List responseJson = json.decode(response.body.toString());
    List<User> userList = createUserList(responseJson);
    return userList;
  }

  List<User> createUserList(List data){
    List<User> list = new List();
    for (int i = 0; i < data.length; i++) {
      String title = data[i]["login"];
      String  type = data[i]["type"];
      User user = new User(
          name: title,type: type);
      list.add(user);
    }
    return list;
  }

}

class User {
  String name;
  String type;
  User({this.name,this.type});
}