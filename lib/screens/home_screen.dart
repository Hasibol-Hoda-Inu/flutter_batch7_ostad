import 'package:favorite_aplication_with_provider/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('building');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen', style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Consumer<FavoriteProvider>(builder: (context, value, child)=>Expanded(
              child: ListView.separated(
                itemBuilder: (context, index)=> ListTile(
                  title: Text('Favorite ${index.toString()}'),
                  trailing: Icon(
                      value.selectedItem.contains(index) ? Icons.favorite : Icons.favorite_border),
                  onTap: (){
                    value.addIndex(index);
                  },
                  onLongPress: (){
                    value.removeIndex(index);
                  },
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 20,
              )
          )),
        ],
      ),
    );
  }
}
