import '../../mvc_template/injection_container.dart';
import './AuthPage.dart';
import "./AuthNav.dart";
import 'package:go_router/go_router.dart';

class AuthRoute {
  final routeTree = GoRoute(
    builder: (context, state) {
      return getIt<AuthPage>();
    },

    //this redirect act like route guard
    //if you want to redirect your page to other places by condition decomment this
    //redirect: (context, state) {
    //  if (true) {
    //    return null;
    //  } else {
    //    return null;
    //  }
    //},
    path: "/Auth",
    name: "Auth Products",
  );
  /*
    children: [
      TripletNTreeNode<TripletRoute>(
        value: TripletRoute(page: "", uri: "ManageSize", name: "Manage Size"),
      ),
      TripletNTreeNode<TripletRoute>(
        value: TripletRoute(page: "", uri: "ManageType", name: "Manage Type"),
      ),
      TripletNTreeNode<TripletRoute>(
        value: TripletRoute(page: "", uri: "ManagePrice", name: "Manage Price"),
      ),
      TripletNTreeNode<TripletRoute>(
        value: TripletRoute(
            page: "", uri: "ManageCategory", name: "Manage Category"),
      ),
      TripletNTreeNode<TripletRoute>(
        value: TripletRoute(
            page: "", uri: "Auth", name: "Manage Product"),
      ),
    ],*/
  late var route;
  AuthRoute() {
    //if you want to add static nav please add this
    //builder is AuthNav
    //route = ShellRoute(builder: AuthNav, routes: [routeTree]);

    //if you want to create page without nav please un command this
    //builder is AuthPage
    route = routeTree;
  }
}

/*
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
      },
      routes: <RouteBase>[
      ],
    ),
    */
