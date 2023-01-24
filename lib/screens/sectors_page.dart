import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/googlemaps/switch/switch_bloc.dart';

List<Map<String, dynamic>> sectorList = [
  {
    'NowaZiemia': 'Witaj w NowejZiemi',
    'Karpacz': 'Witaj w Karpaczu',
    'Wiezyca': 'Witaj w Wieżycy',
  }
];

class SectorsPage extends StatelessWidget {
  const SectorsPage({super.key, required this.sectorName});

  final String sectorName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(sectorList[0][sectorName]),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Center(
              child: Text(sectorList[0][sectorName]),
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                  value: state.switchBool,
                  onChanged: (value) {
                    value
                        ? context.read<SwitchBloc>().add(SwitchOnnEvent())
                        : context.read<SwitchBloc>().add(SwitchOfffEvent());
                  },
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
              return state.switchBool ? Text('ELOOO') : Text('NIe Elo');
            }),
          ],
        ));
  }
}
