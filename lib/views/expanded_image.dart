import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';


class Extended_image extends StatelessWidget {
  const Extended_image({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expanding Flex Cards',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> items = [
    
    {
      'title': 'Fresh man library',
      'subtitle': 'This is the fresh man library, located around the calssrooms and beside the engineering library',
      'image':
          'assets/images/Freshmanlibrary.jpg',
      'icon': Icons.local_library_rounded,
      'color': const Color(0xFFFC6E51),
    },
    {
      'title': 'Main Library',
      'subtitle': 'This is the main library located at the front of the gate, The biggest library in our campus',
      'image':
          '/assets/images/MainLibrary.jpg',
      'icon': Icons.local_library_rounded,
      'color': const Color(0xFFFC6E51)
    },
    {
      'title': 'Engineering Library',
      'subtitle': 'This is the Engineering library located at besides the freshman library',
      'image':
          '/assets/images/EngineeringLibrary.jpg',
      'icon': Icons.local_library_rounded,
      'color': const Color(0xFFFC6E51)
    },
    {
      'title': 'Students Clinic',
      'subtitle': 'This is the students Clinic in our campus. located infront of Students lounge',
      'image':
          '/assets/images/StudentsClinic.jpg',
      'icon': Icons.health_and_safety_rounded,
      'color': const Color(0xFFFFCE54)
    },
    {
      'title': 'Students Lounge',
      'subtitle': 'This is the students Lounge in our campus. Where students can enjoy their leisure time',
      'image':
          '/assets/images/StudentsLounge.jpg',
      'icon': Icons.local_cafe_rounded,
      'color': const Color(0xFFFFCE54)
    },
    {
      'title': 'Teachers Lounge',
      'subtitle': 'This is the Teachers Lounge in our campus.',
      'image':
          '/assets/images/TeachersLounge.jpg',
      'icon': Icons.local_cafe_rounded,
      'color': const Color(0xFFFFCE54)
    },
    {
      'title': 'Class Rooms',
      'subtitle': 'This is the class room area located around the main library',
      'image':
          '/assets/images/Classroom.jpg',
      'icon': Icons.school_rounded,
      'color': const Color(0xFFFFCE54)
    },
    {
      'title': 'Sports Field',
      'subtitle': 'This is the Sports field where different activities are carried out.',
      'image':
          '/assets/images/SportField.jpg',
      'icon': Icons.sports_soccer_rounded,
      'color': const Color(0xFFFFCE54)
    },
    {
      'title': 'Male dormitory',
      'subtitle': 'This is the Male Dormitory.',
      'image':
          '/assets/images/MaleDormitory.jpg',
      'icon': Icons.house_rounded,
      'color': const Color(0xFFFFCE54)
    },
    {
      'title': 'Female dormitory',
      'subtitle': 'This is the Female Dormitory.',
      'image':
          '/assets/images/FemaleDormitory.jpg',
      'icon': Icons.house_rounded,
      'color': const Color(0xFFFFCE54)
    },
    {
      'title': 'Registrar',
      'subtitle': 'This is the Registrar, where students register.',
      'image':
          '/assets/images/RegistrarBuilding.jpg',
      'icon': Icons.app_registration_rounded,
      'color': const Color(0xFFFFCE54)
    },
    {
      'title': 'Informatics Laboratory',
      'subtitle': 'This is the Informatics Laboratory.',
      'image':
          '/assets/images/FemaleDormitory.jpg',
      'icon': Icons.local_cafe_rounded,
      'color': const Color(0xFFFFCE54)
    },
    {
      'title': 'Female dormitory',
      'subtitle': 'This is the Female Dormitory.',
      'image':
          '/assets/images/FemaleDormitory.jpg',
      'icon': Icons.local_cafe_rounded,
      'color': const Color(0xFFFFCE54)
    },
    {
      'title': 'Female dormitory',
      'subtitle': 'This is the Female Dormitory.',
      'image':
          '/assets/images/FemaleDormitory.jpg',
      'icon': Icons.local_cafe_rounded,
      'color': const Color(0xFFFFCE54)
    },
    {
      'title': 'Female dormitory',
      'subtitle': 'This is the Female Dormitory.',
      'image':
          '/assets/images/FemaleDormitory.jpg',
      'icon': Icons.local_cafe_rounded,
      'color': const Color(0xFFFFCE54)
    },
    {
      'title': 'Female dormitory',
      'subtitle': 'This is the Female Dormitory.',
      'image':
          '/assets/images/FemaleDormitory.jpg',
      'icon': Icons.local_cafe_rounded,
      'color': const Color(0xFFFFCE54)
    },
    {
      'title': 'Female dormitory',
      'subtitle': 'This is the Female Dormitory.',
      'image':
          '/assets/images/FemaleDormitory.jpg',
      'icon': Icons.local_cafe_rounded,
      'color': const Color(0xFFFFCE54)
    },
    {
      'title': 'Female dormitory',
      'subtitle': 'This is the Female Dormitory.',
      'image':
          '/assets/images/FemaleDormitory.jpg',
      'icon': Icons.local_cafe_rounded,
      'color': const Color(0xFFFFCE54)
    },
    {
      'title': 'Female dormitory',
      'subtitle': 'This is the Female Dormitory.',
      'image':
          '/assets/images/FemaleDormitory.jpg',
      'icon': Icons.local_cafe_rounded,
      'color': const Color(0xFFFFCE54)
    },
    {
      'title': 'Female dormitory',
      'subtitle': 'This is the Female Dormitory.',
      'image':
          '/assets/images/FemaleDormitory.jpg',
      'icon': Icons.local_cafe_rounded,
      'color': const Color(0xFFFFCE54)
    },
    {
      'title': 'Female dormitory',
      'subtitle': 'This is the Female Dormitory.',
      'image':
          '/assets/images/FemaleDormitory.jpg',
      'icon': Icons.local_cafe_rounded,
      'color': const Color(0xFFFFCE54)
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Center(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: ExpandingCards(
                height: 400,
                items: items,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpandingCards extends StatefulWidget {
  final double height;
  final List<Map<String, dynamic>> items;

  const ExpandingCards({
    super.key,
    required this.height,
    required this.items,
  });

  @override
  State<ExpandingCards> createState() => _ExpandingCardsState();
}

class _ExpandingCardsState extends State<ExpandingCards>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: ListView.builder(
        itemCount: widget.items.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 56),
        addRepaintBoundaries: true,
        itemBuilder: (context, index) {
          final item = widget.items[index % widget.items.length];
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: AnimatedCardItem(
              key: ValueKey(index),
              title: item['title'],
              subtitle: item['subtitle'],
              image: item['image'],
              icon: item['icon'] as IconData,
              iconColor: item['color'] as Color,
              isExpanded: _selectedIndex == index,
              animation: _controller,
              onTap: () => onExpand(_selectedIndex == index ? -1 : index),
            ),
          );
        },
      ),
    );
  }

  void onExpand(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedCardItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;
  final IconData icon;
  final Animation<double> animation;
  final bool isExpanded;
  final VoidCallback onTap;
  final Color iconColor;

  const AnimatedCardItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.icon,
    required this.animation,
    required this.isExpanded,
    required this.onTap,
    required this.iconColor,
  });

  @override
  State<AnimatedCardItem> createState() => _AnimatedCardItemState();
}

class _AnimatedCardItemState extends State<AnimatedCardItem> {
  bool shouldRect = false;

  @override
  void didUpdateWidget(covariant AnimatedCardItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isExpanded != widget.isExpanded) {
      shouldRect = true;
    } else {
      shouldRect = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    const double collapsedWidth = 70;
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: widget.animation,
          builder: (context, child) {
            double value = shouldRect
                ? widget.isExpanded
                    ? widget.animation.value
                    : 1 - widget.animation.value
                : widget.isExpanded
                    ? 1
                    : 0;

            final double animValue = widget.isExpanded
                ? const Interval(0, 0.5, curve: Curves.fastOutSlowIn)
                    .transform(value)
                : Interval(0.5, 1, curve: Curves.fastOutSlowIn.flipped)
                    .transform(value);

            final imageScaleValue = widget.isExpanded
                ? const Interval(0.2, 1, curve: Curves.easeOut).transform(value)
                : const Interval(0.8, 1, curve: Curves.easeOut)
                    .transform(value);

            final titleValue = widget.isExpanded
                ? const Interval(0.2, 0.8, curve: Curves.easeOut)
                    .transform(value)
                : const Interval(0.2, 0.8, curve: Curves.easeOut)
                    .transform(value);

            final subtitleValue = widget.isExpanded
                ? const Interval(0.4, 0.8, curve: Curves.easeOut)
                    .transform(value)
                : const Interval(0.4, 0.8, curve: Curves.easeOut)
                    .transform(value);

            return Transform.scale(
              scale: 1 + animValue * 0.02,
              child: Container(
                width: collapsedWidth + animValue * (600 - collapsedWidth),
                height: 400 + (animValue * 20),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(collapsedWidth / 2),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Transform.scale(
                        scale: 1.2 - imageScaleValue * 0.03,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0),
                                Colors.black.withOpacity(1),
                              ],
                              stops: const [0.7, 1],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10 + animValue * 10,
                          vertical: 10 + animValue * 12,
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: SizedBox.square(
                                dimension: 50,
                                child: Center(
                                  child: Icon(
                                    widget.icon,
                                    color: widget.iconColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            if (widget.isExpanded)
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Opacity(
                                        opacity: titleValue,
                                        child: Transform.translate(
                                          offset: Offset(
                                            20 * (1 - titleValue),
                                            0,
                                          ),
                                          child: Text(
                                            widget.title,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // const SizedBox(height: 2),
                                      Opacity(
                                        opacity: subtitleValue,
                                        child: Transform.translate(
                                          offset: Offset(
                                            20 * (1 - subtitleValue),
                                            0,
                                          ),
                                          child: Text(
                                            widget.subtitle,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}