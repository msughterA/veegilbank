class AuthProviderData<T> {
  T? data;
  // AuthProviderData({this.data});

  T? get providerData => data;

  set providerData(T? d) {
    data = d;
  }
}
