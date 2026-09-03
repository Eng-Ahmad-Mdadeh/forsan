import 'dart:developer';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/location/location_cubit.dart';
import 'package:flutter_google_maps_webservices/places.dart' as we;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:forsan/core/constants/app_constants.dart';
import 'package:forsan/core/resources/app_colors.dart';

import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:google_maps_place_picker_mb_v2/google_maps_place_picker.dart';

class MapPicker extends StatelessWidget {
  const MapPicker({super.key, this.initialPosition, this.onLocationPicked});

  final LatLng? initialPosition;
  final void Function(double lat, double lng)? onLocationPicked;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, ILocationState>(
      builder: (context, state) {
        return state is LocationLoading || state is LocationInitial
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              )
            : state is LocationLoaded || state is LocationDefaultLoaded
            ? ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.r13),
          child: PlacePicker(
            ignoreLocationPermissionErrors: true,
            automaticallyImplyAppBarLeading: false,
            resizeToAvoidBottomInset: false,
            apiKey: AppConstants.apiKey,
            hintText: "إبحث عن المكان",
            searchingText: "الرجاء الإنتظار ...",
            selectText: "إختيار",
            outsideOfPickAreaText: "Place not in area",
            autocompleteLanguage: "ar",
            region: 'SA',
            autocompleteComponents: [we.Component("country", 'SA')],
            initialPosition: initialPosition ?? _locationFromState(state),
            useCurrentLocation: true,
            selectInitialPosition: true,
            usePlaceDetailSearch: true,
            onMapCreated: (GoogleMapController controller) {
              log('Map created');
            },
            onPlacePicked: (PickResult result) {
              final lat = result.geometry!.location.lat;
              final lng = result.geometry!.location.lng;
              log("Place picked: $lat");
              log("Place picked: $lng");
              log("Place picked: ${result.formattedAddress}");
              onLocationPicked?.call(lat, lng);
            },
            onMapTypeChanged: (MapType mapType) {
              log("Map type changed to $mapType");
            },
          ),
        )
            : Center(
                child: BodyTitle(
                  text: state is LocationFailure ? state.message : 'تعذر تحميل الخريطة',
                  color: AppColors.red,
                ),
              );
      },
    );
  }

  LatLng _locationFromState(ILocationState state) {
    if (state is LocationLoaded) return state.location;
    if (state is LocationDefaultLoaded) return state.location;

    return initialPosition ?? const LatLng(24.711781183034212, 46.68352033942938);
  }
}
