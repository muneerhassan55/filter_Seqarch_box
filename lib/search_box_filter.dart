import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchBoxFilter extends StatefulWidget {
  const SearchBoxFilter({super.key});

  @override
  State<SearchBoxFilter> createState() => _SearchBoxFilterState();
}

class _SearchBoxFilterState extends State<SearchBoxFilter> {
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
    {"id": 11, "name": "Andy", "age": 29},
    {"id": 12, "name": "mom", "age": 40},
    {"id": 13, "name": "dad", "age": 5},
    {"id": 14, "name": "khN", "age": 35},
    {"id": 15, "name": "Candy", "age": 21},
    {"id": 16, "name": "Colin", "age": 55},
    {"id": 17, "name": "salman", "age": 30},
    {"id": 18, "name": "xray", "age": 14},
    {"id": 19, "name": "yko", "age": 100},
    {"id": 20, "name": "zel", "age": 32},
  ];
  List<Map<String, dynamic>> _foundUsers = [];
  List<Map<String, dynamic>> results = [];

  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
    // _runFilter('');
  }

  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      setState(() {
        results = _allUsers
            .where((user) => user["name"]
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      });

      // we use the toLowerCase() method to make it case-insensitive
    }
  }

  @override
  Widget build(BuildContext context) {
    //TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Listview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              //controller: textEditingController,
              onChanged: (value) => {_runFilter(value), print(value)},
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: results.isNotEmpty
                  ? ListView.builder(
                      itemCount: results.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(results[index]["id"]),
                        color: Color.fromARGB(255, 253, 10, 123),
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Text(
                            results[index]["id"].toString(),
                            style: const TextStyle(
                                fontSize: 24, color: Colors.white),
                          ),
                          title: Text(results[index]['name'],
                              style: TextStyle(color: Colors.white)),
                          subtitle: Text(
                              '${results[index]["age"].toString()} years old',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
