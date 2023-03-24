class AuthRepo {
  Future<String> fetchUserData() async {
    await Future.delayed(const Duration(seconds: 4));

    print("fetchUserData called");
    return "Wan Fikri here";
  }
}
