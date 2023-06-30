import 'package:finder/class/bachelor.dart';
import 'package:faker/faker.dart';
import 'dart:math';

class BachelorService {
  var faker = Faker();

  List<String> firstNameMan = [
    "Hugo",
    "Ethan",
    "Lucas",
    "Gabriel",
    "Arthur",
    "Louis",
    "Raphaël",
    "Jules",
    "Adam",
    "Maël",
    "Léo",
    "Liam",
    "Paul",
    "Nathan",
    "Gabin",
    "Sacha",
    "Noah",
    "Mohamed",
    "Tom",
    "Aaron",
    "Mathis",
  ];

  List<String> firstNameWoman = [
    "Lyne",
    "Léa",
    "Lola",
    "Inès",
    "Jade",
    "Louise",
    "Lina",
    "Léna",
    "Mila",
    "Rose",
    "Ambre",
    "Julia",
    "Alice",
    "Anna",
    "Juliette",
    "Zoé",
    "Camille",
    "Chloé",
    "Léna",
    "Léna",
  ];

  var rng = Random();

  List<Bachelor> getBachelors() {
    List<Bachelor> bachelors = [];

    bachelors = List.generate(
      15,
      (index) => Bachelor(
          firstName: firstNameMan[rng.nextInt(firstNameMan.length)],
          lastName: faker.person.lastName(),
          gender: Gender.men,
          description: faker.lorem.sentences(3).join(' '),
          avatar: 'images/man-${index + 1}.png'),
    );

    for (int i = 0; i < 15; i++) {
      bachelors.add(Bachelor(
          firstName: firstNameWoman[rng.nextInt(firstNameWoman.length)],
          lastName: faker.person.lastName(),
          gender: Gender.women,
          description: faker.lorem.sentences(3).join(' '),
          avatar: 'images/woman-${i + 1}.png'));
    }
    bachelors.shuffle();
    return bachelors;
  }
}
