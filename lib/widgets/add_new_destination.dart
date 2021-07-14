import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: use_key_in_widget_constructors
class NewDestination extends StatefulWidget {
  @override
  _NewDestinationState createState() => _NewDestinationState();
}

class _NewDestinationState extends State<NewDestination> {
  // Text _buildRatingStars(int rating) {
  //   String stars = '';
  //   for (int i = 0; i < rating; i++) {
  //     stars += '⭐ ';
  //   }
  //   stars.trim();
  //   return Text(stars);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.width,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.topCenter,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width / 2 - 25),
                  child: const IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.add_a_photo,
                      color: Colors.red,
                      size: 50,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width - 70, left: 20),
                  child: TextFormField(
                    maxLines: 1,
                    decoration: const InputDecoration(
                      hintText: 'Search your trips',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width - 20, left: 20),
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        FontAwesomeIcons.locationArrow,
                        size: 10.0,
                        color: Colors.black,
                      ),
                      const Text(
                        '  op',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: 2,
              // itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context, int index) {
                // Activity activity = widget.destination.activities[index];
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // ignore: sized_box_for_whitespace
                                Container(
                                  width: 120.0,
                                  child: const Text(
                                    ' activity.name',
                                    // ignore: unnecessary_const
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                Column(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
                                    const Text(
                                      '\$${'activity.price'}',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Text(
                                      'per pax',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Text(
                              ' activity.type',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            // _buildRatingStars(2),
                            // _buildRatingStars(activity.rating),
                            const SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    // ignore: deprecated_member_use
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    ' activity.startTimes[0]',
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    // ignore: deprecated_member_use
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'activity.startTimes[1]',
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                      top: 15.0,
                      bottom: 15.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: const Image(
                          width: 110.0,
                          image: AssetImage(
                            'assets/images/venice.jpg',
                            // activity.imageUrl,
                          ),
                          fit: BoxFit.cover,
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
