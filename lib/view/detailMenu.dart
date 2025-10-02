import 'package:flutter/material.dart';
import '../dummy_data.dart';
import 'homepage.dart';

class Detailmenu extends StatefulWidget {
  final FoodMenu foodMenu;
  final String username;
  const Detailmenu({super.key, required this.foodMenu, required this.username});

  @override
  State<Detailmenu> createState() => _DetailmenuState();
}

class _DetailmenuState extends State<Detailmenu> {
  late String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Menu")),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.foodMenu.imageUrls[0],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.grey[500],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(widget.foodMenu.name),
          Container(
            child: Row(
              children: [
                Icon(Icons.cookie),
                Text(widget.foodMenu.category),
                SizedBox(width: 20),
                Icon(Icons.cookie),
                Text(widget.foodMenu.cookingTime),
              ],
            ),
          ),
          SizedBox(height: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text(widget.foodMenu.price)],
          ),
          SizedBox(height: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("Deskripsi"), Text(widget.foodMenu.description)],
          ),
          SizedBox(height: 5),
          Column(
            children: [Text("Bahan Bahan"), Text(widget.foodMenu.ingredients)],
          ),
          SizedBox(height: 5),
          _pesan(context),
        ],
      ),
    );
  }

  Widget _pesan(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            String text = 'Berhasil menambah pesanan';
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (_) => Homepage(text: text, username: widget.username),
              ),
            );

            SnackBar snackBar = SnackBar(content: Text(text));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        },
        child: const Text(
          'tambahkan pesanan',
          style: TextStyle(color: Color.fromARGB(255, 199, 9, 9)),
        ),
      ),
    );
  }
}
