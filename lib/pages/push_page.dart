import 'package:cifra/data/data.dart';
import 'package:cifra/widgets/static/push_wait.dart';
import 'package:cifra/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PushPage extends StatefulWidget {
  const PushPage({Key? key}) : super(key: key);

  @override
  State<PushPage> createState() =>_PushPageState();
}

class _PushPageState extends State<PushPage> {
  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: const Logo(),
        title: pageSize.width > 850
            ? const RowAppTitle(
          titles: ['Уведомления'],
        )
            : const ColumnAppTitle(
          titles: ['Уведомления'],
        ),
        actions: [
          !PageState.logged
              ? pageSize.width > 500
              ? const FullSizeAuthorizePanel()
              : const LowSizeAuthorizePanel()
              : IconButton(
              onPressed: () => {
                showDialog(
                    context: context,
                    builder: (context) {
                      return userSubMenu();
                    })
              },
              icon: const PngGif(imgPath: "assets/imgs/profile", height: 54,width: 54,)),
        ],
      ),
      body:
      SingleChildScrollView(child: Center(child: PushWait(pageSize: pageSize,))),
    );
  }
}
