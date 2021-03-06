import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/config/app_theme.dart';
import 'package:weather_app/screens/main/main_screen_controller.dart';
import 'package:weather_app/screens/main/providers/error_provider.dart';
import 'package:weather_app/screens/main/providers/send_button_provider.dart';

class AddNewCityBottomSheet extends StatefulWidget {
  final MainScreenController controller;
  final ErrorMessageProvider errorMessageProvider;
  final SendButtonStateProvider buttonStateProvider;

  const AddNewCityBottomSheet({Key key,
    @required this.controller,
    @required this.errorMessageProvider,
    @required this.buttonStateProvider
  }) : super(key: key);

  @override
  _AddNewCityBottomSheetState createState() => _AddNewCityBottomSheetState();
}

class _AddNewCityBottomSheetState extends State<AddNewCityBottomSheet> {
  final TextEditingController _editingController = TextEditingController();

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

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
                child: TextField(
                  controller: _editingController,
                ),
                margin: EdgeInsets.only(left: AppTheme.defaultMargin / 2),
              ),
              ChangeNotifierProvider(
                  create: (_) => widget.buttonStateProvider,
                  child: Consumer<SendButtonStateProvider>(
                    builder: (context, state, child) {
                      return state.currentState == ButtonState.progress ? Padding(
                        padding: EdgeInsets.only(right: AppTheme.defaultMargin / 3),
                        child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator()),
                      )
                      : IconButton(icon: Icon(Icons.navigate_next),
                          onPressed: () => widget.controller.onSubmitButtonClick(context, _editingController.text));
                    })
              )
            ],
          ),
          ChangeNotifierProvider(
              create: (_) => widget.errorMessageProvider,
              child: Consumer<ErrorMessageProvider>(builder: (context, state, child) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppTheme.defaultMargin),
                  child: Text(state.errorMessage),
                );
              })
          )
        ],
      ),
    );
  }
}
