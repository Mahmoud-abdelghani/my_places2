import 'package:flutter/material.dart';
import 'package:my_places/core/screen_size.dart';
import 'package:my_places/core/sqlite_helper.dart';
import 'package:my_places/models/place_model.dart';
import 'package:my_places/screens/add_screen.dart';
import 'package:my_places/screens/details_screen.dart';
import 'package:my_places/widgets/category_containder.dart';
import 'package:my_places/widgets/custom_data_card.dart';
import 'package:my_places/widgets/cutom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [
    'All',
    'resturant',
    'Travel',
    'cafe',
    'hotel',
    'Other',
  ];
  int selectedCategoryIndex = 0;
  List<PlaceModel> places = [];

  Future<void> _fetchPlaces() async {
    places = await SqliteHelper.getPlaces();
    setState(() {});
  }

  @override
  void initState() {
    _fetchPlaces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    ScreenSize.init(context);
    List<PlaceModel> filteredPlaces = selectedCategoryIndex != 0
        ? places
              .where(
                (element) =>
                    element.category == categories[selectedCategoryIndex],
              )
              .toList()
        : places;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
          await _fetchPlaces();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Color(0xff14B8A6),
        child: Icon(Icons.add, color: Colors.white),
      ),
      backgroundColor: Color(0xff0F172A),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(bottom: ScreenSize.height * 0.02),
              padding: EdgeInsets.symmetric(
                vertical: ScreenSize.height * 0.01,
                horizontal: ScreenSize.width * 0.05,
              ),
              width: ScreenSize.width,
              decoration: BoxDecoration(
                color: Color(0xff1E293B),
                border: Border(bottom: BorderSide(color: Color(0xff334155))),
              ),
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.height * 0.03),
                  Row(
                    children: [
                      Text(
                        'My Places',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenSize.height * 0.03,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings_outlined,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.light_mode_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search places...',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                left: ScreenSize.width * 0.02,
                right: ScreenSize.width * 0.02,
              ),
              child: SizedBox(
                width: ScreenSize.width,
                height: ScreenSize.height * 0.06,
                child: ListView.separated(
                  itemBuilder: (context, index) => CategoryContainder(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                    },
                    isPressed: selectedCategoryIndex == index,
                    txt: categories[index],
                  ),
                  separatorBuilder: (context, index) =>
                      SizedBox(width: ScreenSize.width * 0.035),
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: ScreenSize.height * 0.03)),
          filteredPlaces.isEmpty
              ? SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.width * 0.03,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: ScreenSize.height * 0.15),
                        CircleAvatar(
                          radius: ScreenSize.height * 0.08,
                          backgroundImage: AssetImage('assets/Container.png'),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(height: ScreenSize.height * 0.015),
                        Text(
                          'No places saved yet',
                          style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: ScreenSize.height * 0.025,
                          ),
                        ),
                        SizedBox(height: ScreenSize.height * 0.015),
                        Text(
                          'Save photos, notes, and locations of your favorite spots.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: ScreenSize.height * 0.02,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: ScreenSize.height * 0.015),
                        CutomButton(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddScreen(),
                              ),
                            );
                            await _fetchPlaces();
                          },
                          txt: 'Add your first place',
                        ),
                      ],
                    ),
                  ),
                )
              : SliverList.separated(
                  itemBuilder: (context, index) => CustomDataCard(
                    title: filteredPlaces[index].title,
                    description: filteredPlaces[index].description,
                    imagePath: filteredPlaces[index].imagePath,
                    latitude: filteredPlaces[index].latitude,
                    longitude: filteredPlaces[index].longitude,
                    category: filteredPlaces[index].category,
                    date: filteredPlaces[index].date,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(place: filteredPlaces[index]),
                        ),
                      );
                      await _fetchPlaces();
                    },
                  ),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: ScreenSize.height * 0.02),
                  itemCount: filteredPlaces.length,
                ),
        ],
      ),
    );
  }
}
