import 'package:hive/hive.dart';

class AppCaching {
static late Box userBox;
static init(){
  userBox=Hive.box("userBox");
}

static cacheData(String key , value){
userBox.put(key, value);
}

static getCacheData (String key){
 return userBox.get(key);
}

} 