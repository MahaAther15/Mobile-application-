import 'package:flutter/material.dart';

void main() {
  runApp(const SMTApp());
}

class SMTApp extends StatelessWidget {
  const SMTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SMT Cuisine',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.grey.shade100,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const OrderScreen(),
    );
  }
}

// ================= ORDER SCREEN =================

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final TextEditingController nameController = TextEditingController();

  String? discountError;
  String selectedSize = "Medium";

  final List<String> pizzaSizes = [
    "Small",
    "Medium",
    "Large",
    "Party Size"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SMT Cuisine"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "🍕 Place Your Order",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // ===== CARD UI =====
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // ✅ Task 1: TextField
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: "Customer Name",
                        hintText: "Enter customer name",
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ✅ Task 2: TextFormField + Validation
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Discount Code",
                        prefixIcon: const Icon(Icons.discount),
                        errorText: discountError,
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (value.contains(' ')) {
                            discountError = "Don't use blank spaces";
                          } else {
                            discountError = null;
                          }
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    // ✅ Task 3: Dropdown
                    InputDecorator(
                      decoration: const InputDecoration(
                        labelText: "Pizza Size",
                        prefixIcon: Icon(Icons.local_pizza),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedSize,
                          isExpanded: true,
                          items: pizzaSizes.map((size) {
                            return DropdownMenuItem(
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
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ✅ Task 4: Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmationScreen(
                        name: nameController.text,
                        size: selectedSize,
                      ),
                    ),
                  );

                  if (result == true && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("✅ Order Confirmed Successfully!"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
                child: const Text(
                  "Submit Order",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= CONFIRMATION SCREEN =================

class ConfirmationScreen extends StatelessWidget {
  final String name;
  final String size;

  const ConfirmationScreen({
    super.key,
    required this.name,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Summary"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Summary Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Customer Name"),
                    subtitle: Text(name.isEmpty ? "Not provided" : name),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.local_pizza),
                    title: const Text("Pizza Size"),
                    subtitle: Text(size),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Confirm Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text("Confirm Order"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}