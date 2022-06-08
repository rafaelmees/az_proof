class UserModel {
  Profile? profile;
  String? email;
  String? token;
  String? id;

  UserModel({
    this.profile,
    this.email,
    this.token,
    this.id,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : Profile();
    email = json['email'];
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['profile'] = (profile ?? Profile()).toJson();
    _data['email'] = email;
    _data['token'] = token;
    _data['id'] = id;

    return _data;
  }
}

class Profile {
  String? name;

  Profile({
    this.name = '',
  });

  Profile.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['name'] = name;

    return _data;
  }
}
