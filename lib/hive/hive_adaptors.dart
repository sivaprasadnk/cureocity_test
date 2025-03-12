import 'package:country_app/data/model/country_model.dart';
import 'package:hive_ce/hive.dart';

part 'hive_adaptors.g.dart';

@GenerateAdapters([AdapterSpec<CountryModel>()])
class HiveAdapters {}
