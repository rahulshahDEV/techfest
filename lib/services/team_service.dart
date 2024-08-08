import 'package:byrahul/constant.dart';
import 'package:byrahul/model/userview_team.dart';

class TeamService {
  static Future<UserviewTeam?> getTeam() async {
    try {
      var res = await dio.get('$URI/frontend/team');
      var finalResponse = UserviewTeam.fromJson(res.data);
      return finalResponse;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
