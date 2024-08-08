// ignore: unused_import
import 'package:final_app/core/OrderHistory/orderhistory_cubit.dart';
import 'package:final_app/core/home/home_cubit.dart';
import 'package:final_app/models/colors/defaultcolor.dart';
import 'package:final_app/screens/historyscreen/history.dart';
import 'package:final_app/screens/personalscreen/profilemanagment.dart';
import 'package:final_app/screens/product_detailes/details.dart';
import 'package:final_app/screens/shoppingcart/shoppingcart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final search = TextEditingController();
  final List<String> _dropdownItems = [
    'New York, USA',
    'EGY',
    'UEA',
    'SUA',
    'CHINA',
    'INDIA'
  ];

  final List<String> images = [
    "assets/images/07448a03-306c-41ce-b301-7a7000a810f2-cover (1).png",
    "assets/images/Frame 4.png",
    "assets/images/Giulia.png",
    "assets/images/Packaging.png"
  ];

  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = _dropdownItems[0];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getdata(),
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: Column(
            children: [
            const  SizedBox(height: 20),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.network(
                      'https://th.bing.com/th/id/OIP.q7sfHQeSL7b6B5YehBQa1gHaEv?rs=1&pid=ImgDetMain',
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
             const SizedBox(height: 10),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>const ProfileScreen()));
                  },
                  child:const Text(
                    "Leo Messi",
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ),
              ),
            const  SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => OrderHistoy()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 243, 243, 243),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child:const ListTile(
                    title: Text(
                      "Order History",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const Text(
                  "Location",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
             const   SizedBox(height: 8),
                Row(
                  children: [
                   const Icon(
                      Icons.location_on,
                      color: primarycolor,
                      size: 25,
                    ),
                  const  SizedBox(width: 8),
                    Expanded(
                      child: DropdownButton<String>(
                        value: _selectedItem,
                        icon:const Icon(Icons.keyboard_arrow_down),
                        iconSize: 40,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black, fontSize: 20),
                        isExpanded: true,
                        items: _dropdownItems
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _selectedItem = value;
                          });
                        },
                      ),
                    ),
                  const  SizedBox(width: 8),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding:const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(800),
                          color:const Color.fromARGB(255, 238, 236, 236),
                        ),
                        child:const Icon(
                          Icons.notifications,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
               const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: search,
                        onTap: () {
                          showSearch(
                            context: context,
                            delegate: SearchDelegateExample(),
                          );
                        },
                        decoration: InputDecoration(
                          hintText: "Search",
                          suffixIcon:const Icon(Icons.search, color: primarycolor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          filled: true,
                          fillColor:const Color.fromARGB(255, 245, 245, 245),
                        ),
                      ),
                    ),
                   const SizedBox(width: 15),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartPage()));
                      },
                      child: Container(
                        padding:const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: primarycolor,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child:const Icon(
                          Icons.shopping_bag_outlined,
                          size: 39,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
               const SizedBox(height: 20),
                Container(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        margin:const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              const  SizedBox(height: 8),
              const  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("See All")
                  ],
                ),
               const SizedBox(height: 8),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is Homeloading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HomeSuccess) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics:const NeverScrollableScrollPhysics(),
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: state.userlist.length,
                        itemBuilder: (context, index) {
                          final user = state.userlist[index];
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailScreen(product: user)));
                            },
                            child: Container(
                              padding:const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color:const Color.fromARGB(255, 246, 245, 244),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        user.image,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                               const   SizedBox(height: 8),
                                  Text(user.title,
                                      style:const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                 const SizedBox(height: 5),
                                  Text("\$${user.price.toString()}",
                                      style: const TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is HomeError) {
                      return Center(
                        child: Text(
                          state.errormsg,
                          style:const TextStyle(color: Colors.red),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchDelegateExample extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon:const Icon(Icons.cancel),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon:const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text("Search results for: ${query}"));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text("Suggestions for: $query"));
  }
}
