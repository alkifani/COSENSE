import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                // Tulisan Hello
                Row(
                  children: <Widget>[
                    Text(
                      'Hello.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),),
                  ],
                ),
                Text('Sliver List 1'),
                Text('Sliver List 2'),
                Text('Sliver List 3'),
                Text('Sliver List 4'),
                Text('Sliver List 5'),
                Text('Sliver List 6'),
                Text('Sliver List 7'),
                Text('Sliver List 8'),
                Text('Sliver List 9'),
              ]),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                color: Colors.red,
                child: Center(
                  child: Text('Sliver Fill Remaining'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}