import 'package:clean/Features/home/presentation/manager/featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:clean/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFeaturedBooksCubit, FetchFeaturedBooksState>(
      builder: (context, state) {
        if(state is FetchFeaturedBooksSuccess){
          return  FeaturedBooksListView(
            books: state.books,
          );
        }else if(state is FetchFeaturedBooksFailure){
          return Text(state.errMessage);
        }else{
          return const Center(child:CircularProgressIndicator());
        }}
    );
  }
}