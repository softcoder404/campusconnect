import 'package:campus_connect/core/helpers/response_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<NetworkResponse> createNewUser(
      Map<String, dynamic> _payload) async {
    //check existing username
    var result = NetworkResponse.warning();

    try {
      final QuerySnapshot snapshot = await _firestore
          .collection('Users')
          .where('username', isEqualTo: _payload['username'])
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) {
        final response =
            await _firestore.collection('Users').doc(_payload['uid']).set({
          ..._payload,
          "created_at": DateTime.now().toString(),
        });
        result = NetworkResponse.success(
          message: 'Account created successfully!',
          data: _payload,
        );
      } else {
        result.message = 'User with this username already exist!';
      }
      //createUser
    } catch (error, trace) {
      result.handleError(error, trace);
    }
    return result;
  }

  static Future<NetworkResponse> register(Map<String, dynamic> payload) async {
    var result = NetworkResponse.warning();
    try {} catch (error, trace) {
      result.handleError(error, trace);
    }
    return result;
  }
}
