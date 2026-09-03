import 'package:forsan/core/routes/app_routes_imports.dart';
import 'package:forsan/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapWidget extends StatefulWidget {
  final String? lat;
  final String? lng;

  const MapWidget({super.key, required this.lat, required this.lng});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    final lat = double.tryParse(widget.lat ?? '0.0');
    final lng = double.tryParse(widget.lng ?? '0.0');
    if (lat != null || lng != null) {
      return AbsorbPointer(
      absorbing: true,
        child: SizedBox(
          height: AppHeight.h325,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(AppRadius.r25),
            child: Stack(
              children: [
                GoogleMap(
                  scrollGesturesEnabled: false,
                  zoomGesturesEnabled: false,
                  myLocationEnabled: false,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  mapToolbarEnabled: false,
                  buildingsEnabled: false,
                  compassEnabled: false,
                  rotateGesturesEnabled: false,
                  tiltGesturesEnabled: false,
                  fortyFiveDegreeImageryEnabled: false,
                  gestureRecognizers: {Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer())},
                  markers: {
                    Marker(
                      markerId: MarkerId(widget.lat ?? ''),
                      position: LatLng(double.parse(widget.lat ?? "0.0"), double.parse(widget.lng ?? "0.0")),
                    ),
                  },
                  initialCameraPosition: (widget.lat != null && widget.lng != null)
                      ? CameraPosition(target: LatLng(double.parse(widget.lat!), double.parse(widget.lng!)), zoom: 17)
                      : CameraPosition(target: LatLng(double.parse("0.0"), double.parse("0.0")), zoom: 10),
                ),
                PositionedDirectional(
                  width: AppWidth.w48,
                  height: AppHeight.h48,
                  start: AppWidth.w13,
                  bottom: AppHeight.h13,
                  child: CustomElevatedButton(
                    padding: EdgeInsets.zero,
                    width: AppWidth.w48,
                    height: AppHeight.h48,
                    borderRadius: AppRadius.r3,
                    onPressed: () {
                      _openMap(lat!, lng!);
                    },
                    color: AppColors.backGround,
                    child: Center(
                      child: Icon(size: AppSize.s25, Icons.directions_car, color: AppColors.greyText),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }

  Future<void> _openMap(double lat, double lng) async {
    final destination = '$lat,$lng';

    final Uri uri = Uri.parse('comgooglemaps://?daddr=$destination&directionsmode=driving');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // fallback to web if app not installed
      final fallback = Uri.parse('https://www.google.com/maps/dir/?api=1&destination=$destination&travelmode=driving');
      await launchUrl(fallback, mode: LaunchMode.externalApplication);
    }
  }
}
