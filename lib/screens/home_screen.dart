import 'package:flutter/material.dart';
import 'package:travel_app/widgets/destination_card.dart';
import 'package:travel_app/widgets/category_chip.dart';

/* ---------------- DESTINATION DATA ---------------- */

final List<Map<String, String>> destinations = [
  {
    "title": "Mount Everest",
    "location": "Nepal",
    "image": "assets/everest.jpg",
    "description":
        "Located in the heart of the Himalayas, Mount Everest is the highest mountain on Earth and one of Nepal's most iconic natural landmarks. The surrounding region within Sagarmatha National Park is famous for its dramatic landscapes, legendary trekking routes, and rich Sherpa culture. Visitors come for the views, the challenge, and the once-in-a-lifetime mountain experience.",
  },
  {
    "title": "Pokhara",
    "location": "Nepal",
    "image": "assets/pokhara.jpg",
    "description":
        "Pokhara is a beautiful lakeside city known for its laid-back atmosphere and stunning mountain scenery. Overlooking Phewa Lake with views of the Annapurna Range, it is a hub for adventure activities like trekking, paragliding, and boating, while also offering cafés, peaceful walks, and vibrant nightlife.",
  },
  {
    "title": "Rara Lake",
    "location": "Nepal",
    "image": "assets/rara.jpg",
    "description":
        "Rara Lake is Nepal's largest and one of its most pristine lakes, located inside Rara National Park in the remote northwest. Surrounded by forests and alpine hills, the lake is known for its deep blue color and quiet atmosphere, making it ideal for travelers seeking untouched natural beauty and solitude.",
  },
  {
    "title": "Lumbini",
    "location": "Nepal",
    "image": "assets/lumbini.jpg",
    "description":
        "Lumbini is one of the world's most important spiritual destinations as the birthplace of Lord Buddha. The sacred area centers around the Maya Devi Temple and is urrounded by peaceful gardens and international monasteries. It is a place for reflection, history, and cultural exploration.",
  },
  {
    "title": "Bhaktapur",
    "location": "Nepal",
    "image": "assets/bhaktapur.jpg",
    "description":
        "Bhaktapur is a historic city celebrated for its preserved medieval architecture and traditional Newari culture. Located in the Kathmandu Valley, it features beautiful squares, temples, brick streets, and local crafts. The city offers a glimpse into Nepal's past through its art, festivals, and daily life.",
  },
  {
    "title": "Pashupatinath",
    "location": "Nepal",
    "image": "assets/pashupati.jpg",
    "description": "Pashupatinath is Nepal's most sacred Hindu temple complex, situated along the Bagmati River in Kathmandu. Dedicated to Lord Shiva, Pashupatinath Temple is a major pilgrimage site where visitors can observe religious rituals, ceremonies, and festivals that have been practiced for centuries.",
  },
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Travel App"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            const SizedBox(height: 20),
            _buildCategory(),
            const SizedBox(height: 20),
            Expanded(child: _buildDestinations(context)),
          ],
        ),
      ),
    );
  }
}

/* ---------------- SEARCH BAR ---------------- */

Widget _buildSearchBar() {
  return TextField(
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.search),
      hintText: "Search destination",
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}

/* ---------------- CATEGORY LIST ---------------- */

Widget _buildCategory() {
  return CategoryChip();
}

/* ---------------- DESTINATIONS ---------------- */

Widget _buildDestinations(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return ListView.separated(
          itemCount: destinations.length,
          separatorBuilder: (_, _) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return DestinationCard(destinations[index]);
          },
        );
      } else {
        return GridView.builder(
          itemCount: destinations.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            return DestinationCard(destinations[index]);
          },
        );
      }
    },
  );
}
