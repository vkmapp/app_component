import 'package:app_component/pages/color.dart';
import 'package:flutter/material.dart';

class ListHistory extends StatelessWidget {
  const ListHistory({Key? key, required this.onTap}) : super(key: key);

  /// Pass List<Data>model

  /// The [onTap] callback that is called when the button is clicked
  /// Type [VoidCallback]
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: (){
            print('Item Taped!');
            onTap.call();
          },
          title: buildTransactionDate(),
          subtitle: buildTransferType(),
          trailing: buildTrailingWidget(),
        );
      },
      separatorBuilder: (context, index) {
        return buildSeparator();
      },
      itemCount: 100,
    );
  }

  /// Date
  /// Type [Widget]
  Widget buildTransactionDate() {
    return Text(
      '05/05/2021',
      style: TextStyle(fontSize: FontSize.sLabel),
    );
  }

  /// Display Text
  /// Type [Widget]
  Widget buildTransferType() {
    return Text(
      'Sub title',
      style: TextStyle(fontSize: FontSize.sLabel),
    );
  }

  /// Build Trailing Widget
  /// Type [Widget]
  Widget buildTrailingWidget() {
    return Column(
      children: [
        Wrap(children: [
          Text(
            'QAR 1000.00',
            style: TextStyle(fontSize: FontSize.sSubHeading,fontWeight: FontWeight.bold),
          ),
          const Icon(Icons.arrow_forward_ios_sharp, size: 12,)
        ],),
        const SizedBox(height: 5,),
        SizedBox(
          height: 23,
          child: ElevatedButton(

            style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(kText), backgroundColor: MaterialStateProperty.all<Color>(kBtnGray),elevation: MaterialStateProperty.all(0)),
            onPressed: () {},
            child: Text(
              'REPEAT',
              style: TextStyle(fontSize: FontSize.sCaption),
            ),
          ),
        )
      ],
    );
  }

  /// Display Separator
  /// Type [Divider]
  Widget buildSeparator() {
    return const Divider(
      indent: 10,
      endIndent: 10,
      thickness: 0.5,
    );
  }
}
