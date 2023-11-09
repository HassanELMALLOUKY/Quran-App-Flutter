import 'package:feather_icons/feather_icons.dart';
import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:quran_shamil/providers/DialogProvider.dart';
class TestDialog extends StatelessWidget {
  const TestDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color inkColor=context.watch<DialogProvider>().inkColor;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: (){
                    //inkColor=context.read()<DialogProvider>().inkColor(Colors.green);
                    Fluttertoast.showToast(
                        msg: "Your current state of reading is saved",
                        textColor: Colors.black,
                         gravity: ToastGravity.BOTTOM,
                    );
              },
                  child: Ink(
                      child: Icon(FeatherIcons.save),
                      color: Colors.red,

                  )),
              GestureDetector(
                  onTap: (){
                    Fluttertoast.showToast(
                      msg: "Tafsir screen is not ready yet",
                      textColor: Colors.black,
                      gravity: ToastGravity.BOTTOM,
                    );
                  },
                  child: Icon(FeatherIcons.fileText)),
              GestureDetector(
                  onTap: (){
                    Fluttertoast.showToast(
                      msg: "Playing screen is not ready yet",
                      textColor: Colors.black,
                      gravity: ToastGravity.BOTTOM,
                    );
                  },
                  child: Icon(FeatherIcons.playCircle)),
            ],
          ),
          SizedBox(height: 5,),
          TextButton(
            onPressed: () => DialogNavigator.of(context).close(),
            child: const Icon(Icons.close_rounded,size: 30),
          ),
        ],
      ),
    );
  }
}