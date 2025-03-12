import 'package:country_app/presentation/bloc/country_bloc/country_bloc.dart';
import 'package:country_app/presentation/bloc/country_bloc/country_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Countries List')),
      body: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          if (state.isLoading!) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.isError!) {
            return Center(child: Text('Something went wrong!'));
          }
          if (state.countryList != null && state.countryList!.isEmpty) {
            return Center(child: Text('No items!'));
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.countryList!.length,
            itemBuilder: (context, index) {
              var item = state.countryList![index];
              return ListTile(title: Text(item.name ?? " name"));
            },
          );
        },
      ),
    );
  }
}
