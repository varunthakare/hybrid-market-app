import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  int quantity1 = 0;
  int quantity2 = 0;
  int quantity3 = 0; // New variable for the third field
  String selectedSize = 'Small'; // Default size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo Image
              Image.asset('lib/images/logo.png', height: 50, width: 50),
              
              SizedBox(height: 10),
              // Hybrid Market Text
              Text(
                'HYBRID MARKET',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              
              SizedBox(height: 20),
              // Product Description Text
              Text(
                'Product Description',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              
              SizedBox(height: 20),
              // Product Name Input Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              
              SizedBox(height: 20),
              // Product Size Dropdown
              DropdownButtonFormField<String>(
                value: selectedSize,
                decoration: InputDecoration(
                  labelText: 'Product Size',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                items: ['Small', 'Medium', 'Large'].map((String size) {
                  return DropdownMenuItem<String>(
                    value: size,
                    child: Text(size),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSize = value!;
                  });
                },
              ),
              
              SizedBox(height: 20),
              // Increment and Decrement Field 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIncrementDecrementField('Field 1', quantity1, (newQuantity) {
                    setState(() {
                      quantity1 = newQuantity;
                    });
                  }),
                  
                  _buildIncrementDecrementField('Field 2', quantity2, (newQuantity) {
                    setState(() {
                      quantity2 = newQuantity;
                    });
                  }),
                ],
              ),
              
              SizedBox(height: 20),
              // Increment and Decrement Field 3 (Using quantity3 now)
              _buildIncrementDecrementField('Field 3', quantity3, (newQuantity) {
                setState(() {
                  quantity3 = newQuantity;
                });
              }),
              
              SizedBox(height: 20),
              // Upload Product Image Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Upload Product Image',
                  prefixIcon: Icon(Icons.image, color: Colors.green),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              
              SizedBox(height: 20),
              // Upload Product Video Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Upload Product Video',
                  prefixIcon: Icon(Icons.videocam, color: Colors.green),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              
              SizedBox(height: 30),
              // Add Product Button
              ElevatedButton(
                onPressed: () {
                  // Add product functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Green background
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Add Product',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Increment/Decrement Field Widget
  Widget _buildIncrementDecrementField(String label, int quantity, Function(int) onQuantityChanged) {
    return Row(
      children: [
        Text(label),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            if (quantity > 0) onQuantityChanged(quantity - 1);
          },
        ),
        Text('$quantity'),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            onQuantityChanged(quantity + 1);
          },
        ),
      ],
    );
  }
}
