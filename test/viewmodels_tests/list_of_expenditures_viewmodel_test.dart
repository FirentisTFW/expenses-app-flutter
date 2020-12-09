import 'package:Expenses_app/ui/views/list_of_expenditures/list_of_expenditures_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../setup/test_helpers.dart';

void main() {
  group('ListOfExpendituresViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('fetchData -', () {
      test('When called, should get all expenditures from ExpendituresService',
          () async {
        var _expendituresService = getAndRegisterExpendituresServiceMock();
        var model = ListOfExpendituresViewModel();
        await model.fetchData();
        verify(_expendituresService.getAllExpenditures());
      });
    });
  });
}
