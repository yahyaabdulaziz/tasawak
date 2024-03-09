import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasawak/data/model/response/category_dm.dart';
import 'package:tasawak/data/model/response/product_dm.dart';
import 'package:tasawak/domain/di/di.dart';
import 'package:tasawak/presentation/screens/main/tabs/home/home_tab_view_model.dart';
import 'package:tasawak/presentation/utils/app_assets.dart';
import 'package:tasawak/presentation/utils/base_request_states.dart';
import 'package:tasawak/presentation/utils/exentions.dart';
import 'package:tasawak/presentation/widgets/category_item.dart';
import 'package:tasawak/presentation/widgets/loading_widget.dart';
import 'package:tasawak/presentation/widgets/product_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeViewModel viewModel = getIt();

  @override
  void initState() {
    super.initState();
    viewModel.loadCategories();
    viewModel.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: [
        CarouselSlider(
          items: [
            //1st Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage(AppAssets.icDiscount1),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //2nd Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage(AppAssets.icDiscount2),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //3rd Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage(AppAssets.icDiscount3),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          //Slider Container properties
          options: CarouselOptions(
            height: 20.h(context),
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            viewportFraction: 0.8,
          ),
        ),
        SizedBox(
          height: 30.h(context),
          child: BlocBuilder(
              bloc: viewModel.getAllCategoriesUseCase,
              builder: (context, state) {
                if (state is BaseRequestSuccessState<List<CategoryDM>>) {
                  return buildCategoriesGridView(state.data!);
                } else if (state is BaseRequestErrorState) {
                  return ErrorWidget(state.message);
                } else {
                  return const LoadingWidget();
                }
              }),
        ),
        SizedBox(
          height: 40.h(context),
          child: BlocBuilder(
              bloc: viewModel.getAllProductsUseCase,
              builder: (context, state) {
                if (state is BaseRequestSuccessState<List<ProductDM>>) {
                  return buildProductsListView(state.data!);
                } else if (state is BaseRequestErrorState) {
                  return ErrorWidget(state.message);
                } else {
                  return const LoadingWidget();
                }
              }),
        ),
      ],
    ));
  }

  Widget buildProductsListView(List<ProductDM> data) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ProductItem(data[index]);
        });
  }

  Widget buildCategoriesGridView(List<CategoryDM> data) {
    return GridView.builder(
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return CategoryItem(data[index]);
        });
  }
}
