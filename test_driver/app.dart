// project-specific imports
import 'package:clean_architecture_tdd_course/main.dart' as app;
import 'helpers/driver_helper.dart';

// flutter-specific imports
import 'package:flutter_driver/driver_extension.dart';

void main() async {
  Future<String> dataHandler(String commandString) async {
    var command = DriverHelper.getDriverCommand(commandString);
    await app.main(
      environment: app.Environment.prod,
      command: command,
    );
    return 'complete';
  }

  // This line enables the extension.
  enableFlutterDriverExtension(handler: dataHandler);

  // Initialize dependencies specifying the environment.
  // environemtn is used to determine which services to be injected.
  await app.main(environment: app.Environment.prod);
}
