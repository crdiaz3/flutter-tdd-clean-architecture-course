// Imports the Flutter Driver API.
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/number_trivia_keys.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../helpers/driver_helper.dart';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
    // mockHttpClient = MockHttpClient();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  setUp(() async {
    await driver.requestData(DriverCommand.restart.toString());
  });

  test('test launch', () async {
    final numberTriviaPage = find.byValueKey(NumberTriviaKeys.page);
    await driver.waitFor(numberTriviaPage);
  });
}
