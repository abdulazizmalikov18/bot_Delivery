// import 'package:bot_delivery/assets/colors/colors.dart';
// import 'package:bot_delivery/features/common/widgets/w_scale_animation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class LikeButtonView extends StatelessWidget {
//   const LikeButtonView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<OrdersBloc, OrdersState>(
//       builder: (context, state) {
//         return WScaleAnimation(
//           onTap: () {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => const FavoriteView(),
//             ));
//           },
//           child: Container(
//             margin: const EdgeInsets.fromLTRB(6, 6, 0, 6),
//             height: 40,
//             width: 40,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: whiteSmoke,
//             ),
//             child: Stack(
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Icon(
//                     Icons.favorite_border_rounded,
//                     color: blackGrey,
//                   ),
//                 ),
//                 if (state.favoriteList.isNotEmpty)
//                   Positioned(
//                     top: 6,
//                     right: 6,
//                     child: Container(
//                       height: 12,
//                       width: 12,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         color: red,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
