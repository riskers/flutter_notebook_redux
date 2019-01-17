import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'store/main.dart';
import 'pages/home/main.dart';

void main() {
  final store = Store<AppState>(
    reducers,
    middleware: [thunkMiddleware],
    initialState: AppState.initialState(),
  );

  runApp(MyApp(
    title: 'Flutter Redux Demo',
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  final String title;

  MyApp({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: Home(),
      ),
    );
  }
}
