import 'package:flutter_redux_complete/core/redux/states/registration_state/registration_step.dart';
import 'package:meta/meta.dart' show immutable;
import 'package:copy_with_extension/copy_with_extension.dart';

// Generated code by @CopyWith
part 'registration_state.g.dart';

// NOTE:
// If you change any of the @CopyWith classes (or add new ones),
// you will need to run a command to re-generate the copyWith code.
//
// RUN THIS WHEN CHANGING ANY @CopyWith CLASS:
// $ flutter pub run build_runner build
//
// Altenatively, on VSCode, you can use the Command Palette > Run Build Task > Generate Flutter code
//
@immutable
@CopyWith()
class RegistrationState {
  // Initialize the default values here:
  const RegistrationState({
    String email,
    String username,
    RegistrationStep step
  }): this.email = email,
      this.username = username,
      this.step = step ?? RegistrationStep.FIRST;

  // Finally, the properties of this class:
  final String email;
  final String username;
  final RegistrationStep step;


}
