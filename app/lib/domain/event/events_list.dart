import 'dart:math';

import 'package:app/domain/event/event.dart';

List<Event> eventsList = [
  Event(
    id: Random().nextInt(30000).toString(),
    name: "Nigeria Tech Summit",
    price: "0 to \$216",
    location: "Owerri",
    imageUrl: "https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F141252871%2F272798929277%2F1%2Foriginal.20210710-152327?w=800&auto=format%2Ccompress&q=75&sharp=10&rect=15%2C0%2C2092%2C1046&s=97e430d898c3bc706f16e4caffadd00d",
    description: "ATTN: 3rd Annual Nigeria Summit LOCATION: Hybrid/Virtual/Live Edition MEMO: An initiative hosted by the Global Startup Ecosystem in partnership with Forbes, Google Cloud, AWS, and IBM Cloud Audience: 50 Global Speakers and 3000 delegates. For interests related to speaking, sponsorships, and partnerships, please direct inquiries to events@globalstartupecosystem.com .",
    organizer: "OrganizerGlobal Startup Ecosystem",
    date: "Fri, December 10, 2021 10:00 AM – 3:00 PM WAT",

  ),
  Event(
    id: Random().nextInt(30000).toString(),
    name: "HOLBORN SCHOLARSHIP EXAM 2021 (LAGOS CHAPTER)",
    price: "free",
    location: "Lagos",
    imageUrl: "https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F118855271%2F494181368015%2F1%2Foriginal.20201117-180128?w=800&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C0%2C800%2C400&s=50a1fc3865ef5cfef602c75b4e03fd53",
    description: "Eligibility Criteria: "
        "1. An international student (i.e. a non-Canadian requiring a study permit) "
        "2. An original and creative thinker committed to school and community "
        "3. high achiever in academic and creative pursuits "
        "4. Enthusiastic about learning and intellectual exploration "
        "5. Have demonstrated strong leadership skills "
        "Exam Requirements: "
        " - Picture ID  "
        "- School leaving Certificate  "
        "- Exam writing materials  "
        "- 2 Passport photograph "
        "This exam is strictly by invitation only! "
        "For additional questions, please contact study@hsfcan.org or call +1 6474284678 or +2349096316633",
    organizer: "Centre for Management Development "
        "C M D Road "
        "Lagos, LA",
    date: "Sat, September 4, 2021 "
        "1:00 PM – 2:00 PM WAT"
  ),

];