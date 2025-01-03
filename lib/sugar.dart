
import 'package:get_it/get_it.dart';
import 'package:stroll/res/app_theme.dart';
import 'package:stroll/services/bonfire_service.dart';
import 'package:stroll/services/chats_service.dart';
import 'package:stroll/services/user_service.dart';

AppTheme get theme => GetIt.I<AppTheme>();
ChatsService get chatsService => GetIt.I<ChatsService>();
BonfireService get bonfireService => GetIt.I<BonfireService>();
UserService get userService => GetIt.I<UserService>();

Future<void> initServices() async {

  GetIt getIt = GetIt.instance;

  getIt.registerSingleton<AppTheme>(AppTheme());
  getIt.registerSingleton<ChatsService>(ChatsService());
  getIt.registerSingleton<BonfireService>(BonfireService());
  getIt.registerSingleton<UserService>(UserService());

}