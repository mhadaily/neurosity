///
class NeurosityCredentials {
  ///
  const NeurosityCredentials._({
    this.customToken,
    this.email,
    this.password,
    this.idToken,
    this.providerId,
  });

  ///
  factory NeurosityCredentials.withEmail({
    required String email,
    required String password,
  }) {
    return NeurosityCredentials._(
      email: email,
      password: password,
    );
  }

  ///
  factory NeurosityCredentials.withIdToken({
    required String idToken,
    required String providerId,
  }) {
    return NeurosityCredentials._(
      idToken: idToken,
      providerId: providerId,
    );
  }

  ///
  factory NeurosityCredentials.withCustomToken(
    String customToken,
  ) {
    return NeurosityCredentials._(
      customToken: customToken,
    );
  }

  ///
  final String? customToken;

  ///
  final String? email;

  ///
  final String? password;

  ///
  final String? idToken;

  ///
  final String? providerId;

  @override
  String toString() {
    return {
      'customToken': customToken,
      'email': email,
      'password': password,
      'idToken': idToken,
      'providerId': providerId,
    }.toString();
  }
}
