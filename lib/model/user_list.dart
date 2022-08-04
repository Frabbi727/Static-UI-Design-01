class User {
  String name;
  String followers;
  String? url;
  String? address;
  String? following;

  User({
    required this.name,
    required this.followers,
    this.url,
    this.address,
    this.following,
  });
}

List<User> userList = [
  User(
    name: 'Abir',
    followers: '104',
    url: 'https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png',
  ),
  User(
    name: 'Bisal',
    followers: '99',
    address: 'Malibag Chodhori Para',
    following: '12'

  ),
  User(
    name: 'Canada',
    followers: '55',
    address:  'Damma Dhaka',
  ),
  User(
    name: 'Das',
    followers: '45',
  ),
  User(
    name: 'Emmy',
    followers: '95',
  ),
  User(
    name: 'Rabbi',
    followers: '5',
  ),
  User(
    name: 'Ronto',
    followers: '50',
  ),
  User(
    name: 'Fency',
    followers: '75',
  ),
  User(
    name: 'Germany',
    followers: '1465',
  ),
  User(
    name: 'Himaloy',
    followers: '321',
  ),
  User(
    name: 'Iras',
    followers: '001',
  ),
  User(
    name: 'Jesmin',
    followers: '1478',
  ),
  User(
    name: 'Kenedy',
    followers: '55',
  ),
  User(
    name: 'Zaman',
    followers: '147',
  ),
  User(
    name: 'Yeamin',
    followers: '33',
  ),
  User(
    name: 'Usha',
    followers: '120',
  )
];
