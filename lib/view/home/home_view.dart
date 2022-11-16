
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finin_focom/const/constant.dart';
import 'package:finin_focom/model/user_model.dart';
import 'package:finin_focom/view_model/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Data',
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: const [MyPopupMenu()],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: provider.usersStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                   return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(snapshot.hasData){
                    provider.usersList = userDataFromDocument(snapshot.data!.docs);
                     return Consumer<HomeProvider>(
                      builder: (_, provider, __) => 
                        ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final user = provider.usersList[index];
                          return Container(
                            margin: const EdgeInsets.all(kedefultPadding / 2),
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kedefultPadding / 2),
                                color: Colors.teal),
                            child: Center(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 30,
                                ),
                                title: Text(
                                  user.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.amber
                                  ),
                                ),
                                subtitle: Text(
                                  user.age,
                                  style: TextStyle(
                                      color: kwhite.withOpacity(.6),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Text(
                                  user.city,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: provider.usersList.length),
                     );
                  }
                return const Text('something went wrong');
                }),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => provider.addUser()
      // ),
    );
  }
}

class MyPopupMenu extends StatelessWidget {
  const MyPopupMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<HomeProvider>();
    return PopupMenuButton<int>(
      onSelected: (item) {
        provider.sort(item);
      },
      itemBuilder: (BuildContext context) => const [
        PopupMenuItem(
          value: 0,
          child: Text('Sort By name'),
        ),
        PopupMenuItem(
          value: 1,
          child: Text('Sort By Age'),
        ),
        PopupMenuItem(
          value: 2,
          child: Text('Sort By City'),
        ),
      ],
    );
  }
}


// class MyPopupMenu extends StatelessWidget {
//   const MyPopupMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final provider = context.read<HomeProvider>();
//     return PopupMenuButton<String>(
//       onSelected: (item) {
//         provider.addToSelectedMenu(item);
//       },
//       itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//         PopupMenuItem(
//           onTap: () => provider.sortByName(),
//           value: 'Sort By name',
//           child: const Text('Sort By name'),
//         ),
//          PopupMenuItem(
//            onTap: () => provider.sortByAge(),
//           value: 'Sort By Age',
//           child: const Text('Sort By Age'),
//         ),
//          PopupMenuItem(
//            onTap: () => provider.sortByName(),
//           value: 'Sort By City',
//           child: const Text('Sort By City'),
//         ),
//       ],
//     );
//   }
// }
