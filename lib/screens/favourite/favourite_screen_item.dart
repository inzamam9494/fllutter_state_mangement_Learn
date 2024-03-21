import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class FavouriteScreenItem extends StatefulWidget {
  const FavouriteScreenItem({super.key});

  @override
  State<FavouriteScreenItem> createState() => _FavouriteScreenItemState();
}

class _FavouriteScreenItemState extends State<FavouriteScreenItem> {
  @override
  Widget build(BuildContext context) {
    final favouriteItem = Provider.of<FavouriteProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange[300],
        title: const Text(
          "Saved",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon:  const Icon(Icons.arrow_back_ios,
          color: Colors.white,),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteItem.selectItem.length,
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
