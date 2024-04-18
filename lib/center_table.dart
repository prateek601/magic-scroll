import 'package:flutter/material.dart';
import 'package:magic_scroll/teams_data.dart';

class CenterTable extends StatefulWidget {
  const CenterTable({super.key});

  @override
  State<CenterTable> createState() => _CenterTableState();
}

class _CenterTableState extends State<CenterTable> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowColor: MaterialStateProperty.resolveWith((states) {
        return Colors.blue;
      }),
      dataRowColor: MaterialStateProperty.resolveWith((states) {
        return Colors.red;
      }),
      columns: const [
        DataColumn(label: Text('Center')),
      ],
      rows: [
        ...teamsData.map((team) => DataRow(
          cells: [
            DataCell(Text(
              '${team.position.toString()}',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ],
        ))
      ],
    );
  }
}
