import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assignment_live_test/models/product.dart';
import 'package:http/http.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.product,});

  static const String name='/update-product';

  final Product product;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreen();
}

class _UpdateProductScreen extends State<UpdateProductScreen> {
  final TextEditingController _nameTEController= TextEditingController();
  final TextEditingController _priceTEController= TextEditingController();
  final TextEditingController _totalPriceTEController= TextEditingController();
  final TextEditingController _imageTEController= TextEditingController();
  final TextEditingController _quantityTEController= TextEditingController();
  final TextEditingController _codeTEController= TextEditingController();

  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  bool _updateProductInProgress=false;

  @override
  void initState()
  {
    super.initState();
    _nameTEController.text=widget.product.productName ?? '';
    _priceTEController.text=widget.product.unitPrice ?? '';
    _totalPriceTEController.text=widget.product.totalPrice ?? '';
    _quantityTEController.text=widget.product.quantity ?? '';
    _codeTEController.text=widget.product.productCode ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: _buildProductForm(),
        ),
      ),
    );
  }

  Widget _buildProductForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: Colors.black54,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: 'Name',
              hintStyle: TextStyle(
                color: Colors.black54,
              ),
              labelText: 'Product Name',
              labelStyle: TextStyle(
                  color: Colors.green
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.green,
                  )
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter Product Name';
              }
              return null;
            },
          ),
          SizedBox(height: 8,),
          TextFormField(
            controller: _priceTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: Colors.black54,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: 'Price',
              hintStyle: TextStyle(
                color:Colors.black54,
              ),
              labelText: 'Product Price',
              labelStyle: TextStyle(
                  color: Colors.green
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.green,
                  )
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter Product Price';
              }
              return null;
            },
          ),
          SizedBox(height: 8,),
          TextFormField(
            controller: _totalPriceTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: Colors.black54,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: 'Total Price',
              hintStyle: TextStyle(
                color: Colors.black54,
              ),
              labelText: 'Product Total Price',
              labelStyle: TextStyle(
                  color: Colors.green
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.green,
                  )
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter Product Total Price';
              }
              return null;
            },
          ),
          SizedBox(height: 8,),
          TextFormField(
            controller: _quantityTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: Colors.black54,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: 'Quantity',
              hintStyle: TextStyle(
                color: Colors.black54,
              ),
              labelText: 'Product Quantity',
              labelStyle: TextStyle(
                  color: Colors.green
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.green,
                  )
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter Product Quantity';
              }
              return null;
            },
          ),
          SizedBox(height: 8,),
          TextFormField(
            controller: _codeTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: Colors.black54,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: 'Code',
              hintStyle: TextStyle(
                color: Colors.black54,
              ),
              labelText: 'Product Code',
              labelStyle: TextStyle(
                  color: Colors.green
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.green,
                  )
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter Product Code';
              }
              return null;
            },
          ),
          //TextFormField(),
          SizedBox(height: 20,),
          Visibility(
            visible: _updateProductInProgress==false,
            replacement: Center(
              child: CircularProgressIndicator(),
            ),
            child: ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    _updateProduct();
                  }

                },
                child: Text('Update Product'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10,)

              ),
            ),
          )
        ],
      ),
    );
  }
  Future<void> _updateProduct() async{
    _updateProductInProgress=true;
    setState(() {});
    Uri uri=Uri.parse('https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.product.id}');

    Map<String,dynamic> requestBody={
      //"Img":"",
      "ProductCode":_codeTEController.text.trim(),
      "ProductName":_nameTEController.text.trim(),
      "Qty":_quantityTEController.text.trim(),
      "TotalPrice":_totalPriceTEController.text.trim(),
      "UnitPrice":_priceTEController.text.trim(),
    };

    Response response= await post(
        uri,
        headers: {
          'Content-type':'application/json',
        },
        body: jsonEncode(requestBody));
    print(response.statusCode);
    print(response.body);
    _updateProductInProgress=false;
    setState(() {});
    if(response.statusCode==200){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product has been updated'),),);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product updated failed! Try again.'),),);
    }
  }

  @override
  void dispose(){
    _codeTEController.dispose();
    _nameTEController.dispose();
    _priceTEController.dispose();
    _quantityTEController.dispose();
    _totalPriceTEController.dispose();
    super.dispose();
  }
}
