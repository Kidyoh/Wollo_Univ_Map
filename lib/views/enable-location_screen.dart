import 'package:flutter/material.dart';
import 'package:kiot_map/utils/toast_utils.dart';
import 'package:permission_handler/permission_handler.dart';

class EnableLocationScreen extends StatefulWidget {
  const EnableLocationScreen({super.key});

  @override
  State<EnableLocationScreen> createState() => _EnableLocationScreenState();
}

class _EnableLocationScreenState extends State<EnableLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.4,
      minChildSize: 0.3,
      maxChildSize: 0.6,
      builder: (context, controller) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
              child: Column(
            children: [
              const Text(
                'Enable Location',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Enable your location in order to access your current position.',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
              const SizedBox(
                height: 40,
              ),
              MaterialButton(
                height: 50,
                minWidth: 100,
                elevation: 6,
                color: Colors.black,
                shape: const RoundedRectangleBorder(),
                onPressed: () async {
                  PermissionStatus status = await Permission.location.request();
                  if (status.isGranted) {
                    ToastUtil.showMessage("Permission is granted!");
                    Navigator.pop(context);
                  } else {
                    ToastUtil.showMessage("Permission is not granted!");
                  }
                },
                child: const Text(
                  'Enable Location',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              )
            ],
          )),
        );
      },
    );
  }
}
