import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/expenditure.dart';
import 'package:Expenses_app/services/functional_services/api.dart';

class ExpendituresService {
  final _api = locator<Api>();

  List<Expenditure> _expenditures;
  List<Expenditure> get expenditures => _expenditures;

  Future<List<Expenditure>> getLastExpenditures(int howMany) async {
    _expenditures = await _api.getLastExpenditures(howMany: 10);
    return _expenditures.reversed.toList();
  }

  Future<List<Expenditure>> getAllExpenditures() async {
    _expenditures = await _api.getAllExpenditures();
    return _expenditures.reversed.toList();
  }
}
