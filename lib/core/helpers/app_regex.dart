class AppRegex {
  // At least one uppercase letter
  static final RegExp _hasUpperCase = RegExp(r'[A-Z]');

  // At least one lowercase letter
  static final RegExp _hasLowerCase = RegExp(r'[a-z]');

  // At least one digit
  static final RegExp _hasDigit = RegExp(r'\d');

  // At least one special character
  static final RegExp _hasSpecialChar = RegExp(r'[@$!%*?&]');

  // Minimum 8 characters
  static const int _minLength = 8;

  // Email validation (RFC 5322 simplified)
  static final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  /// ✅ Password rules
  static bool hasUpperCase(String input) => _hasUpperCase.hasMatch(input);

  static bool hasLowerCase(String input) => _hasLowerCase.hasMatch(input);

  static bool hasDigit(String input) => _hasDigit.hasMatch(input);

  static bool hasSpecialCharacter(String input) =>
      _hasSpecialChar.hasMatch(input);

  static bool hasMinLength(String input) => input.length >= _minLength;

  /// ✅ Full password validation (all rules combined)
  static bool isPasswordValid(String input) {
    return hasUpperCase(input) &&
        hasLowerCase(input) &&
        hasDigit(input) &&
        hasSpecialCharacter(input) &&
        hasMinLength(input);
  }

  /// ✅ Email validation
  static bool isEmailValid(String input) => _emailRegex.hasMatch(input);
}
