import 'dart:math';

import 'package:app/domain/user/user.dart';
import 'package:flutter/material.dart';

enum PostType { post, question }

final String postBodyFull =
    "lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam faucibus lorem non mollis suscipit. Proin eget dui fermentum, maximus purus a, convallis sem. Praesent sollicitudin ipsum eget finibus lacinia. Cras molestie erat vel ligula congue euismod. Proin non leo leo. Maecenas in malesuada sem. Nullam congue consectetur nibh vitae accumsan. Suspendisse vel lacus cursus, dictum orci at, ultricies sapien. Sed consequat nisl vel orci facilisis tempor. Nulla sed placerat mi. Suspendisse auctor, sem ac convallis porttitor, erat nisi condimentum lacus, eget tempus eros sapien nec nulla. Nulla nec dolor quis mauris pulvinar eleifend sed et turpis. Sed at hendrerit enim. Pellentesque condimentum neque mi, sed euismod enim euismod ut. "
    "Etiam bibendum faucibus ipsum et suscipit. In hac habitasse platea dictumst. Nam quis gravida dui. Proin consequat cursus ex ac volutpat. Donec nec lacinia ipsum. Sed lectus eros, rhoncus vel dolor eu, volutpat aliquam est. Quisque est dolor, lobortis et metus eget, rhoncus vehicula arcu. Aliquam erat volutpat. Aenean consectetur tincidunt facilisis. Aenean eu risus in metus gravida convallis sed non augue. In ac dui tincidunt, elementum velit a, vulputate mauris. Nullam rhoncus, est sed venenatis eleifend, sapien massa laoreet lorem, in mattis lorem quam vitae libero. Nunc tempus accumsan nisi, ac tincidunt nibh elementum ornare. Nulla lobortis neque vel turpis vulputate, at imperdiet lacus rutrum. "
    "Aliquam erat volutpat. Suspendisse a placerat mi. Suspendisse gravida fringilla posuere. In enim sapien, condimentum in turpis at, feugiat feugiat nibh. Nullam venenatis velit ac nibh posuere condimentum. Nulla tincidunt nulla justo, sed porttitor lectus ullamcorper sit amet. Pellentesque molestie porta rhoncus. Morbi interdum, magna non pretium fringilla, justo velit lobortis velit, et hendrerit augue orci non massa. Etiam eleifend, sem eget sodales eleifend, eros ante maximus turpis, at auctor ante leo ac nibh. Sed aliquet auctor mi vitae fermentum. Aliquam et nibh ac felis imperdiet vestibulum nec vitae augue. Morbi tempor libero posuere aliquet placerat. Donec tincidunt pretium erat, vitae semper erat pharetra sed. "
    "Praesent ac eros ac nulla dignissim cursus at in lorem. Curabitur non nisl ipsum. Ut tincidunt viverra vestibulum. Etiam sodales porta mauris vel rhoncus. Morbi nec odio turpis. Quisque viverra et libero et vehicula. Aliquam tempor metus enim, quis auctor tellus vehicula in. In sapien arcu, mollis ornare augue vel, consequat venenatis purus. Duis lectus ligula, accumsan efficitur venenatis pellentesque, dictum sit amet orci. Sed volutpat porta sem vitae egestas. Nulla facilisi. Aenean tellus massa, tincidunt tristique faucibus vel, pharetra non elit. Integer eget nibh in metus iaculis porta. Suspendisse a lacus sapien."
    "Integer rhoncus justo in porttitor malesuada. Pellentesque tincidunt diam ut euismod pulvinar. Curabitur mattis, quam quis hendrerit pulvinar, enim risus egestas nulla, at pretium libero velit quis eros. Nulla lacinia, ex vitae volutpat hendrerit, massa diam efficitur tortor, vitae mattis magna urna in erat. Morbi a suscipit libero. Fusce fermentum quam eu nibh congue ornare. Cras pulvinar felis eget placerat elementum. Pellentesque cursus congue tellus ut facilisis. Sed quam orci, suscipit non dui eget, pulvinar pulvinar ex. Suspendisse luctus libero et nulla venenatis, sit amet egestas sapien rutrum. Sed convallis rhoncus felis ac bibendum. Fusce in odio ipsum. Suspendisse suscipit enim eget libero gravida aliquam.";

final String postBodyShort =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam faucibus lorem non mollis suscipit. Proin eget dui fermentum, maximus purus a, convallis sem. Praesent sollicitudin ipsum eget finibus lacinia.";

final List<String> postBody = [postBodyFull, postBodyShort];
final List<String> mathPostTitles = [
  "Is there a convention on how to interpret the inverse of the uniform distribution?",
  "Convert NFA to DFA using intersection",
  "Approximation for three homogeneous equations wihtout zeros as results",
  "Good initial guesses for n×n system of equations numerical solution",
  "Is F(x) the same as ⋃{y∣⟨x,y⟩ ∈ F}?"
];

final List<String> generalPostTitles = [
  "How to read properly for your exams",
  "Is there any interesting event coming up in your area?",
  "Why we are not making straight A's",
  "How to combine skills and work with school",
  "What is the secret to insane productivity"
];

final List<String> imageUrls = [
  "https://images.unsplash.com/photo-1571260899304-425eee4c7efc?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3R1ZGVudHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1596495578065-6e0763fa1178?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c3R1ZGVudHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1427504494785-3a9ca7044f45?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c3R1ZGVudHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1427504494785-3a9ca7044f45?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c3R1ZGVudHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c3R1ZGVudHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
];

class Post {
  final User user;
  final String id;
  final String title;
  final bool isFollowing;
  final String body;
  final PostType postType;
  final String imageUrl;
  final int noOfLikes;
  final int noOfViews;
  final int noOfShares;
  final DateTime date;
  final int noOfComments;

  const Post(
      {this.user,
      this.isFollowing = false,
      this.id,
      this.date,
      this.title,
      this.postType = PostType.post,
      this.body,
      this.imageUrl,
      this.noOfLikes,
      this.noOfViews,
      this.noOfShares,
      this.noOfComments});

  factory Post.Random() {
    int noOfLikes = Random().nextInt(50000);
    int noOfViews = Random().nextInt(500000);
    int noOfShares = Random().nextInt(200);
    int noOfComments = Random().nextInt(500);
    String title =
        generalPostTitles[Random().nextInt(generalPostTitles.length)];
    String imageUrl = imageUrls[Random().nextInt(imageUrls.length)];
    DateTime date =
        DateTime.now().subtract(Duration(hours: Random().nextInt(7000)));
    String body = postBody[Random().nextInt(postBody.length)];
    String id = "${Random().nextInt(1000000)}";
    User user = User.Random();
    return Post(
      id: id,
      date: date,
      user: user,
      body: body,
      title: title,
      imageUrl: imageUrl,
      noOfComments: noOfComments,
      noOfLikes: noOfLikes,
      noOfViews: noOfViews,
      noOfShares: noOfShares,
    );
  }

  factory Post.RandomFollowings() {
    return Post.Random().copyWith(
      isFollowing: true,
    );
  }

  factory Post.RandomQuestions() {
    return Post.Random().copyWith(
      postType: PostType.question,
    );
  }

  Post copyWith({
    User user,
    String id,
    PostType postType,
    String title,
    bool isFollowing,
    String body,
    String imageUrl,
    int noOfLikes,
    int noOfViews,
    int noOfShares,
    DateTime date,
    int noOfComments,
  }) {
    if ((user == null || identical(user, this.user)) &&
        (id == null || identical(id, this.id)) &&
        (title == null || identical(title, this.title)) &&
        (isFollowing == null || identical(isFollowing, this.isFollowing)) &&
        (body == null || identical(body, this.body)) &&
        (postType == null || identical(postType, this.postType)) &&
        (imageUrl == null || identical(imageUrl, this.imageUrl)) &&
        (noOfLikes == null || identical(noOfLikes, this.noOfLikes)) &&
        (noOfViews == null || identical(noOfViews, this.noOfViews)) &&
        (noOfShares == null || identical(noOfShares, this.noOfShares)) &&
        (date == null || identical(date, this.date)) &&
        (noOfComments == null || identical(noOfComments, this.noOfComments))) {
      return this;
    }

    return new Post(
      user: user ?? this.user,
      id: id ?? this.id,
      title: title ?? this.title,
      isFollowing: isFollowing ?? this.isFollowing,
      body: body ?? this.body,
      imageUrl: imageUrl ?? this.imageUrl,
      noOfLikes: noOfLikes ?? this.noOfLikes,
      postType: postType ?? this.postType,
      noOfViews: noOfViews ?? this.noOfViews,
      noOfShares: noOfShares ?? this.noOfShares,
      date: date ?? this.date,
      noOfComments: noOfComments ?? this.noOfComments,
    );
  }

  @override
  String toString() {
    return 'Post{user: $user, id: $id, title: $title, body: $body, imageUrl: $imageUrl, noOfLikes: $noOfLikes, noOfViews: $noOfViews, noOfShares: $noOfShares, date: $date, noOfComments: $noOfComments}';
  }
}
