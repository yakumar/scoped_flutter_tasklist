
import 'package:scoped_model/scoped_model.dart';


class TaskList extends Model {

  List<String> taskList = [];

  addTo(String _name) {
    //taskList.addAll(_name);

    taskList.add(_name);
    notifyListeners();
  }
}
