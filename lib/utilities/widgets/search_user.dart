
import 'package:learning_1ui_6228/model/user_list.dart';

class SearchUser {
  void searchUser(String enteredData){
    print('entered word + ${enteredData}');
    searchedList = [];
    for(int i=0; i<userList.length; i++){
      if(userList[i].name.toLowerCase().contains(enteredData.toLowerCase())){
        searchedList.add(userList[i]);
      }
    }
  }
}
List<User> searchedList = [];