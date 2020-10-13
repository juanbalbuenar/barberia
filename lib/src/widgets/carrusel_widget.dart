part of 'widgets.dart';


Widget carrusel(AssetImage img1, AssetImage img2 , AssetImage img3, AssetImage img4, AssetImage img5, AssetImage img6, AssetImage img7, ) {
  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0,right: 15.0),
                          child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: img1,
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: img2,
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: img3,
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: img4,
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: img5,
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: img6,
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 15.0),
                          child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: img7,
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                      ),
                      ],
                    ),
                  );
}