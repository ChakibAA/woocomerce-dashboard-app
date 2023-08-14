// ignore_for_file: must_be_immutable, constant_pattern_never_matches_value_type

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:woocomerceadmin/utils/routes/app_routes.dart';

import '../../../blocs/shop_bloc/shop_bloc.dart';
import '../../widgets/custom_progress_indicator.dart';
import 'widgets/shop_button.dart';

class ShopListScreen extends StatelessWidget {
  const ShopListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            label: const Text("Ajouter une boutique"),
            onPressed: () {
              context.goNamed(AppRoutes.addShop);
            }),
        appBar: AppBar(
          title: const Text("C dashboard for woocomerce"),
          automaticallyImplyLeading: false,
        ),
        body: const ListShopView());
  }
}

class ListShopView extends StatefulWidget {
  const ListShopView({
    Key? key,
  }) : super(key: key);

  @override
  State<ListShopView> createState() => _ListShopViewState();
}

class _ListShopViewState extends State<ListShopView> {
  late ShopBloc shopBloc;

  @override
  void initState() {
    super.initState();

    shopBloc = context.read<ShopBloc>()..add(FetchShop());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopBloc, ShopState>(
      bloc: shopBloc,
      listener: (context, state) {
        if (state is ShopError) {
          context.goNamed(AppRoutes.errorScreen);
        }
      },
      builder: (context, state) {
        if (state is ShopLoading) {
          return const CustomProgressIndicator();
        } else if (state is ShopLoaded) {
          return Padding(
              padding: const EdgeInsets.all(12),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ShopButton(
                      shop: state.data[index],
                      index: index + 1,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 12,
                    );
                  },
                  itemCount: state.data.length));
        } else {
          return Container();
        }
      },
    );
  }
}
