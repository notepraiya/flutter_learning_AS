import 'package:flutter/material.dart';

class TabBar1 extends StatefulWidget {
  TabBar1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<TabBar1> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            widget.title,
            style: TextStyle(
              fontSize: 18.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
          bottom: TabBar(
            // indicator: BoxDecoration(
            //   borderRadius: BorderRadius.circular(
            //     25.0,
            //   ),
            //   // color: Theme.of(context).hoverColor,
            //   color: Theme.of(context).focusColor,
            // ),
            indicator: CircleTabIndicator(color: Theme.of(context).accentColor, radius: 4),
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Theme.of(context).disabledColor,
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Test1 LONGGGG',
              ),
              Tab(
                text: 'Test2 ALSO LONGGGG',
              ),
              Tab(
                child: Text('ok'),
              ),
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
            onTap: (idx) {
              print('tap $idx');
            },
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    'Test',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius}) : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset = offset + Offset(cfg.size.width / 2, cfg.size.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
