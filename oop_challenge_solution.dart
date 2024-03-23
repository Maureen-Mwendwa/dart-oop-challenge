// This technical assignment challenge is designed to assess a learner's understanding of object-oriented programming (OOP) in Dart. The challenge should be pushed to GitHub and the solution should be submitted via a link.
// The challenge is to create a program that has the following features:
// An object-oriented model that uses classes and inheritance
// A class that implements an interface
// A class that overrides an inherited method
// An instance of a class that is initialized with data from a file
// A method that demonstrates the use of a loop
import 'dart:io'; // Import the File class from dart:io

// 1. An object-oriented model that uses classes and inheritance
class ShoppingMall {
  String name;
  String location;
  int capacity;

  ShoppingMall(this.name, this.location, this.capacity);

  void displayInfo() {
    print(
        'Welcome to $name shopping mall. We are situated along $location. Our Mall has a capacity of $capacity stores to be rented.\n');
  }
}

class Restaurant extends ShoppingMall {
  String cuisine_type;
  int seating_capacity;
  String opening_hours;
  String customer_ratings;
  int restaurant_store_number;

  Restaurant(
      this.cuisine_type,
      this.seating_capacity,
      this.opening_hours,
      this.customer_ratings,
      this.restaurant_store_number,
      String name,
      String location)
      : super(name, location, 0);

  @override
  void displayInfo() {
    print(
        'Welcome to $cuisine_type restaurant situated at $name shopping mall, $location, store number $restaurant_store_number. Our food is well-known across the country. We have $seating_capacity seating capacity and are open from $opening_hours. Customer rating: $customer_ratings.\n');
  }
}

class ClothingStore extends ShoppingMall {
  String category;
  String style;
  String pricing_range;
  String smiley;
  String size_availability;

  ClothingStore(this.category, this.style, this.pricing_range, this.smiley,
      this.size_availability, String name, String location)
      : super(name, location, 0);

  void displayClothingInfo() {
    print(
        "Welcome to our $category Clothing store at $name shopping mall, $location. We offer $style wears with prices ranging from $pricing_range. We have $size_availability sizes available. $smiley \n");
  }
}

// 2. A class that implements an interface
abstract class Entertainment {
  void entertainCustomers();
}

class MovieTheater extends ShoppingMall implements Entertainment {
  List<String> currentMovies;

  MovieTheater(this.currentMovies, String name, String location)
      : super(name, location, 0);

  @override
  void entertainCustomers() {
    print('Current movies playing:');
    for (String movie in currentMovies) {
      print('- $movie');
    }
  }
}

void main() {
  // 4. An instance of a class that is initialized with data from a file
  // The data is in a file called "mall_data.txt".We first read the contents of the mall_data.txt file using File('mall_data.txt').readAsLinesSync(), which returns a list of strings, where each string is a line from the file.
  List<String> lines = File('mall_data.txt').readAsLinesSync();

// Then, we iterate over each line using a for loop.
// For each line, we split the data into parts using the comma (,) as a delimiter: List<String> parts = line.split(',').
  for (String line in lines) {
    List<String> parts = line.split(',');
    String classType = parts[
        0]; //This part (parts[0]) represents the type of class (e.g., ShoppingMall, Restaurant, ClothingStore, etc.).

    if (classType == 'ShoppingMall') {
      String name = parts[1];
      String location = parts[2];
      int capacity = int.parse(parts[3]);
      ShoppingMall mall = ShoppingMall(name, location, capacity);
      mall.displayInfo();
    } else if (classType == 'Restaurant') {
      String cuisine_type = parts[1];
      int seating_capacity = int.parse(parts[2]);
      String opening_hours = parts[3];
      String customer_ratings = parts[4];
      int restaurant_store_number = int.parse(parts[5]);
      String name = parts[6];
      String location = parts[7];
      Restaurant restaurant = Restaurant(
          cuisine_type,
          seating_capacity,
          opening_hours,
          customer_ratings,
          restaurant_store_number,
          name,
          location);
      restaurant.displayInfo(); // 3. A class that overrides an inherited method
    } else if (classType == 'ClothingStore') {
      String category = parts[1];
      String style = parts[2];
      String pricing_range = parts[3];
      String smiley = parts[4];
      String size_availability = parts[5];
      String name = parts[6];
      String location = parts[7];
      ClothingStore store = ClothingStore(category, style, pricing_range,
          smiley, size_availability, name, location);
      store.displayClothingInfo();
    } else if (classType == 'MovieTheater') {
      List<String> currentMovies =
          parts.sublist(1, 19); // Substring from index 1 to 18
      String name = parts[19];
      String location = parts[20];
      MovieTheater theater = MovieTheater(currentMovies, name, location);
      theater.entertainCustomers();
    } // 5. A method that demonstrates the use of a loop
  }
}
