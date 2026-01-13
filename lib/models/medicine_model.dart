class Medicine {
  int? id;
  final String name;
  final String dose;
  final String time;

  Medicine({
    this.id,
    required this.name,
    required this.dose,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'dose': dose, 'time': time};
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      id: map['id'],
      name: map['name'],
      dose: map['dose'],
      time: map['time'],
    );
  }
}
