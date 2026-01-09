import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/product_list_screen.dart';
import '../screens/add_product_screen.dart';
import '../services/auth_services.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService auth = AuthService();

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      backgroundColor: Colors.blue.shade50,
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'E-Commerce App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          _drawerItem(
            icon: Icons.home_rounded,
            text: "Home",
            iconColor: Colors.orange,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            },
          ),

          _drawerItem(
            icon: Icons.list_alt_rounded,
            text: "Product List",
            iconColor: Colors.green,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProductListScreen()),
              );
            },
          ),

          _drawerItem(
            icon: Icons.add_circle_outline,
            text: "Add Product",
            iconColor: Colors.blue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddProductScreen()),
              );
            },
          ),

          const Spacer(),

          _drawerItem(
            icon: Icons.logout_rounded,
            text: "Logout",
            iconColor: Colors.red,
            textColor: Colors.red,
            onTap: () async {
              await auth.logout();
              Navigator.pop(context);
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  static Widget _drawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color iconColor = Colors.blue,
    Color textColor = Colors.black87,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Material(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: iconColor, size: 20),
                ),
                const SizedBox(width: 14),
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




















// import 'package:flutter/material.dart';
// import '../screens/home_screen.dart';
// import '../screens/product_list_screen.dart';
// import '../screens/add_product_screen.dart';
// import '../services/auth_services.dart';

// class AppDrawer extends StatelessWidget {
//   const AppDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final AuthService auth = AuthService();

//     return Drawer(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(30),
//           bottomRight: Radius.circular(30),
//         ),
//       ),
//       child: Container(
//         color: Colors.white,
//         child: Column(
//           children: [
//             // Drawer Header
//             DrawerHeader(
//               margin: EdgeInsets.zero,
//               padding: EdgeInsets.zero,
//               child: Container(
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.blue, Colors.lightBlueAccent],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 padding: const EdgeInsets.all(20),
//                 alignment: Alignment.bottomLeft,
//                 child: const Text(
//                   'E-Commerce App',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),

//             // Menu Items
//             Expanded(
//               child: ListView(
//                 padding: EdgeInsets.zero,
//                 children: [
//                   _buildDrawerItem(
//                     icon: Icons.home_outlined,
//                     text: "Home",
//                     onTap: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (_) => const HomeScreen()),
//                       );
//                     },
//                   ),
//                   _buildDrawerItem(
//                     icon: Icons.list_alt_outlined,
//                     text: "Product List",
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (_) => const ProductListScreen()),
//                       );
//                     },
//                   ),
//                   _buildDrawerItem(
//                     icon: Icons.add_box_outlined,
//                     text: "Add Product",
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (_) => const AddProductScreen()),
//                       );
//                     },
//                   ),
//                   const Divider(thickness: 1),
//                   _buildDrawerItem(
//                     icon: Icons.logout,
//                     text: "Logout",
//                     textColor: Colors.red,
//                     iconColor: Colors.red,
//                     onTap: () async {
//                       await auth.logout();
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDrawerItem({
//     required IconData icon,
//     required String text,
//     Color textColor = Colors.black87,
//     Color iconColor = Colors.black54,
//     required VoidCallback onTap,
//   }) {
//     return ListTile(
//       leading: Icon(icon, color: iconColor),
//       title: Text(
//         text,
//         style: TextStyle(
//           color: textColor,
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       hoverColor: Colors.blue.withOpacity(0.1),
//       onTap: onTap,
//       contentPadding: const EdgeInsets.symmetric(horizontal: 20),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//     );
//   }
// }
