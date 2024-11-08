// ignore_for_file: file_names

class Customer {
  final String firstName;
  final String lastName;
  final String email;

  Customer({required this.firstName, required this.lastName, required this.email});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
    );
  }
}
