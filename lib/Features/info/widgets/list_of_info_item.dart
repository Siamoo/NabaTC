import 'package:firebase1/Features/info/widgets/custom_info_image.dart';

class InfoData {
  final String name;
  final String description;
  final CustomInfoImage customInfoImage;

  InfoData({
    required this.customInfoImage,
    required this.name,
    required this.description,
  });
}

List<InfoData> infoList = [
  InfoData(
    name: 'Water Wisely',
    description:
        '1. Water plants only when needed—overwatering can rot roots, and underwatering dries them out. \n2. Use techniques like drip irrigation or early morning watering to reduce evaporation. ',
    customInfoImage:
        const CustomInfoImage(infoImageName: 'asset/images/plant_a5.jpg'),
  ),
  InfoData(
    name: 'Use Natural Fertilizers',
    description:
        '1. Compost kitchen and garden waste to make organic fertilizer. \n2. Avoid chemical fertilizers that can damage plant health and soil microorganisms.',
    customInfoImage:
        const CustomInfoImage(infoImageName: 'asset/images/plant_a3.jpg'),
  ),
  InfoData(
    name: 'Protect from Pests Responsibly',
    description:
        '1. Use natural pest repellents (like neem oil).\n2. Introduce beneficial insects like ladybugs or praying mantises.',
    customInfoImage:
        const CustomInfoImage(infoImageName: 'asset/images/plant_a7.jpg'),
  ),
  InfoData(
    name: 'Avoid Cutting Trees and Wild Plants',
    description:
        '1. Don’t cut trees or uproot wild plants unnecessarily. \n2. Promote afforestation and tree-planting drives in your community.',
    customInfoImage:
        const CustomInfoImage(infoImageName: 'asset/images/plant_a1.jpg'),
  ),
  InfoData(
    name: 'Plant More Native Species',
    description:
        '1. Native plants adapt better, need less maintenance, and support local ecosystems.\n2. Planting more native species is one of the best ways to support the environment.',
    customInfoImage:
        const CustomInfoImage(infoImageName: 'asset/images/plant_a4.jpg'),
  ),
  InfoData(
    name: 'Reduce Pollution',
    description: '1. Avoid burning waste, using harmful pesticides, or littering around plant areas. \n2. Support clean air and soil through sustainable habits.',
    customInfoImage:
        const CustomInfoImage(infoImageName: 'asset/images/plant_a8.jpg'),
  ),
  InfoData(
    name: 'Thank You',
    description: '1. Thank you for reading this. \n2. We\'re happy because you need to help our community',
    customInfoImage:
        const CustomInfoImage(infoImageName: 'asset/images/plant_a6.jpg'),
  ),
];
