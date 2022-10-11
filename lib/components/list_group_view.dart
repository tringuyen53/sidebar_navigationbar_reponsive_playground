import 'package:flutter/material.dart';

class ListGroupView extends StatelessWidget {
  const ListGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => EntryItem(data[index]),
      itemCount: data.length,
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Region 1',
    <Entry>[
      Entry(
        'Group 1',
        <Entry>[
          Entry('Cam 2'),
          Entry('Cam 3'),
        ],
      ),
      Entry('Group 2', <Entry>[
          Entry('Cam 4'),
          Entry('Cam 5'),
        ],),
      
    ],
  ),
  Entry(
    'Region 2',
    <Entry>[
      Entry(
        'Group 2',
        <Entry>[
          Entry('Cam 1'),
        ],
      ),
    ],
  ),
  Entry(
    'Region 3',
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry, {super.key});

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: ListTile(title: Text(root.title)),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ExpansionTile(
        key: PageStorageKey<Entry>(root),
        title: Text(root.title),
        children: root.children.map(_buildTiles).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
