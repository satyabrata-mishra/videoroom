import 'package:flutter/cupertino.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../utils/constants.dart';

class CallPage extends StatefulWidget {
  final String callId, userId, userName;
  const CallPage(this.callId, this.userId, this.userName);

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: Constants.appId,
        appSign: Constants.appSignin,
        callID: widget.callId,
        userID: widget.userId,
        userName: widget.userName,
        config: ZegoUIKitPrebuiltCallConfig.groupVideoCall(),
      ),
    );
  }
}
