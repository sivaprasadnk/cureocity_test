import 'package:country_app/data/entity/country_entity.dart';
import 'package:country_app/domain/model/country_model.dart';
import 'package:hive_ce/hive.dart';

part 'hive_adaptors.g.dart';

@GenerateAdapters([AdapterSpec<CountryEntity>()])
class HiveAdapters {}
