import 'dart:math';

import 'package:app/domain/question/answer.dart';
import 'package:app/domain/user/user.dart';

final Map<String, List<String>> answersList = {
  "Why do computer scientists often prefer hexadecimal over other representations?":
      [
    "Maybe “computer scientists” isn’t the right description here — I’d say it’s “system programmers” or whatever you want to call programmers that deal with memory addresses."
        "Now to understand why we often find hex notation convenient think about what works well with decimal notation: powers of ten, like 100 or 1,000,000."
        " It’s the same with hex: it works well with powers of 16: 256 (the range addressable by a byte; 0x100), 4096 (the typical size of a page in pages memory; 0x1000), 65,536 (the range addressable by two bytes; 0x10000), 1,048,576 (the “mega” in megabyte; 0x100000), etc."
        " In other words, the kind of address arithmetic we do in systems programming is often easier in hex notation than in decimal notation. Hexadecimal is also useful if the underlying bit pattern is relevant because each hex digit maps exactly to four binary digits."
        " So if I see 0x2F, I can immediately visualize the pattern 0010 1111, whereas the decimal equivalent 47 doesn’t have as straightforward of a mapping.",
    "It’s the easiest compressed way to look at binary. Because hexadecimal has 16 possible values in a digit it holds four bits (binary digits) of data in one digit, so they can be expressed in one-fourth the space. We want to see binary representations to understand what’s going on in low level code involving registers and memory - looking at rows of stuff like 0xDEADBEEF is easier than 11011110101011011011111011101111 If we’re working at higher levels where number storage and manipulation are abstracted, most computer scientists will work in decimal like everyone else (well, unless we’re doing some direct binary manipulation like using a number to store a set of flags anyway"
  ],
  "Is it ok to post code from my work project on StackOverflow?": [
    "Unless you’re contributing to a company-approved open source project, no. "
        "The code you produce at work is owned by the company and is a trade secret. "
        "Posting it publicly could get you fired or even sued. If you need help with a work problem, re-write it a completely generic manner before posting so you’re not disclosing any confidential information."
  ],
  "My lecturer told me that a web app should access the database through web services due to security reasons. Is it a good approach?":
      [
    "Yes and it’s common. Layering services can be a good solution, for performance and security."
        " Adding a proxy and a service layer can help you filter potentially harmful requests and manage access.",
    "Yes. Or at least it can be. By abstracting the database layer out in a separate service, you don’t have database credentials or even knowledge about the internal structure floating around in the application. "
        "This can be an advantage if you for instance have requirements that should limit access to user data, not by “… WHERE user = 42”, but by a unique API key. "
        "It reduces the exposure to data loss, if each key only gives access to one user, as opposed to the application server getting compromised and getting full database credentials or it being open to SQL injection attacks. The disadvantage is complexity. You now don’t have one system but two."
        " For simple applications, it isn’t a problem to just proxy the data from an external service, and show on a page. However for any complex data manipulation, it can increase traffic to the data layer and have more round trips than if you could just make a custom SQL query. And sometimes doing a simple PHP application with direct database access is just fine too."
  ],
};

class Question {
  final String question;
  final String spaceName;
  final User user;
  final List<Answer> answers;

  Question({this.spaceName, this.question, this.user, this.answers});

  factory Question.Random() {
    var answer = Random().nextInt(answersList.keys.length);
    var question = answersList.keys.toList()[answer];
    var answerLength = answersList["$question"].length;
    return Question(
      spaceName: "Computer Science",
      question: question,
      user: User.Random(),
      answers: List.generate(
        answerLength,
        (index) => Answer(
          noOfLikes: Random().nextInt(50),
          noOfViews: Random().nextInt(500),
          noOfShares: Random().nextInt(20),
          noOfComments: Random().nextInt(20),
          user: User.Random(),
          answer: answersList["$question"][--answerLength],
          date: DateTime.now().subtract(
            Duration(
              hours: Random().nextInt(pow(2, 3)),
            ),
          ),
        ),
      ),
    );
  }
}
