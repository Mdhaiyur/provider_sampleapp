import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_sampleapp/data/model/user.dart';

class UserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<User>? userList = Provider.of<List<User>?>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: createUsersList(userList) ,
    );
  }

  createUsersList(List<User>? users){
    if(users==null){
      return const Center(child: CircularProgressIndicator(),);
    }
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        User user=users[index];
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Text(
            user.username!,
            maxLines: 2,
            textAlign: TextAlign.start,
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold)),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 15,
        );
      },
    );
  }
}
