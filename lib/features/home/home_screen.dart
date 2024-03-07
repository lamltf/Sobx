import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sobx/base/ui/base_scaffold.dart';

class HomeScreen extends BaseScaffold {
  @override
  bool get isShowAppBar => false;

  @override
  double get padding => 16;

  @override
  Widget get bottomNavigationBar => Container(
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(Get.context!).padding.bottom,
            left: 16,
            right: 16),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: CupertinoTheme.of(Get.context!).primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.account_circle_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );

  @override
  Widget buildContent(BuildContext context) {
    return RefreshIndicator(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: HomeHeader(),
              pinned: true,
              floating: true,
            ),
            SliverToBoxAdapter(
              child: Container(),
            )
          ],
        ),
        onRefresh: () {
          return Future.value(true);
        });
  }
}

class HomeHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Hellow, wellcome :3'),
              SizedBox(height: 6),
              Text(
                'Nguyễn Văn A',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          )),
          CircleAvatar()
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 200;

  @override
  // TODO: implement minExtent
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
