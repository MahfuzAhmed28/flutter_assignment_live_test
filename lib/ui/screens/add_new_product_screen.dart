import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  static const String name='/add-new-product';
  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreeState();
}

class _AddNewProductScreeState extends State<AddNewProductScreen> {
  final TextEditingController _nameTEController= TextEditingController();
  final TextEditingController _priceTEController= TextEditingController();
  final TextEditingController _totalPriceTEController= TextEditingController();
  final TextEditingController _imageTEController= TextEditingController();
  final TextEditingController _quantityTEController= TextEditingController();
  final TextEditingController _codeTEController= TextEditingController();

  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  bool _addNewProductInProgress=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Product'),
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
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.black,
            ),
            cursorColor: Colors.black54,
            decoration: InputDecoration(
              hintText: 'Price',
              hintStyle: TextStyle(
                color: Colors.black54,
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
            controller: _quantityTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
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
            controller: _totalPriceTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.black,
            ),
            cursorColor: Colors.black54,
            decoration: InputDecoration(
              hintText: 'Total Price',
              hintStyle: TextStyle(
                color: Colors.black,
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
          SizedBox(height: 9,),
          TextFormField(
            controller: _imageTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: Colors.black54,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: 'Url',
              hintStyle: TextStyle(
                color: Colors.black54,
              ),
              labelText: 'Image Url',
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
                return 'Enter Image Url';
              }
              return null;
            },
          ),
          SizedBox(height: 20,),
          Visibility(
            visible: _addNewProductInProgress==false,
            replacement: Center(
              child: CircularProgressIndicator(),
            ),
            child: ElevatedButton(
                onPressed: ()
                {
                  if(_formKey.currentState!.validate()){
                    _addNewProduct();
                  }
                },
                child: Text('Add Product'),
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

  Future<void> _addNewProduct() async{
    _addNewProductInProgress=true;
    setState(() {});
    Uri uri=Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');

    Map<String,dynamic> requestBody={
      "Img":_imageTEController.text.trim(),
      "ProductCode":_codeTEController.text.trim(),
      "ProductName":_nameTEController.text.trim(),
      "Qty":_quantityTEController.text.trim(),
      "TotalPrice":_totalPriceTEController.text.trim(),
      "UnitPrice":_priceTEController.text.trim(),

    };

    Response response=await post(
      uri,
      headers: {
        'Content-type':'application/json'
      },
      body: jsonEncode(requestBody),
    );
    print(response.statusCode);
    print(response.body);
    _addNewProductInProgress=false;
    setState(() {});
    if(response.statusCode==200){
      _clearTextFields();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('New product added')));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('New product added failded. Try again')));
    }
  }

  void _clearTextFields(){
    _codeTEController.clear();
    _nameTEController.clear();
    _priceTEController.clear();
    _quantityTEController.clear();
    _totalPriceTEController.clear();
    _imageTEController.clear();
  }

  @override
  void dispose(){
    _codeTEController.dispose();
    _nameTEController.dispose();
    _priceTEController.dispose();
    _quantityTEController.dispose();
    _totalPriceTEController.dispose();
    _imageTEController.dispose();
    super.dispose();
  }
}
