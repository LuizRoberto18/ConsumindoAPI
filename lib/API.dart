//pegar os dados da url abrir o json to dart e criar as clases
class Api {
  int id;
  String nome;
  String nomeDeUsuRio;
  String email;
  Morada morada;
  String telefone;
  String site;
  Empresa empresa;

  Api(
      {this.id,
      this.nome,
      this.nomeDeUsuRio,
      this.email,
      this.morada,
      this.telefone,
      this.site,
      this.empresa});

  Api.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    nomeDeUsuRio = json['nome de usuário'];
    email = json['email'];
    morada =
        json['Morada'] != null ? new Morada.fromJson(json['Morada']) : null;
    telefone = json['telefone'];
    site = json['site'];
    empresa =
        json['empresa'] != null ? new Empresa.fromJson(json['empresa']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['nome de usuário'] = this.nomeDeUsuRio;
    data['email'] = this.email;
    if (this.morada != null) {
      data['Morada'] = this.morada.toJson();
    }
    data['telefone'] = this.telefone;
    data['site'] = this.site;
    if (this.empresa != null) {
      data['empresa'] = this.empresa.toJson();
    }
    return data;
  }
}

class Morada {
  String rua;
  String suite;
  String cidade;
  String cEP;
  Geo geo;

  Morada({this.rua, this.suite, this.cidade, this.cEP, this.geo});

  Morada.fromJson(Map<String, dynamic> json) {
    rua = json['rua'];
    suite = json['suite'];
    cidade = json['cidade'];
    cEP = json['CEP'];
    geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rua'] = this.rua;
    data['suite'] = this.suite;
    data['cidade'] = this.cidade;
    data['CEP'] = this.cEP;
    if (this.geo != null) {
      data['geo'] = this.geo.toJson();
    }
    return data;
  }
}

class Geo {
  String lat;
  String lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Empresa {
  String nome;
  String catchPhrase;
  String bs;

  Empresa({this.nome, this.catchPhrase, this.bs});

  Empresa.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['catchPhrase'] = this.catchPhrase;
    data['bs'] = this.bs;
    return data;
  }
}
