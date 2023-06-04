
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class FoodItem extends StatefulWidget {
//   const FoodItem({
//     super.key,
//     required this.orderEntity,
//   });
//   final OrderEntity orderEntity;

//   @override
//   State<FoodItem> createState() => _FoodItemState();
// }

// class _FoodItemState extends State<FoodItem> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         showModalBottomSheet(
//           context: context,
//           isScrollControlled: true,
//           isDismissible: true,
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
//           ),
//           builder: (context) => DraggableScrollableSheet(
//             initialChildSize: 0.6,
//             minChildSize: 0.2,
//             maxChildSize: 0.9,
//             expand: false,
//             builder: (context, scrollController) => SafeArea(
//               child: OrderView(
//                 orderEntity: widget.orderEntity,
//                 controller: scrollController,
//               ),
//             ),
//           ),
//         );
//       },
//       child: Container(
//         height: 260,
//         width: MediaQuery.of(context).size.width / 2 - 32,
//         margin: const EdgeInsets.only(top: 16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(22),
//           color: bGrey,
//         ),
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               height: 128,
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 color: imageB,
//               ),
//               child: Image.asset(widget.orderEntity.image),
//             ),
//             Container(
//               padding: const EdgeInsets.only(top: 8),
//               width: double.infinity,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 8),
//                       child: Text(
//                         'Do‘mboq Tovuq oyoqchasi',
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: Theme.of(context).textTheme.bodyLarge,
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       setState(() {
//                         widget.orderEntity.isLiked =
//                             !widget.orderEntity.isLiked;
//                       });
//                       if (widget.orderEntity.isLiked) {
//                         context
//                             .read<OrdersBloc>()
//                             .add(AddFavorite(widget.orderEntity));
//                       } else {
//                         context
//                             .read<OrdersBloc>()
//                             .add(RemoveFavorite(widget.orderEntity.id));
//                       }
//                     },
//                     child: Container(
//                       height: 28,
//                       width: 28,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: imageB,
//                       ),
//                       alignment: Alignment.center,
//                       child: Icon(
//                         Icons.favorite_rounded,
//                         size: 18,
//                         color: widget.orderEntity.isLiked ? red : white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Spacer(),
//             Container(
//               padding: const EdgeInsets.only(bottom: 6),
//               width: double.infinity,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   widget.orderEntity.itemCount == 0
//                       ? WScaleAnimation(
//                           onTap: () {
//                             setState(() {
//                               widget.orderEntity.itemCount++;
//                             });
//                             context
//                                 .read<OrdersBloc>()
//                                 .add(AddOrder(widget.orderEntity));

//                             context.read<OrdersBloc>().add(PriceAll());
//                           },
//                           child: Container(
//                             height: 26,
//                             width: 80,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(16),
//                               color: red,
//                             ),
//                             child: Text(
//                               '+ Qo‘shish',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .titleMedium!
//                                   .copyWith(color: white, fontSize: 12),
//                             ),
//                           ),
//                         )
//                       : Row(
//                           children: [
//                             WScaleAnimation(
//                               onTap: () {
//                                 setState(() {
//                                   widget.orderEntity.itemCount--;
//                                   if (widget.orderEntity.itemCount == 0) {
//                                     context.read<OrdersBloc>().add(
//                                         RemoveOrder(widget.orderEntity.id));
//                                   }

//                                   context.read<OrdersBloc>().add(PriceAll());
//                                 });
//                               },
//                               child: Container(
//                                 height: 24,
//                                 width: 24,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(40),
//                                   border: Border.all(color: orang),
//                                 ),
//                                 child: const Icon(
//                                   Icons.remove,
//                                   size: 18,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 8,
//                               ),
//                               child: Text('${widget.orderEntity.itemCount}'),
//                             ),
//                             WScaleAnimation(
//                               onTap: () {
//                                 setState(() {
//                                   widget.orderEntity.itemCount++;

//                                   context.read<OrdersBloc>().add(PriceAll());
//                                 });
//                               },
//                               child: Container(
//                                 height: 24,
//                                 width: 24,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(40),
//                                   border: Border.all(color: green),
//                                 ),
//                                 child: const Icon(
//                                   Icons.add,
//                                   size: 20,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         MyFunctions.getThousandsSeparatedPrice(
//                           widget.orderEntity.price.toString(),
//                         ),
//                         style: Theme.of(context).textTheme.bodyLarge,
//                       ),
//                       Text(
//                         'so‘m',
//                         style: Theme.of(context).textTheme.labelLarge,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
