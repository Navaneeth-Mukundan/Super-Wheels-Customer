import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:super_wheels_customer_app/src/auth/controller/auth_controller.dart';
import 'package:super_wheels_customer_app/src/home/controller/home_controller.dart';
import 'package:super_wheels_customer_app/src/myRide/controller/myride_controller.dart';
import 'package:super_wheels_customer_app/src/profile/controller/profile_controller.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => AuthController()),
  ChangeNotifierProvider(create: (context) => HomeController()),
  ChangeNotifierProvider(create: (context) => MyrideController()),
  ChangeNotifierProvider(create: (context) => ProfileController()),
];
