import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:readmore/readmore.dart';
import 'package:tasawak/data/model/response/product_dm.dart';
import 'package:tasawak/presentation/shared_view_models/cart_view_model.dart';
import 'package:tasawak/presentation/utils/app_color.dart';
import 'package:tasawak/presentation/utils/exentions.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = "ProductDetailsScreen";

  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late CartViewModel cartViewModel;
  late ProductDM args;

  @override
  void initState() {
    super.initState();
    cartViewModel = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ProductDM;
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: const Text("Product details"),
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primaryColor,
          actions: [
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(Icons.search)),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined))
          ],
          titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 20,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey, width: 2)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ImageSlideshow(
                      initialPage: 0,
                      indicatorColor: AppColors.primaryColor,
                      indicatorBackgroundColor: AppColors.whiteColor,
                      indicatorBottomPadding: 20,
                      autoPlayInterval: 3000,
                      isLoop: true,
                      children: args.images
                              ?.map((link) => CachedNetworkImage(
                                  fit: BoxFit.fill, imageUrl: link))
                              .toList() ??
                          []),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    args.title ?? "",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor),
                  )),
                  Text(
                    "EGP ${args.price}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                color: AppColors.primaryColor, width: 1)),
                        child: Text(
                          "Sold : ${args.sold}",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor),
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${args.ratingsAverage} (${args.quantity})",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor),
                      )
                    ],
                  )),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                "Description",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 12,
              ),
              ReadMoreText(
                args.description ?? "",
                trimLines: 3,
                trimMode: TrimMode.Line,
                trimCollapsedText: "Show more",
                trimExpandedText: "Show less",
                moreStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor.withOpacity(0.6)),
                lessStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor.withOpacity(0.6)),
              ),
              const Spacer(),
              BlocBuilder(
                bloc: cartViewModel,
                builder: (context, state) => Container(
                  color: Colors.white54,
                  height: 15.h(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Text(
                              "Total Price ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 20,
                                      color: AppColors.primaryColor),
                            ),
                            Text(
                              "${(args.price! * (cartViewModel.isInCart(args)?.count ?? 0))} ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 20,
                                      color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: cartViewModel.isInCart(args) != null
                              ? buildCartOption()
                              : buildAddButton())
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  buildAddButton() {
    return ElevatedButton(
      onPressed: () {
        cartViewModel.addProductToCart(args.id!);
      },
      style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.add_shopping_cart_outlined,
            color: AppColors.whiteColor,
          ),
          SizedBox(width: 4),
          Text("Add To Cart",
              style: TextStyle(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))
        ],
      ),
    );
  }

  buildCartOption() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(100)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                cartViewModel.removeProductFromCart(args.id!);
              },
              icon: const Icon(
                Icons.remove_circle_outline_rounded,
                color: AppColors.whiteColor,
                size: 26,
              )),
          Text(
            "${cartViewModel.isInCart(args)!.count}",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteColor),
          ),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                cartViewModel.addProductToCart(args.id!);
              },
              icon: const Icon(
                Icons.add_circle_outline_rounded,
                color: AppColors.whiteColor,
                size: 26,
              )),
        ],
      ),
    );
  }
}
