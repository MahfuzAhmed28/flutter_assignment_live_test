

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
      //leading: Image.network('https://adminapi.applegadgetsbd.com/storage/media/large/iPhone-14-Starlight-8954.jpg'),
      title: Text(
        product.productName ?? '',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${product.productCode ?? ''}'),
          Text('Product Quantity: ${product.quantity ?? ''}'),
          Text('Price: ${product.unitPrice ?? ''}'),
          Text('Total Price: ${product.totalPrice ?? ''}'),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
            onPressed: () {
              _deleteItem(product.id ?? '');
            },
            icon: Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, UpdateProductScreen.name,arguments: product,);
            },
            icon: Icon(Icons.edit),
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