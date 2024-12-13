

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../models/product.dart';
import '../screens/update_product_screen.dart';

class ProductItem extends StatelessWidget {
  ProductItem({super.key,required this.product});

  final Product product;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        //'https://t3.ftcdn.net/jpg/06/12/00/18/360_F_612001823_TkzT0xmIgagoDCyQ0yuJYEGu8j6VNVYT.jpg',
        product.image ?? '',

        width: 50,
        height: 50,
      ),

      title: Text(
        product.productName ?? 'Unkonwn',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${product.productCode ?? 'Unkonwn'}'),
          Text('Product Quantity: ${product.quantity ?? 'Unkonwn'}'),
          Text('Price: ${product.unitPrice ?? 'Unkonwn'}'),
          Text('Total Price: ${product.totalPrice ?? 'Unkonwn'}'),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              )
            ),
            child: IconButton(
              onPressed: () {
                _deleteItem(product.id ?? '');
              },
              icon: Icon(Icons.delete),
              style: IconButton.styleFrom(
                foregroundColor: Colors.white
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  topRight: Radius.circular(5),
                )
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, UpdateProductScreen.name,arguments: product,);
              },
              icon: Icon(Icons.edit_square),
              style: IconButton.styleFrom(
                  foregroundColor: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteItem(String id) async{
    Uri uri=Uri.parse('https://crud.teamrabbil.com/api/v1/DeleteProduct/${id}');
    Response response= await get(uri);
    print(response.statusCode);
    if(response.statusCode==200){
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product has been updated'),),);
    }
    else
    {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Successfully Deleted')));
    }
  }
}