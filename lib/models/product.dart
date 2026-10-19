class Product {
  final int id, price;
  final String title, subTitle, description, image;

  const Product({
    required this.id,
    required this.price,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.image,
  });
}

// list of products
const List<Product> products = [
  Product(
    id: 1,
    price: 59,
    title: "سماعات لاسلكية",
    subTitle: "جودة صوت عالية",
    image: "images/airpod.png",
    description:
        "سماعات لاسلكية بتقنية حديثة تمنحك صوت نقي وواضح مع عزل ممتاز للضوضاء. بطارية تدوم لساعات طويلة وتصميم مريح للاستخدام اليومي.",
  ),
  Product(
    id: 2,
    price: 1099,
    title: "جهاز موبايل",
    subTitle: "وأصبح للموبايل قوة",
    image: "images/mobile.png",
    description:
        "هاتف ذكي بأداء قوي ومعالج سريع، شاشة عالية الدقة وكاميرا احترافية. مناسب للألعاب والتصفح والتصوير بجودة ممتازة.",
  ),
  Product(
    id: 3,
    price: 39,
    title: "نظارات ثلاثية الأبعاد",
    subTitle: "لنقلك للعالم الافتراضي",
    image: "images/class.png",
    description:
        "نظارات واقع افتراضي تمنحك تجربة مشاهدة غامرة وممتعة. تصميم خفيف ومريح يدعم العديد من التطبيقات والألعاب.",
  ),
  Product(
    id: 4,
    price: 56,
    title: "سماعات رأس",
    subTitle: "لساعات استماع طويلة",
    image: "images/headset.png",
    description:
        "سماعات رأس مريحة مع صوت عميق وواضح. مثالية للاستماع للموسيقى أو إجراء المكالمات لفترات طويلة بدون إزعاج.",
  ),
  Product(
    id: 5,
    price: 68,
    title: "مسجل صوت",
    subTitle: "سجل اللحظات المهمة حولك",
    image: "images/speaker.png",
    description:
        "مسجل صوت عالي الجودة لالتقاط المحاضرات والاجتماعات بوضوح. سهل الاستخدام وخفيف الوزن مع ذاكرة تخزين جيدة.",
  ),
  Product(
    id: 6,
    price: 39,
    title: "كاميرا كمبيوتر",
    subTitle: "بجودة ودقة صورة عالية",
    image: "images/camera.png",
    description:
        "كاميرا ويب بدقة عالية للمكالمات والاجتماعات عبر الإنترنت. توفر صورة واضحة وأداء ممتاز في الإضاءة المختلفة.",
  ),
];
