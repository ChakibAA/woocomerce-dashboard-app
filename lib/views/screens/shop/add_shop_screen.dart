import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:woocomerceadmin/blocs/shop_bloc/shop_bloc.dart';
import 'package:woocomerceadmin/model/shop.dart';
import 'package:woocomerceadmin/utils/validator.dart';

class AddShopScreen extends StatelessWidget {
  AddShopScreen({super.key});
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _shopURLController = TextEditingController();
  final TextEditingController _shopSecretKeyController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter une boutique"),
      ),
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 223, 222, 222)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 8.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _shopNameController,
                        validator: AppValidator.validateEmpty,
                        decoration: const InputDecoration(
                          labelText: 'Nom de la boutique',
                          prefixIcon: Icon(Icons.store),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _shopURLController,
                        keyboardType: TextInputType.url,
                        validator: AppValidator.validateUrl,
                        decoration: const InputDecoration(
                          labelText: 'URL de la boutique',
                          prefixIcon: Icon(Icons.link),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _shopSecretKeyController,
                        obscureText: true,
                        validator: AppValidator.validatePassword,
                        decoration: const InputDecoration(
                          labelText: 'Clé secrete de la boutique',
                          prefixIcon: Icon(Icons.vpn_key),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Shop shop = Shop(
                                name: _shopNameController.text,
                                url: _shopURLController.text,
                                key: _shopSecretKeyController.text);
                            context.read<ShopBloc>().add(AddShop(shop));
                            context.pop();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Ajouter',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
