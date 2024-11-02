import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light, // Forces light theme
        primaryColor: Color(0xFF128C7E), // WhatsApp green color
        scaffoldBackgroundColor: Colors.white, // White background
      ),
      home: WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set Scaffold background to white
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow for a flat look
        title: Text(
          "WhatsApp",
          style: TextStyle(
            color: Color(0xFF128C7E), // Set title text color to green
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.grey[800]), // Icon color
        actions: [
          IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Color(0xFF128C7E),
          labelColor: Color(0xFF128C7E),
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text("Camera Page")),
          ChatsPage(),
          Center(child: Text("Status Page")),
          Center(child: Text("Calls Page")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat),
        backgroundColor: Color(0xFF25D366),
      ),
    );
  }
}

class ChatsPage extends StatelessWidget {
  final List<Map<String, String>> chats = [
    {
      "name": "Mantan",
      "message": "Anda memblokir kontak ini",
      "time": "20:12"
    },
    {
      "name": "Kakak",
      "message": "Dimana ini?",
      "time": "20:41"
    },
    {
      "name": "Adik",
      "message": "Kalau begitu aku akan pulang.",
      "time": "14:24"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[700],
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text(chat["name"]!, style: TextStyle(color: Colors.black)),
          subtitle:
              Text(chat["message"]!, style: TextStyle(color: Colors.grey[800])),
          trailing:
              Text(chat["time"]!, style: TextStyle(color: Colors.grey[600])),
        );
      },
    );
  }
}
