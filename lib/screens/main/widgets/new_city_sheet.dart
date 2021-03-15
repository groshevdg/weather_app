import 'package:flutter/material.dart';
import 'package:weather_app/config/app_theme.dart';
import 'package:weather_app/config/strings.dart';

class AddNewCityBottomSheet extends StatefulWidget {
  @override
  _AddNewCityBottomSheetState createState() => _AddNewCityBottomSheetState();
}

class _AddNewCityBottomSheetState extends State<AddNewCityBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppTheme.defaultMargin / 2, vertical: AppTheme.defaultMargin / 2),
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(padding: EdgeInsets.only(left: AppTheme.defaultMargin / 2, top: AppTheme.defaultMargin / 2),
              child: IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.pop(context)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(height: 80, width: MediaQuery.of(context).size.width - 100,
                child: TextField(),
                margin: EdgeInsets.only(left: AppTheme.defaultMargin / 2),
              ),
              IconButton(icon: Icon(Icons.navigate_next), onPressed: () {})
            ],
          ),
          Text(Strings.error)
        ],
      ),
    );
  }
}