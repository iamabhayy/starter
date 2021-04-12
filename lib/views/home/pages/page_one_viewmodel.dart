import 'package:stacked/stacked.dart';

class PageOneViewModel extends BaseViewModel {
  bool loading = false;

  setLoading() {
    this.loading = !this.loading;
    notifyListeners();
  }
}
