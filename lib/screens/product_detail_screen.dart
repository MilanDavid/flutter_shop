import 'package:flutter/material.dart';
import 'package:shop_app/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;

  // ProductDetailScreen(this.title);

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(loadedProduct.title),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(loadedProduct.title),
              background: Hero(
                tag: loadedProduct.id,
                child: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10.0),
              Text(
                '\$${loadedProduct.price}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  loadedProduct.description,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
