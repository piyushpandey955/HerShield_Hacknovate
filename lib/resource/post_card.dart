import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      'https://plus.unsplash.com/premium_photo-1713163890188-6807aa2641de?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                ),
                Expanded(
                  child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white70),
                      ),
                    ],
                  ),
                )),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                              child: ListView(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                shrinkWrap: true,
                                children: ['Delete', 'Report']
                                    .map(
                                      (e) => InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 16),
                                          child: Text(e),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ));
                  },
                  icon: const Icon(Icons.more_vert, color: Colors.white70,),
                ),
              ],
            ),
          ),
          //IMAGE SECTION
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: 360.0,
            child: Image.network(
              'https://img.freepik.com/free-vector/international-day-elimination-violence-against-women-background-with-girl_23-2148702311.jpg?w=1060&t=st=1715395756~exp=1715396356~hmac=b34cf6d9671c3d5237ffe226233849f556a74b461157ce3ddabdeceb0e2d9e70',
              fit: BoxFit.cover,
            ),
          ),
          // like comment section
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.comment_outlined,
                  color: Colors.white70,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                  color: Colors.white70,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: const Icon(Icons.bookmark_border , color: Colors.white70,),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),

          //description of the post
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                  child: Text(
                    '1,231 likes',
                    style: Theme.of(context).textTheme.bodyMedium,

                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                          color: Colors.white70),
                      children: [
                        TextSpan(
                          text: 'username ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'Hey this is some description',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      "View all 200 comments",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                ),

                Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      "17/04/2024",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                  
              ],
            ),
          ),








          // //IMAGE SECTION
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.35,
          //   width: 360.0,
          //   child: Image.network(
          //     'https://images.unsplash.com/photo-1705646742193-d0ffd590193b?q=80&w=2832&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // // like comment section
          // Row(
          //   children: [
          //     IconButton(
          //       onPressed: () {},
          //       icon: const Icon(
          //         Icons.favorite,
          //         color: Colors.red,
          //       ),
          //     ),
          //     IconButton(
          //       onPressed: () {},
          //       icon: const Icon(
          //         Icons.comment_outlined,
          //         color: Colors.white70,
          //       ),
          //     ),
          //     IconButton(
          //       onPressed: () {},
          //       icon: const Icon(
          //         Icons.send,
          //         color: Colors.white70,
          //       ),
          //     ),
          //     Expanded(
          //       child: Align(
          //         alignment: Alignment.bottomRight,
          //         child: IconButton(
          //           icon: const Icon(Icons.bookmark_border , color: Colors.white70,),
          //           onPressed: () {},
          //         ),
          //       ),
          //     )
          //   ],
          // ),





          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       DefaultTextStyle(
          //         style: Theme.of(context).textTheme.titleSmall!.copyWith(
          //               fontWeight: FontWeight.w800,
          //             ),
          //         child: Text(
          //           '1,231 likes',
          //           style: Theme.of(context).textTheme.bodyMedium,

          //         ),
          //       ),
          //       Container(
          //         width: double.infinity,
          //         padding: const EdgeInsets.only(
          //           top: 8,
          //         ),
          //         child: RichText(
          //           text: TextSpan(
          //             style: const TextStyle(
          //                 color: Colors.white70),
          //             children: [
          //               TextSpan(
          //                 text: 'username ',
          //                 style: const TextStyle(fontWeight: FontWeight.bold),
          //               ),
          //               TextSpan(
          //                 text: 'Hey this is some description',
          //                 style: const TextStyle(fontWeight: FontWeight.bold),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       InkWell(
          //         onTap: () {},
          //         child: Container(
          //           padding: const EdgeInsets.symmetric(vertical: 4),
          //           child: Text(
          //             "View all 200 comments",
          //             style: const TextStyle(
          //               fontSize: 16,
          //               color: Colors.white60,
          //             ),
          //           ),
          //         ),
          //       ),

          //       Container(
          //           padding: const EdgeInsets.symmetric(vertical: 4),
          //           child: Text(
          //             "17/04/2024",
          //             style: const TextStyle(
          //               fontSize: 16,
          //               color: Colors.white54,
          //             ),
          //           ),
          //         ),
                  
          //     ],
          //   ),
          // ),



          
        ],
      ),
      
    );
  }
}


