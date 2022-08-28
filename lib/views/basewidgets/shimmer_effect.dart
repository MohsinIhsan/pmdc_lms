import 'package:flutter/material.dart';

class ShimmerEffect extends StatelessWidget {
  bool isDashboard;
  ShimmerEffect({
    Key? key,
    this.isDashboard = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        isDashboard
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 160,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 15,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.04),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 15,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.04),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 15,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.04),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5))),
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.05),
                            radius: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox(
                height: 0,
              ),
        ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(5),
          itemCount: 15,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.04),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
            ),
          ),
        ),
      ],
    );
  }
}
