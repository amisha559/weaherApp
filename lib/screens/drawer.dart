import 'package:flutter/material.dart';

class Drawer_page extends StatefulWidget {
  const Drawer_page({Key? key}) : super(key: key);

  @override
  _Drawer_pageState createState() => _Drawer_pageState();
}

class _Drawer_pageState extends State<Drawer_page> {
  List city = [
    'Agra',
    'Ahmadabad',
    'Allahabad',
    'Amritsar',
    'Bhopal',
    'Chennai',
    'Chicago',
    'Delhi',
    'Hyderabad',
    'Jaipur',
    'Jodhpur',
    'Kanpur',
    'Karachi',
    'Kolkata',
    'Lucknow',
    'Multan',
    'Mumbai',
    'Nagpur',
    'Nashik',
    'Odessa',
    'Patna',
    'Pune',
    'Rajkot',
    'Ranchi',
    'Surat',
    'Sydney',
    'Vadodara',
    'Varanasi',
    'Yokohama',
    'Zibo',
  ];

  List Country = [
    'Afghanistan',
    'Albania',
    'Australia',
    'Bangladesh',
    'Belgium',
    'Bhutan',
    'Brazil',
    'Canada',
    'China',
    'Denmark',
    'Ethiopia',
    'France',
    'Germany',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Israel',
    'Japan',
    'Kenya',
    'Kuwait',
    'Malaysia',
    'Mexico',
    'Nepal',
    'Netherlands',
    'Pakistan',
    'Poland',
    'Portugal',
    'Russia',
    'Singapore',
    'Spain',
    'Sweden',
    'Switzerland',
    'Thailand',
    'Turkey',
    'Ukraine',
    'Zimbabwe',
  ];

  bool isExpandCity = false;
  bool isExpandCountry = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Image.network(
            'http://cdn.cnn.com/cnnnext/dam/assets/200130142829-02-famous-new-york-buildings.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 32, left: 15),
                child: Text(
                  'Choose Location',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'nunito',
                      fontSize: 40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: ExpansionPanelList(
                  expansionCallback: (i, isExpanded) {
                    isExpanded = !isExpanded;
                    setState(() {
                      isExpandCity = isExpanded;
                    });
                  },
                  animationDuration: const Duration(milliseconds: 900),
                  children: [
                    ExpansionPanel(
                      isExpanded: isExpandCity,
                      canTapOnHeader: true,
                      backgroundColor: Colors.transparent,
                      body: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: SizedBox(
                          height: 270,
                          child: ListView.separated(
                              separatorBuilder: (context, i) {
                                return const Divider(
                                  color: Colors.white70,
                                  thickness: 0.4,
                                );
                              },
                              itemCount: city.length,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                            'home_page',
                                            arguments: city[i]);
                                      },
                                      child: Text(
                                        city[i],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: 35, left: 15, right: 15),
                            child: Text(
                              'City',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              ExpansionPanelList(
                expansionCallback: (i, isExpanded) {
                  isExpanded = !isExpanded;
                  setState(() {
                    isExpandCountry = isExpanded;
                  });
                },
                animationDuration: const Duration(milliseconds: 900),
                children: [
                  ExpansionPanel(
                    isExpanded: isExpandCountry,
                    canTapOnHeader: true,
                    backgroundColor: Colors.transparent,
                    body: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 270,
                        child: ListView.separated(
                          separatorBuilder: (context, i) {
                            return const Divider(
                              color: Colors.white70,
                              thickness: 0.4,
                            );
                          },
                          itemCount: Country.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('home_page',
                                        arguments: Country[i]);
                                  },
                                  child: Text(
                                    Country[i],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 15, right: 15),
                          child: Text(
                            'Country',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
