import 'constant.dart';
import '../../store/main.dart';

AppState counterReducer(AppState state, dynamic action) {
  switch (action) {
    case INCREMENT:
      return state.copyWith(count: state.count + 1);
    case DECREMENT:
      return state.copyWith(count: state.count - 1);
  }

  return state;
}

AppState valueReducer(AppState state, dynamic action) {
  switch (action) {
    case CLICK:
      return state.copyWith(clickCount: state.clickCount + 1);
  }

  return state;
}
