import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:readmore/readmore.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedpageState createState() => _FeedpageState();
}

class _FeedpageState extends State<FeedPage> {
  int activeIndex = 0;

  final images = [
    'https://p7.hiclipart.com/preview/729/192/1024/computer-icons-instagram-logo-sticker-logo.jpg',
    'https://th.bing.com/th/id/R.9c9457c37b953dff07607ed79de4c4c8?rik=K8WHzAonVwcfxw&riu=http%3a%2f%2ffarm1.static.flickr.com%2f194%2f512689405_260eab4ff5_o.jpg&ehk=9i1%2fWktVBZR6u8yzYZWV7HL4E1lrm85rjViRKy%2bRTgA%3d&risl=&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/R.5be3b3a33c2aa7dca0387f361dab91b5?rik=1%2b8omMqBMI0vpA&riu=http%3a%2f%2fwww.wallpaper-box.com%2fcat%2f19201080%2fimages%2fcat66.jpg&ehk=beiSILAamy3G69Q8mnxMM9Yro4A5owy4iq3y4Dgc4lg%3d&risl=&pid=ImgRaw&r=0',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('フィード')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        'https://www.juku90.com/wp-content/uploads/2017/12/instagram_logo.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Instagram',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Icon(
                              Icons.verified,
                              size: 14,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        Text(
                          'サンディエゴ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.more_horiz,
                        size: 16,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Stack(children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CarouselSlider.builder(
                              options: CarouselOptions(
                                height: 460,
                                initialPage: 0,
                                viewportFraction: 1,
                                enlargeCenterPage: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    activeIndex = index;
                                  });
                                },
                              ),
                              itemCount: images.length,
                              itemBuilder: (context, index, realIndex) {
                                final path = images[index];
                                return InstagramPostItem(imageUrl: path);
                              },
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                IconButton(
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.chat_bubble_outline,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.send_outlined,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  onPressed: () {},
                                ),
                                const SizedBox(width: 35),
                                Expanded(child: buildIndicator()),
                                const SizedBox(width: 80),
                                IconButton(
                                  icon: const Icon(
                                    Icons.bookmark_border,
                                    color: Colors.black,
                                    size: 35,
                                  ),
                                  onPressed: () {},
                                ),
                                const SizedBox(width: 20),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -1,
                    top: -5,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        '${activeIndex + 1}/3  ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ])
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  '「 いいね！」 3000件',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                SizedBox(width: 20),
                Expanded(
                  child: ReadMoreText(
                    'nice!!!!!!!!!!!',
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '続きを読む',
                    trimExpandedText: '閉じる',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: images.length,
      effect: const WormEffect(
        dotColor: Colors.grey,
        activeDotColor: Colors.blue,
        dotHeight: 8,
        dotWidth: 8,
        spacing: 6,
      ),
    );
  }
}

class InstagramPostItem extends StatelessWidget {
  const InstagramPostItem({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl, fit: BoxFit.cover);
  }
}
