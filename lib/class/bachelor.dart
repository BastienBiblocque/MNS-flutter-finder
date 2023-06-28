class Bachelor {
  const Bachelor(
      {required this.firstName,
      required this.lastName,
      required this.gender,
      required this.avatar,
      this.searchFor,
      this.job,
      this.description});

  final String firstName;
  final String lastName;
  final Gender gender;
  final String avatar;
  final List<Gender>? searchFor;
  final String? job;
  final String? description;
}

enum Gender { men, women, other }
