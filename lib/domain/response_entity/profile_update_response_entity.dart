class ProfileUpdateRE {
  final String? id;
  final String? createdAt;
  final String? name;
  final String? mail;
  final String? gender;
  final String? birthday;
  final String? location;
  final int? numberOfCars;
  final String? profile;

  ProfileUpdateRE({
    this.id,
    this.createdAt,
    this.name,
    this.mail,
    this.gender,
    this.birthday,
    this.location,
    this.numberOfCars,
    this.profile,
  });

  factory ProfileUpdateRE.fromMap(Map<String, dynamic> data) {
    return ProfileUpdateRE(
      id: data["id"],
      createdAt: data["createdAt"],
      name: data['name'] ?? '',
      mail: data['mail'] ?? '',
      gender: data['gender'] ?? '',
      birthday: data['birthday'] ?? '',
      location: data['location'] ?? '',
      numberOfCars: data['numberOfCars'] ?? '',
      profile: data['profile'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdAt': createdAt,
      'name': name,
      'mail': mail,
      'gender': gender,
      'birthday': birthday,
      'location': location,
      'numberOfCars': numberOfCars,
      'profile': profile,
    };
  }

  // Method to update the user model
  ProfileUpdateRE copyWith({
    String? id,
    String? createdAt,
    String? name,
    String? mail,
    String? gender,
    String? birthday,
    String? location,
    int? numberOfCars,
    String? profile,
  }) {
    return ProfileUpdateRE(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      mail: mail ?? this.mail,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      location: location ?? this.location,
      numberOfCars: numberOfCars ?? this.numberOfCars,
      profile: profile ?? this.profile,
    );
  }
}
