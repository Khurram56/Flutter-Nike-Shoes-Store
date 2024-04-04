import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/pages/about.dart';
import 'package:go_router_sample/pages/basketball_shoes.dart';
import 'package:go_router_sample/pages/contact_us.dart';
import 'package:go_router_sample/pages/cricket_shoes.dart';
import 'package:go_router_sample/pages/error_page.dart';
import 'package:go_router_sample/pages/home.dart';
import 'package:go_router_sample/pages/lifestyle_shoes.dart';
import 'package:go_router_sample/pages/profile.dart';
import 'package:go_router_sample/pages/new_page.dart';
import 'package:go_router_sample/pages/running_shoes.dart';
import 'package:go_router_sample/pages/settings.dart';
import 'package:go_router_sample/pages/productDetailsScreen.dart';
import 'package:go_router_sample/project/routes/app_route_constants.dart';

class NyAppRouter {
  static GoRouter returnRouter(bool isAuth) {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: MyAppRouteConstants.homeRouteName,
          path: '/',
          pageBuilder: (context, state) {
            return MaterialPage(child: Home());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.profileRouteName,
          path: '/profile/:username/:userid',
          pageBuilder: (context, state) {
            return MaterialPage(
                child: Profile(
              userid: state.params['userid']!,
              username: state.params['username']!,
            ));
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.aboutRouteName,
          path: '/about',
          pageBuilder: (context, state) {
            return MaterialPage(child: About());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.contactUsRouteName,
          path: '/contact_us',
          pageBuilder: (context, state) {
            return MaterialPage(child: ContactUS());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.NewPageRouteName,
          path: '/new_page',
          pageBuilder: (context, state) {
            return MaterialPage(child: NewPage());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.SettingsRouteName,
          path: '/settings',
          pageBuilder: (context, state) {
            return MaterialPage(child: Settings());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.lifestyle_shoesRouteName,
          path: '/lifestyle_shoes',
          pageBuilder: (context, state) {
            return MaterialPage(child: LifestyleShoesGridView());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.basketball_shoes_shoesRouteName,
          path: '/basketball_shoes',
          pageBuilder: (context, state) {
            return MaterialPage(child: BasketBallShoesGridView());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.running_shoes_shoesRouteName,
          path: '/running_shoes',
          pageBuilder: (context, state) {
            return MaterialPage(child: RunningShoesGridView());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.cricket_shoes_shoesRouteName,
          path: '/cricket_shoes',
          pageBuilder: (context, state) {
            return MaterialPage(child: CricketShoesGridView());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.ProductDetailRouteName,
          path: '/productDetailsScreen',
          pageBuilder: (context, state) {
            return MaterialPage(
                child: ProductDetailScreen(
              imagePath: '',
              description: '',
            ));
          },
        ),
      ],
      errorPageBuilder: (context, state) {
        return MaterialPage(child: ErrorPage());
      },
      redirect: (context, state) {
        // if (!isAuth &&
        //     state.location
        //         .startsWith('/${MyAppRouteConstants.profileRouteName}')) {
        if (!isAuth) {
          return context.namedLocation(MyAppRouteConstants.contactUsRouteName);
        } else {
          return null;
        }
      },
    );
    return router;
  }
}
