class nurseryData {
  final String imageURL;
  final String ownerName;
  final String nurseryName;
  final String phoneNumber;
  final String city;
  final List<String> items;

  nurseryData(
      {required this.ownerName,
        required this.nurseryName,
      required this.items,
      required this.city,
      required this.imageURL,
      required this.phoneNumber});
}

List<nurseryData> marketplaceData = [
  nurseryData(
      nurseryName: "sample 1",
      items: ["soil", "plant", "flower"],
      city: "Gurgaon",
      imageURL:
          "https://images.unsplash.com/photo-1604762524889-3e2fcc145683?q=80&w=1771&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      phoneNumber: "9817235463", ownerName: 'Raj'),
  nurseryData(
      nurseryName: "sample 2",
      items: ["soil", "plant", "flower"],
      city: "Gurgaon",
      imageURL:
          "https://images.unsplash.com/photo-1604762524889-3e2fcc145683?q=80&w=1771&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      phoneNumber: "9817635463", ownerName: 'Rahul')
];


