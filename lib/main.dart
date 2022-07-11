import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TabBar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MyHomePage(),
    );
  }
}

/// Pages
enum TypeOfBodyContent {
  home,
  about,
  contact,
  blog,
  portfolio,
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<MyHomePageProvider>(
        create: (context) => MyHomePageProvider(),
        child: Consumer<MyHomePageProvider>(
          builder: (context, provider, child) => Container(
            padding: const EdgeInsets.all(40.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(195, 20, 50, 1.0),
                  Color.fromRGBO(36, 11, 54, 1.0),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Ganesh Panwar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        provider.setActiveButton(TypeOfBodyContent.home);
                      },
                      child: const Text(
                        "Home",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {
                        provider.setActiveButton(TypeOfBodyContent.blog);
                      },
                      child: const Text(
                        "Blog",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {
                        provider.setActiveButton(TypeOfBodyContent.portfolio);
                      },
                      child: const Text(
                        "Portfolio",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {
                        provider.setActiveButton(TypeOfBodyContent.about);
                      },
                      child: const Text(
                        "About Us",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {
                        provider.setActiveButton(TypeOfBodyContent.contact);
                      },
                      child: const Text(
                        "Contact Us",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  flex: 5,
                  child: BodyWidget(
                    activeButton: provider.currentActiveButton,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Provider
class MyHomePageProvider with ChangeNotifier {
  TypeOfBodyContent currentActiveButton = TypeOfBodyContent.home;

  setActiveButton(TypeOfBodyContent setThisActiveButton) {
    currentActiveButton = setThisActiveButton;

    notifyListeners();
  }
}

/// Body Contents Class
class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key, required this.activeButton}) : super(key: key);

  final TypeOfBodyContent activeButton;

  @override
  Widget build(BuildContext context) {
    if (activeButton == TypeOfBodyContent.home) {
      // if active button is home
      return const HomeView();
    } else if (activeButton == TypeOfBodyContent.about) {
      return const AboutView();
    } else if (activeButton == TypeOfBodyContent.portfolio) {
      return const PortfolioView();
    } else if (activeButton == TypeOfBodyContent.blog) {
      return const BlogView();
    } else {
      return const ContactView();
    }
  }
}

///  Pages

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Home View",
      ),
    );
  }
}

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "About View",
      ),
    );
  }
}

class BlogView extends StatelessWidget {
  const BlogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Blog View",
      ),
    );
  }
}

class PortfolioView extends StatelessWidget {
  const PortfolioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Portfolio View",
      ),
    );
  }
}

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Contact View",
      ),
    );
  }
}
