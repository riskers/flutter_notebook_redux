import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'actions.dart';
import 'constant.dart';
import '../../store/main.dart';

class AppStateViewModel {
  final AppState state;
  final void Function() onClick;

  AppStateViewModel({
    this.state,
    this.onClick,
  });
}

class SimpleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (store) {
        return AppStateViewModel(
          state: store.state,
        );
      },
      builder: (context, vm) {
        String count = vm.state.count.toString();
        String clickCount = vm.state.clickCount.toString();

        return new Text(
          'count: $count, clickCount: $clickCount',
          style: Theme.of(context).textTheme.subhead,
        );
      },
    );
  }
}

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (store) {
        return AppStateViewModel(onClick: () {
          store.dispatch(INCREMENT);
          store.dispatch(CLICK);
        });
      },
      builder: (context, vm) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: new FloatingActionButton(
            // Attach the `callback` to the `onPressed` attribute
            onPressed: vm.onClick,
            tooltip: 'Increment',
            child: new Icon(Icons.exposure_plus_1),
          ),
        );
      },
    );
  }
}

class AddAsyncButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (store) {
        return AppStateViewModel(onClick: () {
          store.dispatch(asyncIncrement());
          store.dispatch(CLICK);
        });
      },
      builder: (context, vm) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: new FloatingActionButton(
            // Attach the `callback` to the `onPressed` attribute
            onPressed: vm.onClick,
            tooltip: 'Increment',
            child: new Icon(Icons.slow_motion_video),
          ),
        );
      },
    );
  }
}

class DesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (store) {
        return AppStateViewModel(onClick: () {
          store.dispatch(DECREMENT);
        });
      },
      builder: (context, vm) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: new FloatingActionButton(
            // Attach the `callback` to the `onPressed` attribute
            onPressed: vm.onClick,
            tooltip: 'des',
            child: new Icon(Icons.exposure_neg_1),
          ),
        );
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Flutter Redux Demo'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text(
              'You have pushed the button this many times:',
            ),
            SimpleText(),
          ],
        ),
      ),
      // Connect the Store to a FloatingActionButton. In this case, we'll
      // use the Store to build a callback that with dispatch an Increment
      // Action.
      //
      // Then, we'll pass this callback to the button's `onPressed` handler.
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          AddButton(),
          DesButton(),
          AddAsyncButton(),
        ],
      ),
    );
  }
}
