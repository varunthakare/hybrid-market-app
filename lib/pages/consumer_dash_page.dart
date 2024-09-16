import 'package:flutter/material.dart';

class ConsumerDashPage extends StatefulWidget {
  @override
  _ConsumerDashPageState createState() => _ConsumerDashPageState();
}

class _ConsumerDashPageState extends State<ConsumerDashPage> {
  final bool hasProducts = false; // Set to true if products are available
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Light grey background for the body
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Disable the back button
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search, color: Colors.green),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear, color: Colors.red),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {}); // Update the state to refresh the UI
                          },
                        )
                      : null,
                  hintText: 'e.g. city, state',
                  contentPadding: EdgeInsets.symmetric(vertical: 10), // Reduced height
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                onChanged: (value) {
                  setState(() {}); // Refresh the UI when the text changes
                },
              ),
            ),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.local_shipping, color: Colors.black54),
              onPressed: () {
                // Delivery button functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.black54),
              onPressed: () {
                // Notification button functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.message, color: Colors.black54),
              onPressed: () {
                // Message button functionality
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.filter_list, color: Colors.black54),
                  onPressed: () {
                    // Filter button functionality
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Center(
                child: hasProducts
                    ? Text(
                        "Consumer Dashboard Content",
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      )
                    : Text(
                        "Products are not available",
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gavel),
            label: 'Bid',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
