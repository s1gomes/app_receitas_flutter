import 'package:flutter/material.dart';
import 'package:proj_receitas_udemy/models/meals.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.onToggleFavorite, required this.isFavorite});
  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorite;

  _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child:
          Text(title, style: Theme.of(context).textTheme.titleSmall),
    );
  }

  _createSectionContainer(Widget child) {
    return Container(
        width: 300,
        height: 250,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: child);
  }

  Widget _returnImageMiojo(Widget) {
    return Container(
        height: 300,
        child: Image.asset(
          "assets/images/miojo-gourmet.webp",
          fit: BoxFit.cover,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          
          children: <Widget>[
            Container(
                height: 300,
                child: Image.network(meal.imageUrl, fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                  return Container(
                      height: 300,
                      child: Image.asset(
                        "assets/images/miojo-gourmet.webp",
                        fit: BoxFit.cover,
                      ));
                })),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).cardColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(meal.ingredients[index]),
                      ),
                    );
                  }),
            ),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                    const Divider(),
                      ],
                    );
                }
                )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        onToggleFavorite(meal);
      },
      child: Icon(isFavorite(meal) ? Icons.star: Icons.star_border),
      ),
    );
  }
}
