import 'dart:math';

import 'package:app/domain/question/comment.dart';
import 'package:app/domain/space/space.dart';
import 'package:app/domain/user/user.dart';

enum PostType { post, question }

final String postBodyFull =
    "lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam faucibus lorem non mollis suscipit. Proin eget dui fermentum, maximus purus a, convallis sem. Praesent sollicitudin ipsum eget finibus lacinia. Cras molestie erat vel ligula congue euismod. Proin non leo leo. Maecenas in malesuada sem. Nullam congue consectetur nibh vitae accumsan. Suspendisse vel lacus cursus, dictum orci at, ultricies sapien. Sed consequat nisl vel orci facilisis tempor. Nulla sed placerat mi. Suspendisse auctor, sem ac convallis porttitor, erat nisi condimentum lacus, eget tempus eros sapien nec nulla. Nulla nec dolor quis mauris pulvinar eleifend sed et turpis. Sed at hendrerit enim. Pellentesque condimentum neque mi, sed euismod enim euismod ut. "
    "Etiam bibendum faucibus ipsum et suscipit. In hac habitasse platea dictumst. Nam quis gravida dui. Proin consequat cursus ex ac volutpat. Donec nec lacinia ipsum. Sed lectus eros, rhoncus vel dolor eu, volutpat aliquam est. Quisque est dolor, lobortis et metus eget, rhoncus vehicula arcu. Aliquam erat volutpat. Aenean consectetur tincidunt facilisis. Aenean eu risus in metus gravida convallis sed non augue. In ac dui tincidunt, elementum velit a, vulputate mauris. Nullam rhoncus, est sed venenatis eleifend, sapien massa laoreet lorem, in mattis lorem quam vitae libero. Nunc tempus accumsan nisi, ac tincidunt nibh elementum ornare. Nulla lobortis neque vel turpis vulputate, at imperdiet lacus rutrum. "
    "Aliquam erat volutpat. Suspendisse a placerat mi. Suspendisse gravida fringilla posuere. In enim sapien, condimentum in turpis at, feugiat feugiat nibh. Nullam venenatis velit ac nibh posuere condimentum. Nulla tincidunt nulla justo, sed porttitor lectus ullamcorper sit amet. Pellentesque molestie porta rhoncus. Morbi interdum, magna non pretium fringilla, justo velit lobortis velit, et hendrerit augue orci non massa. Etiam eleifend, sem eget sodales eleifend, eros ante maximus turpis, at auctor ante leo ac nibh. Sed aliquet auctor mi vitae fermentum. Aliquam et nibh ac felis imperdiet vestibulum nec vitae augue. Morbi tempor libero posuere aliquet placerat. Donec tincidunt pretium erat, vitae semper erat pharetra sed. "
    "Praesent ac eros ac nulla dignissim cursus at in lorem. Curabitur non nisl ipsum. Ut tincidunt viverra vestibulum. Etiam sodales porta mauris vel rhoncus. Morbi nec odio turpis. Quisque viverra et libero et vehicula. Aliquam tempor metus enim, quis auctor tellus vehicula in. In sapien arcu, mollis ornare augue vel, consequat venenatis purus. Duis lectus ligula, accumsan efficitur venenatis pellentesque, dictum sit amet orci. Sed volutpat porta sem vitae egestas. Nulla facilisi. Aenean tellus massa, tincidunt tristique faucibus vel, pharetra non elit. Integer eget nibh in metus iaculis porta. Suspendisse a lacus sapien."
    "Integer rhoncus justo in porttitor malesuada. Pellentesque tincidunt diam ut euismod pulvinar. Curabitur mattis, quam quis hendrerit pulvinar, enim risus egestas nulla, at pretium libero velit quis eros. Nulla lacinia, ex vitae volutpat hendrerit, massa diam efficitur tortor, vitae mattis magna urna in erat. Morbi a suscipit libero. Fusce fermentum quam eu nibh congue ornare. Cras pulvinar felis eget placerat elementum. Pellentesque cursus congue tellus ut facilisis. Sed quam orci, suscipit non dui eget, pulvinar pulvinar ex. Suspendisse luctus libero et nulla venenatis, sit amet egestas sapien rutrum. Sed convallis rhoncus felis ac bibendum. Fusce in odio ipsum. Suspendisse suscipit enim eget libero gravida aliquam.";

final String postBodyFull2 =
    "Cloud technologies offer lots of advantages for businesses of all shapes and sizes. If you want to get the full potential of them, you should choose the right model."
    " To make this challenging task easier, we prepared a guide that explained such popular cloud service models as SaaS, PaaS, and IaaS and the differences between them. 5 characteristics of a cloud services by NIST In traditional on-premises models, platforms, infrastructure, and applications are built on top of each other to provide a functional environment where end users can perform their tasks. Cloud services, on the contrary, allow customers to choose how much of the traditional process they want to manage. Cloud computing stack Virtualization technology allows us to deliver a number of cloud computing services, which can be roughly split into three big groups: infrastructure as a service (IaaS), platform as a service (PaaS), and software as a service (SaaS)."
    " Let’s break down the components that vendors and customers manage with each service model (In the graphics, orange components are provided by a cloud computing vendor and green components are handled by customers). "
    "And take a look at how responsibilities are divided between a cloud vendor (marked in orange) and a customer (marked in green) for each service model: "
    "IaaS model features Infrastructure as a service (IaaS) is a scalable cloud computing infrastructure provided on demand through means of virtualization technology. The technologies and capabilities delivered by IaaS systems are similar to those offered by traditional data centers, only without the need for clients to physically maintain or manage servers. The IaaS model works great for companies that need to save money or experience spikes in demand for hardware resources. PaaS model features Platform as a service (PaaS) can be defined as middleware provided on demand via the internet. PaaS solutions mainly target developers and software vendors, since they provide them with environments in which to develop, test, deploy, host, and maintain their applications. "
    "Many cloud companies embrace PaaS as a way to allow developers to integrate with their own proprietary software without leaving the company ecosystem. This helps companies create development communities around their products without going completely open source. "
    "SaaS model features "
    "Software as a service (SaaS) is a software delivery model where centrally hosted applications are made available on demand via the internet. SaaS applications are fully managed by a vendor, without the need for users to worry about their configuration and maintenance. "
    "The SaaS model is convenient for customers since it ensures automatic updates and remote access from various devices, offers on-demand scalability, and provides pay-as-you-go or subscription pricing models. "
    "What cloud computing model should you choose? "
    "Each technology stack brings incremental advantages compared to the previous: a PaaS technology stack is easier to work with than IaaS, and SaaS is easier still. "
    "Let’s take a look at the most common use cases for each cloud computing model: "
    "Doing your best work means choosing the right stack for your goals and allowing your cloud service vendor to take care of the things you don’t need to manage yourself. "
    "For instance, the IaaS model is a decent solution for companies that want to have their infrastructure properly managed by a third party and benefit from scalable on-demand computing services. "
    "PaaS vendors take on the responsibilities of hardware and middleware management, allowing developers to focus purely on their software. "
    "The SaaS model is perfect for rapidly creating standardized solutions and ecommerce software without spending time on server or software issues. "
    "Explore more insights on SaaS, PaaS, and IaaS from the full article in our blog.";

final String postBodyShort =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam faucibus lorem non mollis suscipit. Proin eget dui fermentum, maximus purus a, convallis sem. Praesent sollicitudin ipsum eget finibus lacinia.";

final List<String> postBody = [postBodyFull, postBodyShort, postBodyFull2];
final List<String> mathPostTitles = [
  "Is there a convention on how to interpret the inverse of the uniform distribution?",
  "Convert NFA to DFA using intersection",
  "Approximation for three homogeneous equations wihtout zeros as results",
  "Good initial guesses for n×n system of equations numerical solution",
  "Is F(x) the same as ⋃{y∣⟨x,y⟩ ∈ F}?",
  "what is Eucleadon Division Theorem"
];

final List<String> generalPostTitles = [
  "How to read properly for your exams",
  "Explaining Cloud Computing Models",
  "Is there any interesting event coming up in your area?",
  "Why we are not making straight A's",
  "How to combine skills and work with school",
  "What is the secret to insane productivity",
  "How i never miss any lectures."
];

final List<String> imageUrls = [
  "https://qph.fs.quoracdn.net/main-qimg-6712a047a1ca17a78929dac915d6890b"
      "https://images.unsplash.com/photo-1571260899304-425eee4c7efc?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3R1ZGVudHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1523050854058-8df90110c9f1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2Nob29sfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1509191436522-d296cf87d244?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2Nob29sfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8c2Nob29sfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1596496050755-c923e73e42e1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHNjaG9vbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1596495578065-6e0763fa1178?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c3R1ZGVudHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1427504494785-3a9ca7044f45?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c3R1ZGVudHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1427504494785-3a9ca7044f45?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c3R1ZGVudHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
];

class Post {
  final User user;
  final int id;
  final String title;
  final bool isFollowing;
  final String body;
  final List<Comment> comments;
  final PostType postType;
  final Space space;
  final String imageUrl;
  final int noOfLikes;
  final int noOfViews;
  final int noOfShares;
  final DateTime date;
  final int noOfComments;

  const Post(
      {this.user,
      this.comments,
      this.space,
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

  factory Post.fromServer(dynamic data) {
    List<Comment> comments = [];
    if (data["comments"]!=null) {
      data["comments"].forEach((comment) {
        comments.add(Comment.fromServer(comment));
      });
      print("all comments $comments");
    }
    return Post(
      space: Space.fromServer(data["space"]),
      id: data["id"],
      body: data["body"],
      title: data["title"],
      comments: comments,
      postType: _getPostType("${data["postType"]}"),
      imageUrl: data["imageUrl"],
      user: User.fromServer(data["student"]),
      date: DateTime.fromMillisecondsSinceEpoch(data["date"]),
      noOfLikes: Random().nextInt(500),
      noOfViews: Random().nextInt(5000),
      noOfShares: Random().nextInt(20),
      noOfComments: comments.length,
    );
  }

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
    int id = Random().nextInt(1000000);
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
    int id,
    String title,
    bool isFollowing,
    String body,
    List<Comment> comments,
    PostType postType,
    Space space,
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
        (comments == null || identical(comments, this.comments)) &&
        (postType == null || identical(postType, this.postType)) &&
        (space == null || identical(space, this.space)) &&
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
      comments: comments ?? this.comments,
      postType: postType ?? this.postType,
      space: space ?? this.space,
      imageUrl: imageUrl ?? this.imageUrl,
      noOfLikes: noOfLikes ?? this.noOfLikes,
      noOfViews: noOfViews ?? this.noOfViews,
      noOfShares: noOfShares ?? this.noOfShares,
      date: date ?? this.date,
      noOfComments: noOfComments ?? this.noOfComments,
    );
  }

  @override
  String toString() {
    return 'Post{user: $user, id: $id, title: $title, isFollowing: $isFollowing, body: $body, comments: $comments, postType: $postType, space: $space, imageUrl: $imageUrl, noOfLikes: $noOfLikes, noOfViews: $noOfViews, noOfShares: $noOfShares, date: $date, noOfComments: $noOfComments}';
  }

  static PostType _getPostType(String type) {
    return type == "question" ? PostType.question : PostType.post;
  }
}
