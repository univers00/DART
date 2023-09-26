//each class have a single responsaility.
//if i want to change some stuff i will change in one class because each class have one responsibility.

//Simple exemple.

class ListProduct {
  final List<Product> listProdact = [];

  void add(Product product) {
    //code
  }
  void remove(Product product) {
    //code
  }

  void print() {
    //code
  }
}

class Product {
  final String? name;
  final int? price;
  final String? category;

  Product({this.name, this.price, this.category});
}
