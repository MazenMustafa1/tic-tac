class Player {
  String name;
  List<int> chosen = [];

  Player(this.name);

  void addChoice(int id) {
    chosen.add(id);
  }
}
