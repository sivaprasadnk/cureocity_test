abstract class CountryEvent {}

class GetCountryEvent extends CountryEvent {}
class SearchCountryEvent extends CountryEvent {
  String query;
  SearchCountryEvent(this.query);
}
