class Formmodel {
  String name;
  String email;

  Formmodel({required this.name, required this.email});

  // Convert object to JSON (for API requests)
  Map<String, String> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}
