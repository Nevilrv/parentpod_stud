import 'package:get_storage/get_storage.dart';

class SharedPreference {
  static GetStorage getStorage = GetStorage();
  static String deviceID = "deviceId";
  static String login = "login";
  static String token = "token";
  static String id = "id";
  static String userName = "userName";
  static String roleKey = "roleKey";
  static String email = "email";
  static String password = "password";
  static String image = "image";

  /// DeviceID
  static Future setDeviceID(String value) async {
    await getStorage.write(deviceID, value);
  }

  static getDeviceID() {
    return getStorage.read(deviceID);
  }

  /// DeviceID
  static Future setToken(String value) async {
    await getStorage.write(token, value);
  }

  static getToken() {
    return getStorage.read(token);
  }

  /// ID
  static Future setId(String value) async {
    await getStorage.write(id, value);
  }

  static getId() {
    return getStorage.read(id);
  }

  /// ROLE KEY
  static Future setRoleKey(String value) async {
    await getStorage.write(roleKey, value);
  }

  static getRoleKey() {
    return getStorage.read(roleKey);
  }

  /// USERNAME
  static Future setUsername(String value) async {
    await getStorage.write(userName, value);
  }

  static getUsername() {
    return getStorage.read(userName);
  }

  /// EMAIL
  static Future setEmail(String value) async {
    await getStorage.write(email, value);
  }

  static getEmail() {
    return getStorage.read(email);
  }

  /// PASSWORD
  static Future setPassword(String value) async {
    await getStorage.write(password, value);
  }

  static getPassword() {
    return getStorage.read(password);
  }

  /// USERNAME
  static Future setImage(String value) async {
    await getStorage.write(image, value);
  }

  static getImage() {
    return getStorage.read(image);
  }

  /// LogIn
  static Future setLogin(bool value) async {
    await getStorage.write(login, value);
  }

  static getLogin() {
    return getStorage.read(login);
  }

  /// Logout
  static clearAllPref() {
    String email = getEmail() ?? "";
    String password = getPassword() ?? "";

    getStorage.erase();

    setEmail(email);
    setPassword(password);
  }
}
