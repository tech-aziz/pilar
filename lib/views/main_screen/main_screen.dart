import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../components/custom_button.dart';
import '../../utils/colors.dart';
import '../../utils/config.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final WebViewController _controller = WebViewController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) => {},
        onPageStarted: (url) => {},
        onPageFinished: (url) => {},
      ))
      ..loadRequest(Uri.parse(AppConfig.url));
  }

  @override
  Widget build(BuildContext context) {
    //user will exit or not
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                alignment: Alignment.center,
                content: const Text('Do you want to close the app?',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 0.9)),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            exit(0);
                          },
                          child: customButton(
                            textColor: Colors.white,
                            btnName: 'Yes',
                            borderColor: AppColors.defaultColor,
                            context: context,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: customButton(
                              textColor: Colors.white,
                              btnName: 'No',
                              borderColor: AppColors.defaultColor,
                              context: context),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ) ??
          false;
    }

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: WillPopScope(
              onWillPop: () async {
                if (await _controller.canGoBack()) {
                  _controller.goBack();

                  return false;
                } else {
                  showExitPopup();
                  return true;
                }
              },
              child: WebViewWidget(
                controller: _controller,
              ))),
    );
  }
}
