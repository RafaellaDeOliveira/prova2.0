class Carro {
  final int? id;
  final String marca;
  final String anoFabricacao;
  final String placa;
  final String valorRevenda;

  Carro(
      {this.id,
      required this.marca,
      required this.anoFabricacao,
      required this.placa,
      required this.valorRevenda});

  Map<String, dynamic> toJson() => {
        '_id': id,
        'marca': marca,
        'anoFabricacao': anoFabricacao,
        'placa': placa,
        'valorRevenda': valorRevenda,
      };

  factory Carro.fromJson(Map<String, dynamic> json) {
    return Carro(
      id: json['_id'],
      marca: json['marca'],
      anoFabricacao: json['anoFabricacao'],
      placa: json['placa'],
      valorRevenda: json['valorRevenda'],
    );
  }
}
