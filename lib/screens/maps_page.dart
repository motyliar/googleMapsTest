import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:googlemap/bloc/googlemaps/googlemaps_bloc.dart';
import 'dart:async';
import 'package:googlemap/LIsts/marker_map.dart';
import 'package:googlemap/bloc/googlemaps/switch/switch_bloc.dart';

class MapsPage extends StatelessWidget {
  MapsPage({
    super.key,
  });

  bool sportVisible = false;

  bool arenaVisible = true;

  final CameraPosition _initialPosition =
      const CameraPosition(target: LatLng(52.3877, 16.9373), zoom: 10);

  final Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  // BitmapDescriptor customidIcon = BitmapDescriptor.defaultMarker;
  bool change = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: BlocBuilder<GooglemapsBloc, GooglemapsState>(
          builder: (context, state) {
        if (state is GooglemapsInitial) {
          BitmapDescriptor customIconSport = state.customidIcon;
          BitmapDescriptor customIconArena = state.custom;
          bool onChangeState = state.onChange;

          return Stack(
            children: [
              Positioned(
                child: GoogleMap(
                  initialCameraPosition: _initialPosition,
                  markers: Set<Marker>.of(
                    setMarker(context, customIconSport, customIconArena,
                        onChangeState, onChangeState),
                  ),
                  onMapCreated: _onMapCreated,
                ),
              ),
              Positioned(
                top: 100,
                right: 50,
                child: BlocBuilder<GooglemapsBloc, GooglemapsState>(
                  builder: (context, state) {
                    return Switch(
                      value: state.onChange,
                      onChanged: ((value) {
                        value
                            ? context
                                .read<GooglemapsBloc>()
                                .add(SwitchOnEvent())
                            : context
                                .read<GooglemapsBloc>()
                                .add(SwitchOffEvent());
                      }),
                    );
                  },
                ),
              )
            ],
          );
        }
        return Container();
      }),
    ));
  }
}

//  Stack(
//         children: [
//           BlocBuilder<GooglemapsBloc, GooglemapsState>(
//               builder: (context, state) {
//             if (state is GooglemapsInitial) {
//               BitmapDescriptor customid = state.customidIcon;
//               BitmapDescriptor cuss = state.custom;
//               return GoogleMap(
//                 markers: Set<Marker>.of(
//                   setMarker(
//                       context, customid, cuss, state.switchBool, arenaVisible),
//                 ),
//                 onMapCreated: _onMapCreated,
//                 initialCameraPosition: _initialPosition,
//               );
//             }
//             return Container();
//           }),
//           Positioned(
//             top: 40,
//             left: 20,
//             child: Container(
//                 width: 350,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color:
//                       const Color.fromARGB(255, 247, 245, 245).withOpacity(0.5),
//                 ),
//                 child: const TextField(
//                   textAlign: TextAlign.center,
//                   cursorHeight: 25,
//                   decoration: InputDecoration(
//                       border: InputBorder.none, hintText: 'Search'),
//                 )),
//           ),
//           Positioned(
//               top: 100,
//               right: 30,
//               child: BlocBuilder<GooglemapsBloc, GooglemapsState>(
//                 builder: (context, state) {
//                   return Switch(
//                     value: state.switchBool,
//                     onChanged: ((value) {
//                       value ? state.switchBool : state.switchBool = false;
//                     }),
//                   );
//                 },
//               ))
//         ],
//       ),


// GoogleMap(
// //                 markers: Set<Marker>.of(
// //                   setMarker(
// //                       context, customid, cuss, state.switchBool, arenaVisible),
// //                 ),
// //                 onMapCreated: _onMapCreated,
// //                 initialCameraPosition: _initialPosition,
// //               );