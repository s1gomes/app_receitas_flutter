import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proj_receitas_udemy/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, AsyncCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        label,
        style: const TextStyle(
            fontFamily: 'RoboyoCondensed',
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.amber,
              alignment: Alignment.bottomRight,
              child: Text(
                'Vamos cozinhar?',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    color: Theme.of(context).primaryColor),
              )),
          const SizedBox(height: 20),
          _createItem(Icons.restaurant, 'Refeições', () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME)),
          _createItem(Icons.settings, 'Configurações', () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS))
          
        ],
      ),
    );
  }
}
