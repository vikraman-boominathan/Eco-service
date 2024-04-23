import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../hive/community.dart';

Widget buildDateAndDayCards(
    String date, String day, String formattedDate, String formattedDay) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 125,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  formattedDate.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 125,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  formattedDay.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget buildCommunityTile(BuildContext context, Community community) {
  return Card(
    child: ListTile(
      title: Text(community.name),
      trailing: Container(
        width: 175,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildButtons(context, "https://picsum.photos/seed/picsum/500/500"),
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 94, 160, 98),
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/communityMain',
                      arguments: community);
                },
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildListTile(BuildContext context, List<Community> communities) {
  print("buildListTile");
  return ListView.builder(
    itemCount: communities.length,
    itemBuilder: (context, index) {
      return buildCommunityTile(context, communities[index]);
    },
  );
}

Widget buildButtons(BuildContext context, String imgUrl) {
  return Center(
    child: Row(
      children: [
        IconButton(
          onPressed: () { 
            _launchGoogleMaps();
          },
          icon: const Icon(Icons.location_on),
        ),
        const SizedBox(width: 20),
        IconButton(
          onPressed: () {
            _showImageDialog(context, imgUrl);
          },
          icon: const Icon(Icons.image),
        ),
      ],
    ),
  );
}

void _showImageDialog(BuildContext context, String imgUrl) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
          width: 300, // Desired width
          height: 300, // Desired height
          child: Image.network(
            imgUrl, // Example placeholder image URL
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded.toDouble() /
                          loadingProgress.expectedTotalBytes!.toDouble()
                      : null,
                ),
              );
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}

 void  _launchGoogleMaps() async {
  print("Launching Google Maps");
    const double latitude = 11.987308253802535; // Example latitude
    const double longitude = 79.83323157589487; // Example longitude
    final url = Uri.parse('https://www.google.com/maps?q=$latitude,$longitude');
    print(url);
    if (await canLaunchUrl(url)) {
      print(url);
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

    
