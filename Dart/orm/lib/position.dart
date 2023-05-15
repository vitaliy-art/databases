enum Position {
  staffer,
  manager,
  boss;

  @override
  String toString() {
    switch (this) {
      case Position.staffer:
        return "Staffer";
      case Position.manager:
        return "Manager";
      case Position.boss:
        return "Boss";
    }
  }
}
