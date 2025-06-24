
import 'package:firebase1/Features/Home/widgets/custom_plant_image.dart';

class HomeData {
  final String name;
  final String description;
  final CustomHomePlantImage customHomePlantImage;

  HomeData({
    required this.customHomePlantImage,
    required this.name,
    required this.description,
  });
}


List<HomeData> homeList =[
  HomeData(customHomePlantImage: const CustomHomePlantImage(imageName: 'asset/images/EarlyBlight.jpg',), name: 'Early Blight', description: 'Early blight is a common and destructive disease affecting tomato plants, especially in warm and humid conditions. It typically begins on older, lower leaves with the appearance of brown spots that have characteristic concentric rings, resembling a target. As the disease progresses, the spots enlarge, leading to leaf yellowing and drop. If not controlled, it can severely defoliate the plant, expose fruit to sunscald, and reduce overall yield. The fungus survives in soil and plant debris, spreading through water splash, wind, and infected tools.'),
  HomeData(customHomePlantImage: const CustomHomePlantImage(imageName: 'asset/images/LateBlight.jpg',), name: 'Late Blight', description: 'Late blight is a fast-acting and potentially devastating disease that also caused the historic Irish potato famine. In tomatoes, it presents as large, irregular, water-soaked lesions on leaves and stems. These areas may appear greasy and quickly turn brown or black. In humid conditions, a white, fluffy mold may appear on the underside of the leaves. Fruit can also be infected, developing dark, firm, leathery spots. The disease spreads rapidly in cool, moist environments and can destroy entire crops in days if not managed.'),
  HomeData(customHomePlantImage: const CustomHomePlantImage(imageName: 'asset/images/BacterialSpeck.jpg',), name: 'Bacterial Speck', description: 'Bacterial speck causes small, dark, raised spots with yellow halos on leaves, stems, and green fruit. It thrives in cool, wet conditions and can spread rapidly through rain, irrigation, or contaminated tools. While the disease may not always affect yield drastically, it does reduce fruit quality and marketability. Lesions on fruit remain small but make tomatoes unsightly. Prevention includes seed treatment, resistant varieties, and copper-based sprays.'),
  HomeData(customHomePlantImage: const CustomHomePlantImage(imageName: 'asset/images/BacterialCanker.jpg',), name: 'Bacterial Canker', description: 'Bacterial canker is one of the most serious tomato bacterial diseases. Early symptoms include leaf edge wilting, especially on one side. As it progresses, plants may show brown streaks on stems and white fruit lesions with dark centers known as bird\'s-eye spots. The pathogen can enter through wounds and be seed-borne, making it hard to control. In advanced stages, entire plants may wilt and die. Strict sanitation, removal of infected plants, and seed disinfection are key to control.'),
  HomeData(customHomePlantImage: const CustomHomePlantImage(imageName: 'asset/images/TomatoMosaicVirus.jpg',), name: 'Tomato Mosaic Virus', description: 'This virus causes mottling, yellowing, and distortion of leaves, often resulting in a "fern-like" appearance. Infected plants may show stunted growth, brittle leaves, and poor fruit development. The virus is highly stable and can survive on tools, hands, and plant debris. It spreads mainly through mechanical contact rather than insect vectors. Though not always fatal, ToMV can significantly reduce yields and quality. Hygiene and resistant varieties are the best defenses.'),
  HomeData(customHomePlantImage: const CustomHomePlantImage(imageName: 'asset/images/TomatoYellowLeafCurlVirus.webp',), name: 'Tomato Yellow Leaf Curl Virus ', description: 'TYLCV is a destructive virus transmitted by whiteflies. It causes leaves to curl upward, turn yellow, and thicken. Infected plants are severely stunted and produce little or no fruit. Young plants infected early in development are often completely unproductive. It is prevalent in tropical and subtropical regions. Controlling the whitefly population and planting resistant cultivars are key to preventing outbreaks.'),
  HomeData(customHomePlantImage: const CustomHomePlantImage(imageName: 'asset/images/TomatoSpottedWiltVirus.jpg',), name: 'Tomato Spotted Wilt Virus', description: 'This virus is transmitted by thrips and can infect a wide range of plants. Symptoms include bronze or purple discoloration of young leaves, yellow or brown ring spots on foliage and fruit, and general stunting. Fruit may be distorted and show blotchy ripening. Infected plants cannot recover, and the disease spreads easily in greenhouses and fields. Control involves managing thrips populations and using virus-resistant tomato varieties.'),
];