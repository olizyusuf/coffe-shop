class Menus {
  String? name;
  int? price;
  int? qty;
  String? size;
  String? image;

  Menus({this.name, this.price, this.qty, this.size, this.image});

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'qty': qty,
        'size': size,
        'image': image,
      };
}

List menus = [
  {
    'name': 'Hot Arabica Coffe',
    'price': 15000,
    'qty': 1,
    'size': 'S',
    'image': 'assets/images/coffeecup.png',
  },
  {
    'name': 'Cappucino',
    'price': 18000,
    'qty': 1,
    'size': 'S',
    'image': 'assets/images/cappuccino.png',
  },
  {
    'name': 'Hot Americano Coffe',
    'price': 17000,
    'qty': 1,
    'size': 'S',
    'image': 'assets/images/coffee-cup-black.png',
  },
  {
    'name': 'Frapucino',
    'price': 20000,
    'qty': 1,
    'size': 'S',
    'image': 'assets/images/frapucino.png',
  },
  {
    'name': 'Ice Black Coffe',
    'price': 16000,
    'qty': 1,
    'size': 'S',
    'image': 'assets/images/iced-coffee.png',
  }
];
