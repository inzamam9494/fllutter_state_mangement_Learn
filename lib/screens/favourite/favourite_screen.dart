import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/favourite_provider.dart';
import 'package:state_management/screens/favourite/favourite_screen_item.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteItem =
        Provider.of<FavouriteProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange[300],
        title: const Text(
          "Favourite",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FavouriteScreenItem())),
              icon: const Icon(
                Icons.favorite_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text("Item $index"),
                      trailing: Icon(
                          value.selectItem.contains(index)
                              ? Icons.favorite
                              : Icons.favorite_outline_rounded,
                          color: Colors.red),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
