import 'package:assignment_13/constants/sizes.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

Map<FlashMode, IconData> icons = {
  FlashMode.off: Icons.flash_off_rounded,
  FlashMode.auto: Icons.flash_auto_rounded,
  FlashMode.torch: Icons.flashlight_on_rounded,
  FlashMode.always: Icons.flash_on_rounded,
};

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with SingleTickerProviderStateMixin {
  bool _hasPermission = false;
  bool _isSelfieMode = false;
  bool _isLibraryLoading = false;

  late CameraController _cameraController = CameraController(
    const CameraDescription(
        sensorOrientation: 0,
        name: "",
        lensDirection: CameraLensDirection.front),
    ResolutionPreset.low,
  );
  late final TabController _tabController = TabController(
    length: 2,
    vsync: this,
  );
  late FlashMode _flashMode;

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();

    final cameraGranted =
        !cameraPermission.isDenied && !cameraPermission.isPermanentlyDenied;

    if (cameraGranted) {
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
                retryPermissionRequest();
              },
              child: const Text("Check"),
            ),
          ],
        ),
      );
    }
  }

  Future<void> retryPermissionRequest() async {
    final cameraPermission = await Permission.camera.request();

    final cameraGranted =
        !cameraPermission.isDenied && !cameraPermission.isPermanentlyDenied;

    if (cameraGranted) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) return;

    _cameraController = CameraController(
      cameras[_isSelfieMode ? 1 : 0],
      ResolutionPreset.ultraHigh,
      enableAudio: false,
    );

    await _cameraController.initialize();

    _flashMode = _cameraController.value.flashMode;
  }

  Future<void> _onPhotoShootTap() async {
    if (_cameraController.value.isTakingPicture) return;

    final file = await _cameraController.takePicture();
    await GallerySaver.saveImage(file.path);

    final List<XFile> selectedFile = [file];

    if (!mounted) return;
    Navigator.pop(context, selectedFile);
  }

  Future<void> _onCameraSwitchTap() async {
    _isSelfieMode = !_isSelfieMode;

    await initCamera();
    setState(() {});
  }

  Future<void> _onLibraryTap() async {
    setState(() {
      _isLibraryLoading = true;
    });
    final List<XFile> files = await ImagePicker().pickMultiImage();

    if (files.isEmpty) return;
    if (!mounted) return;

    Navigator.pop(context, files);
  }

  Future<void> _onFlashTap() async {
    switch (_flashMode) {
      case FlashMode.off:
        await _cameraController.setFlashMode(FlashMode.auto);
        break;
      case FlashMode.auto:
        await _cameraController.setFlashMode(FlashMode.torch);
        break;
      case FlashMode.torch:
        await _cameraController.setFlashMode(FlashMode.always);
        break;
      case FlashMode.always:
        await _cameraController.setFlashMode(FlashMode.off);
        break;
    }
    setState(() {
      _flashMode = _cameraController.value.flashMode;
    });
  }

  @override
  void initState() {
    super.initState();
    initPermissions();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _tabController.dispose();
    super.dispose();
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
            : Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Stack(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: Sizes.size56,
                                    ),
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: _onFlashTap,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.all(Sizes.size4),
                                        child: Icon(
                                          icons[_flashMode],
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
                        Container(
                          color: Colors.black,
                          child: Center(
                            child: _isLibraryLoading
                                ? const CircularProgressIndicator.adaptive()
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    padding: const EdgeInsets.only(bottom: 4),
                    controller: _tabController,
                    // isScrollable: true,
                    labelColor: Colors.white,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.white,
                    tabs: [
                      const Tab(
                        text: "Camera",
                      ),
                      GestureDetector(
                        onTap: _onLibraryTap,
                        child: const Tab(
                          text: "Library",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
