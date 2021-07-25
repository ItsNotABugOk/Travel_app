import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: unused_import
import 'package:travel_app/firebase/navigate.dart';
import 'package:image_picker/image_picker.dart';

class AddNewDestination extends StatefulWidget {
  const AddNewDestination({Key? key}) : super(key: key);

  @override
  _AddNewDestinationState createState() => _AddNewDestinationState();
}

class _AddNewDestinationState extends State<AddNewDestination> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: width - width * 0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(30),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                        color: Colors.red,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 10)
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/images/mountainMan.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            FontAwesomeIcons.sortAmountDown,
                            color: Colors.black,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'City Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    // ignore: prefer_const_literals_to_create_immutables
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(
                          FontAwesomeIcons.locationArrow,
                          color: Colors.white70,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'location',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Positioned(
                right: 20,
                bottom: 35,
                child: Icon(
                  FontAwesomeIcons.map,
                  color: Colors.white,
                  size: 25,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(40.0, 1, 20, 7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: EdgeInsets.only(left: width * 0.2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ignore: sized_box_for_whitespace
                                  Container(
                                    width: width * .5,
                                    child: const Text(
                                      'Activity of Name',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Text(
                                    'Sub Name',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const Text('Ratings'),
                                  Container(
                                    height: 25,
                                    child: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const Text('Price')
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      bottom: 10,
                      left: 20,
                      right: width * 0.7,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/santorini.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
