import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:country_app/core/locator.dart';
import 'package:country_app/presentation/bloc/country_bloc/country_bloc.dart';
import 'package:country_app/presentation/bloc/country_bloc/country_event.dart';
import 'package:country_app/presentation/bloc/country_bloc/country_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOnline = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      locator<Connectivity>().onConnectivityChanged.listen((result) {
        isOnline = !result.contains(ConnectivityResult.none);
        setState(() {});
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Countries List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search country...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                context.read<CountryBloc>().add(SearchCountryEvent(value));
              },
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<CountryBloc>().add(GetCountryEvent());
              },
              child: BlocBuilder<CountryBloc, CountryState>(
                builder: (context, state) {
                  if (state.isLoading!) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.isError!) {
                    return Center(child: Text(state.errorMessage ?? 'Error'));
                  }
                  if (state.countryList != null && state.countryList!.isEmpty) {
                    return const Center(child: Text('No items!'));
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.countryList!.length,
                    itemBuilder: (context, index) {
                      var item = state.countryList![index];
                      var title = "${item.name!} (${item.code})";
                      return ListTile(
                        title: Text(title),
                        leading: Text(
                          item.emoji!,
                          style: const TextStyle(fontSize: 24),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
