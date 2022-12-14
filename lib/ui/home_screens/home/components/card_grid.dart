import 'package:flutter/material.dart';
import 'package:rental_car_app/data/remote/responses/car_model.dart';
import 'package:rental_car_app/ui/design/app_colors.dart';
import 'package:rental_car_app/ui/design/card_shadow.dart';

class CardGrid extends StatelessWidget {
  final CarModel _car;
  const CardGrid(this._car, {super.key});

  @override
  Widget build(BuildContext context) {
    return CardShadow(
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.28,
                          child: Image.network(
                            _car.url,
                          )),
                    ],
                  ),
                ),
                Text(
                  _car.model,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: const [
                    Icon(Icons.star, color: Colors.orange, size: 18),
                    SizedBox(width: 1),
                    Icon(Icons.star, color: Colors.orange, size: 18),
                    SizedBox(width: 1),
                    Icon(Icons.star, color: Colors.orange, size: 18),
                    SizedBox(width: 1),
                    Icon(Icons.star, color: Colors.orange, size: 18),
                    SizedBox(width: 1),
                    Icon(Icons.star, color: Colors.orange, size: 18),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      '5 Seater',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(
                              text: r'$220', style: TextStyle(color: AppColors.green, fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: '/day',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Align(alignment: Alignment.topRight, child: HeartIcon(_car.model))
          ],
        ));
  }
}

class HeartIcon extends StatefulWidget {
  final String _carName;
  const HeartIcon(this._carName, {super.key});

  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  bool isEnable = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(isEnable ? Icons.favorite : Icons.favorite_border, color: isEnable ? AppColors.green : null),
      onTap: () {
        setState(() => isEnable = !isEnable);

        final message = isEnable ? 'Added to Favorites.' : 'Removed from favorites.';

        final snackBar = SnackBar(
          content: Text('${widget._carName} $message'),
          backgroundColor: Colors.green,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
