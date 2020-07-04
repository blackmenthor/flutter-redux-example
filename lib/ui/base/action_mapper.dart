import 'package:redux/redux.dart';

// Class responsible for mapping UI actions to Redux actions
class ActionMapper {
  final Store _store;

  ActionMapper(this._store);

  void dispatch(dynamic action) => _store.dispatch(action);
}