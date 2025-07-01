import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  String searchQuery = '';
  String selectedFilter = 'All';

  final List<String> filters = [ 'All', '#Hashtag', 'People', 'title'];

  final List<String> trending = [
    '#flutter',
    '#mikronote',
    'Emily Davis',
    'Dalby Airport',
    'Productivity Tips',
    'AlexMartinez',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Search bar
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 16),

            // Filter chips
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  final isSelected = selectedFilter == filter;
                  return ChoiceChip(
                    label: Text(filter),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    selectedColor: Colors.red[300],
                    backgroundColor: Colors.grey[200],
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Trending
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Trending 🔥",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                itemCount: trending.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.trending_up, color: Colors.red[400]),
                    title: Text(trending[index]),
                    onTap: () {
                      setState(() {
                        searchQuery = trending[index];
                      });
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
