class Box {
  static int counter = 1;
  late int id;
  bool pressed = false;
  String label = '';

  Box() {
    id = counter;
    print(id);
    counter++;
  }
}
