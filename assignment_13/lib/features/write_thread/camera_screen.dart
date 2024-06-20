import 'package:assignment_13/constants/sizes.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool _hasPermission = false;
  bool _isSelfieMode = false;

  late CameraController _cameraController;
  late FlashMode _flashMode;

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final audioPermission = await Permission.audio.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;

    final audioDenied =
        audioPermission.isDenied || audioPermission.isPermanentlyDenied;

    if (!cameraDenied || !audioDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    } else {
      if (!mounted) return;

      showAdaptiveDialog(
        context: context,
        builder: (context) => AlertDialog.adaptive(
          content: const Text(
            "Permission is required to use the camera. Please allow permissions.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Check"),
            ),
          ],
        ),
      );
    }
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) return;

    _cameraController = CameraController(
        cameras[_isSelfieMode ? 1 : 0], ResolutionPreset.ultraHigh);

    await _cameraController.initialize();

    _flashMode = _cameraController.value.flashMode;
  }

  Future<void> _onPhotoShootTap() async {
    if (_cameraController.value.isTakingPicture) return;
    await _cameraController.takePicture();
  }

  Future<void> _onCameraSwitchTap() async {
    _isSelfieMode = !_isSelfieMode;

    await initCamera();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: !_hasPermission || !_cameraController.value.isInitialized
            ? const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Initializing..."),
                  CircularProgressIndicator.adaptive(),
                ],
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(
                          Sizes.size28,
                        ),
                      ),
                    ),
                    child: CameraPreview(_cameraController),
                  ),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    bottom: Sizes.size36,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: Sizes.size56,
                          ),
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(Sizes.size4),
                              child: Icon(
                                Icons.flash_off_rounded,
                                size: Sizes.size28,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTapUp: (details) => _onPhotoShootTap(),
                          child: Container(
                            width: 76,
                            height: 76,
                            padding: const EdgeInsets.all(
                              Sizes.size4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(
                                color: Colors.white,
                                width: Sizes.size3,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: Sizes.size56,
                          ),
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: _onCameraSwitchTap,
                            child: const Padding(
                              padding: EdgeInsets.all(Sizes.size4),
                              child: FaIcon(
                                FontAwesomeIcons.cameraRotate,
                                size: Sizes.size28,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
