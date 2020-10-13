part of 'widgets.dart';

 Widget rowCortes(AssetImage img, AssetImage img2, AssetImage img3) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          image: DecorationImage(
                            image: img,
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          image: DecorationImage(
                            image: img2,
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          image: DecorationImage(
                            image: img3,
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                    ],
                  );
  }