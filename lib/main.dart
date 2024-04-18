import 'package:flutter/material.dart';
import 'package:magic_scroll/center_table.dart';
import 'package:magic_scroll/teams_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScrollController leftTableController = ScrollController();
  ScrollController rightTableController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Magic Scroll',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: SingleChildScrollView(
            child: Row(
              children: [
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      rightTableController.position.jumpTo(notification.metrics.pixels);
                      return true;
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: leftTableController,
                      child: DataTable(
                        columns: const <DataColumn>[
                          DataColumn(label: Text('Team')),
                          DataColumn(label: Text('Points')),
                          DataColumn(label: Text('Won')),
                          DataColumn(label: Text('Lost')),
                          DataColumn(label: Text('Drawn')),
                          DataColumn(label: Text('Against')),
                          DataColumn(label: Text('GD')),
                        ],
                        rows: [
                          ...teamsData.map((team) => DataRow(
                                cells: [
                                  DataCell(Container(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(
                                        '${team.position.toString()}  ${team.name}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))),
                                  DataCell(Container(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(
                                        team.points.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))),
                                  DataCell(Container(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(team.won.toString()))),
                                  DataCell(Container(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(team.lost.toString()))),
                                  DataCell(Container(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(team.drawn.toString()))),
                                  DataCell(Container(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(team.against.toString()))),
                                  DataCell(Container(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(team.gd.toString()))),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                const CenterTable(),
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      leftTableController.position.jumpTo(notification.metrics.pixels);
                      return true;
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: rightTableController,
                      reverse: true,
                      child: DataTable(
                        columns: const <DataColumn>[
                          DataColumn(label: Text('Team')),
                          DataColumn(label: Text('Points')),
                          DataColumn(label: Text('Won')),
                          DataColumn(label: Text('Lost')),
                          DataColumn(label: Text('Drawn')),
                          DataColumn(label: Text('Against')),
                          DataColumn(label: Text('GD')),
                        ],
                        rows: [
                          ...teamsData.map((team) => DataRow(
                                cells: [
                                  DataCell(Container(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(
                                        '${team.position.toString()}  ${team.name}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))),
                                  DataCell(Container(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(
                                        team.points.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))),
                                  DataCell(Container(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(team.won.toString()))),
                                  DataCell(Container(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(team.lost.toString()))),
                                  DataCell(Container(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(team.drawn.toString()))),
                                  DataCell(Container(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(team.against.toString()))),
                                  DataCell(Container(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(team.gd.toString()))),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
