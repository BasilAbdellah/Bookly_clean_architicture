import 'package:clean/Features/home/domain/entities/book_entity.dart';
import 'package:clean/constants.dart';
import 'package:clean/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';


void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(bookEntitiyAdapter());
  await Hive.openBox<bookEntitiy>(KFeaturedBox);
  await Hive.openBox<bookEntitiy>(KNewestBox);
  runApp(const Bookly());

}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
    );
  }
}
