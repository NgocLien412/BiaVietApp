
import '../beer.dart';

class AllProductsRepository {
  // Static list of beers available for the All Products page
  static final List<Beer> allProducts = [

    Beer(
      name: '7 Bridges Beach Blonde',
      price: 47000,
      description: 'Most famous in VN',
      imagePath: 'images/DocLaVN/7Bridges_Beach.png',
    ),

    Beer(
      name: '7 Bridges Dragon IPA',
      price: 48000,
      description: 'Most famous in VN',
      imagePath: 'images/DocLaVN/7Bridges_DragonIPA.png',
    ),

    Beer(
      name: 'Hoprizon Ra Khơi',
      price: 24000,
      description: 'Most famous in VN',
      imagePath: 'images/DocLaVN/RaKhoi.png',
    ),

    Beer(
        name: 'Hoprizon Gió Biển',
        price: 24000,
        description: 'Hương vị phiêu lưu',
        imagePath: 'images/DocLaVN/GioBien.png'),


    Beer(
        name: "Lowen Pils",
        price: 200000,
        description: 'Bia của người sành điệu',
        imagePath: 'images/DocLaVN/LowenPils.png'),

    Beer(
        name: "Sài Gòn Rosé",
        price: 120000,
        description: 'A Rosé for women',
        imagePath: 'images/DocLaVN/SGRose.png'),

    Beer(
        name: "Coffee Vanilla Porter",
        price: 120000,
        description: '',
        imagePath: 'images/DocLaVN/EWCoffee.png'),

    Beer(
        name: "Far East Ipa",
        price: 120000,
        description: '',
        imagePath: 'images/DocLaVN/FarEast.png'),

    Beer(
        name: "Pacific Pilsner",
        price: 120000,
        description: '',
        imagePath: 'images/DocLaVN/Pacific.png'),

    // Add more products here as needed
  ];
}
