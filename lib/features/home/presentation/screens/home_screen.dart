import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zulzana_e_commerce/features/shared/presentation/widgets/centered_progress_indicator.dart';

import '../../../shared/presentation/screens/providers/main_nav_holder_provider.dart';
import '../../../shared/presentation/widgets/product_card.dart';
import '../providers/home_sliders_provider.dart';
import '../widgets/HomeCategorySection.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/product_search_bar.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              ProductSearchBar(),
              Consumer<HomeSlidersProvider>(
                builder: (context, homeSliderProvider, _) {
                  if (homeSliderProvider.sliderInProgress) {
                    return SizedBox(
                      height: 180,
                      child: CenteredProgressIndicator(),
                    );
                  }
                  return HomeCarouselSlider(
                    sliders: homeSliderProvider.sliders,
                  );
                },
              ),
              SectionHeader(
                headerText: 'Category',
                onTabSeeAll: () {
                  context.read<MainNavHolderProvider>().navigateToCategory();
                },
              ),
              HomeCategorySection(),
              SectionHeader(
                headerText: 'Popular',
                onTabSeeAll: () {
                  context.read<MainNavHolderProvider>().navigateToCategory();
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [1, 2, 3, 4, 5].map((e) => ProductCard()).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
