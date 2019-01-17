import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'store/main.dart';
import 'pages/home/main.dart';

void main() {
  final store = new Store<AppState>(
    reducers,
    middleware: [thunkMiddleware],
    initialState: AppState(
      count: 0,
      clickCount: 0,
    ),
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
    return new StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: Home(),
      ),
    );
  }
}
