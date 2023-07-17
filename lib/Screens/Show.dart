import 'package:flutter/material.dart';

import '../Api/Service.dart';
import '../Models/User.dart';

class ShowPage extends StatefulWidget {
  int? id;

  ShowPage({super.key, required this.id});

  @override
  State<ShowPage> createState() => _ShowPageState(id: id);
}

class _ShowPageState extends State<ShowPage> {
  late int? id;
  final FetchUserList _userList = FetchUserList();
  late UserList? user = UserList(
      username: "",
      phone: "",
      name: "",
      website: "",
      company: Company(name: "", catchPhrase: "", bs: ""),
      email: "",
      id: 0,
      address: Address(
          street: "",
          suite: "",
          city: "",
          geo: Geo(lat: "", lng: ""),
          zipcode: ""));

  _ShowPageState({int? id});

  @override
  void initState() {
    id = widget.id;
    theUser(userId: id);
    super.initState();
  }

  void theUser({int? userId}) async {
    _userList.getUser(user_id: id.toString()).then((resultat) {
      setState(() => user = resultat);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('UserShow'),
            ),
            body: Container(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Text(
                  '${user?.username}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '${user?.name}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '${user?.website}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '${user?.email}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '${user?.phone}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '${user?.company?.name}',
                  style: TextStyle(fontSize: 18),
                ),
              ]),
            )));
  }
}
