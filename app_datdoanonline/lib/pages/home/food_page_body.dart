import 'package:app_datdoanonline/pages/food/banchay_food_detail.dart';
import 'package:app_datdoanonline/widgets/Icon_and_text_widget.dart';
import 'package:app_datdoanonline/widgets/app_column.dart';
import 'package:app_datdoanonline/widgets/big_text.dart';
import 'package:app_datdoanonline/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  // Danh sách dữ liệu giỏ hàng
  final List<Map<String, dynamic>> cartData = [];
  final List<Map<String, dynamic>> favoritesData = [];
  int totalItemsInCart = 0;

  final List<Map<String, String>> pageData = [
    {"image": "assets/images/chicken.png", "title": "Texas Chicken"},
    {"image": "assets/images/pho.png", "title": "Phở truyền thống"},
    {"image": "assets/images/whitecheese.png", "title": "White Cheese Chicken"},
    {"image": "assets/images/bundau.png", "title": "Bún đậu mắm tôm"},  
    {"image": "assets/images/highland.png", "title": "Highlands"},
    {"image": "assets/images/banhbeo.png", "title": "Bánh bèo chén"},
    {"image": "assets/images/pizzaa.png", "title": "Pizza"},
    {"image": "assets/images/chao.png", "title": "Cháo bò băm"},
    {"image": "assets/images/burger.png", "title": "Burger"},



  ];

  final List<Map<String, String>> listData = [
  {
    "image": "assets/images/chicken.png",
    "title": "Gà Nướng BBQ",
    "description": "Gà nướng BBQ thơm ngon, đậm vị với công thức gia truyền.",
    "rating": "4.8" ,
    "distance": "3.3",
    "time": "27 phút",
    "price": "120,000đ"
  },
  {
    "image": "assets/images/whitecheese.png",
    "title": "White Cheese Chicken",
    "description": "Gà giòn Cajun kết hợp sốt phô mai trắng thơm lừng, béo ngậy.",
    "rating":  "4.9",
    "distance": "2.8",
    "time": "24 phút",
    "price": "94,000đ"
  },
  {
    "image": "assets/images/pizzaa.png",
    "title": "Pizza Ý",
    "description": "Pizza kiểu Ý với đế mỏng giòn, topping phong phú.",
    "rating": "4.7" ,
    "distance": "3.6",
    "time": "30 phút",
    "price": "189,000đ"
  },
  {
    "image": "assets/images/burger.png",
    "title": "Burger Phô Mai",
    "description": "Burger phô mai ngon đậm đà, thịt bò nướng chín vừa.",
    "rating": "4.8" ,
    "distance": "3",
    "time": "24 phút",
    "price": "45,000đ"
  },
  {
    "image": "assets/images/gongcha.png",
    "title": "Trà Sữa Gong Cha",
    "description": "Trà sữa thơm ngon, ngọt ngào với lớp kem cheese đặc biệt.",
    "rating": "4.8" ,
    "distance": "4",
    "time": "30 phút",
    "price": "49,000đ"

  },
  {
    "image": "assets/images/koi.png",
    "title": "Trà Sữa Koi",
    "description": "Trà sữa Koi ngon, chuẩn vị với topping trân châu đen mềm dẻo.",
    "rating": "4.7" ,
    "distance": "3.2",
    "time": "26 phút",
    "price": "64,000đ"

  },
  {
    "image": "assets/images/miy.png",
    "title": "Mì Ý Bò Bằm",
    "description": "Mì Ý với sốt bò bằm, hương vị đặc trưng Ý.",
    "rating": "4.8" ,
    "distance": "2.8",
    "time": "24 phút",
    "price": "50,000đ"

  },
  {
    "image": "assets/images/chao.png",
    "title": "Cháo bò băm",
    "description": "Cháo bò băm nóng hổi, ngon miệng.",
    "rating": "4.9" ,
    "distance": "2.1",
    "time": "20 phút",
    "price": "45,000đ"

  },
  {
    "image": "assets/images/banhbeo.png",
    "title": "Bánh bèo chén",
    "description": "Bánh bèo chén đậm đà, hấp dẫn.",
    "rating": "4.9" ,
    "distance": "2.5",
    "time": "22 phút",
    "price": "35,000đ"

  },
  {
    "image": "assets/images/banhkhoai.png",
    "title": "Bánh khoái",
    "description": "Bánh khoái giòn rụm, ăn kèm rau sống và tôm.",
    "rating": "4.8" ,
    "distance": "3",
    "time": "24 phút",
    "price": "25,000đ"

  },
  {
    "image": "assets/images/bundau.png",
    "title": "Bún đậu mắm tôm",
    "description": "Bún đậu mắm tôm truyền thống, đậm đà hương vị.",
    "rating": "4.8" ,
    "distance": "3.7",
    "time": "30 phút",
    "price": "30,000đ"

  },
  {
    "image": "assets/images/highland.png",
    "title": "Freeze Trà Xanh",
    "description": "Trà xanh mát lạnh, phù hợp với mùa hè.",
    "rating": "4.9" ,
    "distance": "2.3",
    "time": "20 phút",
    "price": "65,000đ"

  },
  {
    "image": "assets/images/pho.png",
    "title": "Phở Truyền Thống",
    "description": "Phở bò truyền thống Việt Nam với nước dùng thanh ngọt.",
    "rating": "4.9" ,
    "distance": "2.9",
    "time": "22 phút",
    "price": "45,000đ"

  },
];


  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void updateCart(String title, String image, int quantity) {
    setState(() {
      // Kiểm tra sản phẩm đã có trong giỏ hàng chưa
      int index = cartData.indexWhere((item) => item['title'] == title);
      if (index != -1) {
        // Nếu đã có thì cập nhật số lượng
        cartData[index]['quantity'] += quantity;
      } else {
        // Nếu chưa có thì thêm mới
        cartData.add({
          'title': title,
          'image': image,
          'quantity': quantity,
        });
      }
      // Cập nhật tổng số lượng
      totalItemsInCart += quantity;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          child: PageView.builder(
            controller: pageController,
            itemCount: pageData.length,
            itemBuilder: (context, position) {
              return _buildPageItem(position, pageData[position]);
            },
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 2000,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: listData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => BanchayFoodDetail(
                        title: listData[index]['title']!,
                        image: listData[index]['image']!,
                        description: listData[index]['description']!,
                        price: double.parse(listData[index]['price']!.replaceAll('đ', '').replaceAll(',', '')),
                        onAddToCart: updateCart,
                      ));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white38,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(listData[index]["image"]!),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(10),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: listData[index]["title"]!),
                                SizedBox(height: 10),
                                SmallText(text: listData[index]["description"]!),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    IconAndTextWidget(
                                      icon: Icons.star,
                                      text: "${listData[index]["rating"]} ",
                                      iconColor: Colors.yellow,
                                    ),
                                    IconAndTextWidget(
                                      icon: Icons.location_on,
                                      text: "${listData[index]["distance"]} km  ",
                                      iconColor: Color(0xFF89dad0),
                                    ),
                                    IconAndTextWidget(
                                      icon: Icons.access_time_rounded,
                                      text: listData[index]["time"]!,
                                      iconColor: Colors.black,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            if (totalItemsInCart > 0)
                              Positioned(
                                top: 2,
                                right: 2,
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '$totalItemsInCart',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index, Map<String, String> data) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale = _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = _scaleFactor;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Colors.pink[200] : const Color(0xFF69c5df),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(data["image"]!),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: AppColumn(text: data["title"]!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
