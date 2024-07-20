import 'package:clean/Features/home/data/DataSource/HomeLocaleDataSource.dart';
import 'package:clean/Features/home/data/DataSource/HomeRemoteDataSource.dart';
import 'package:clean/Features/home/data/repos/HomeRepoImpl.dart';
import 'package:clean/Features/home/domain/UseCases/FetchFeaturedBooksUseCase.dart';
import 'package:clean/Features/home/domain/UseCases/FetchNewestBooksUseCase.dart';
import 'package:clean/Features/home/domain/entities/book_entity.dart';
import 'package:clean/Features/home/presentation/manager/featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:clean/Features/home/presentation/manager/newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:clean/constants.dart';
import 'package:clean/core/utils/ApiService.dart';
import 'package:clean/core/utils/SimpleBlocObserver.dart';
import 'package:clean/core/utils/app_router.dart';
import 'package:clean/core/utils/functions/SetupServiceLocator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(bookEntitiyAdapter());
  SetupServiceLocator();
  await Hive.openBox<bookEntitiy>(KFeaturedBox);
  await Hive.openBox<bookEntitiy>(KNewestBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}




class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FetchFeaturedBooksCubit(
                FetchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>()
                )
            )..fetchFeaturedBooks();
          },
        ),
        BlocProvider(
          create: (context) {
            return FetchNewestBooksCubit(
                FetchNewestBooksUseCase(getIt.get<HomeRepoImpl>()));
          },
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
