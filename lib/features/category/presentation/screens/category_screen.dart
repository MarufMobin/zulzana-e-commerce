import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/presentation/screens/providers/main_nav_holder_provider.dart';
import '../../../shared/presentation/widgets/category_card.dart';
import '../providers/category_list_provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  final ScrollController _scrollController = ScrollController();
  late final CategoryListProvider _categoryListProvider;

  @override
  void initState() {
    super.initState();
    _categoryListProvider = context.read<CategoryListProvider>();
    _scrollController.addListener(_loadMore);
  }

  void _loadMore() {
    if ((_categoryListProvider.isLoading == false) &&
        _scrollController.position.extentBefore < 300) {
      _categoryListProvider.getCategoryData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) => _backToHome(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Category'),
          leading: IconButton(
            onPressed: _backToHome,
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: ChangeNotifierProvider.value(
          value: _categoryListProvider,
          child: Consumer(
            builder: (context, _, _) {
              if (_categoryListProvider.isInitialLoading) {
                return CircularProgressIndicator();
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        controller: _scrollController,
                        itemCount: _categoryListProvider.categoryList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          return FittedBox(child: CategoryCard());
                        },
                      ),
                    ),
                    if (_categoryListProvider.isLoadingMore)
                      LinearProgressIndicator(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _backToHome() {
    context.read<MainNavHolderProvider>().backToHome();
  }
}
