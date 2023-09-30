import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebViewScreen extends StatefulWidget {
  @override
  _MyWebViewScreenState createState() => _MyWebViewScreenState();
}

class _MyWebViewScreenState extends State<MyWebViewScreen> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://fittex.io/jeevan/HomeLogin.aspx'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Use back button icon
          onPressed: () async {
            if (controller != null) {
              if (await controller.canGoBack()) {
                controller.goBack(); // Go back in web view history
              } else {
                // No web view history, navigate back to HomeScreen
                Navigator.pop(context);
              }
            }
          },
        ),
        actions: <Widget>[
          // Add a menu icon to the right corner of the AppBar
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Center(
                child: Text(
                  'FIT ONE BOX',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Masters'),
              onTap: () {
                controller.loadRequest(Uri.parse(
                    'https://fittex.io/jeevan/00/Main/Master_MDIFORM.aspx?t=iAx+nZUbnlcYClzyIsQ0ZA==&MenuType=m&g=g'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setup'),
              onTap: () {
                controller.loadRequest(Uri.parse('https://your-setup-url.com'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.widgets),
              title: Text('MIS'),
              onTap: () {
                controller.loadRequest(Uri.parse('https://your-mis-url.com'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
