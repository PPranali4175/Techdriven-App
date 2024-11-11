import 'package:flutter/material.dart';
import 'package:majorproject/sampleletter.dart';



class EarlyReleaseLetterPage extends StatefulWidget {
  @override
  _EarlyReleaseLetterPageState createState() => _EarlyReleaseLetterPageState();
}

class _EarlyReleaseLetterPageState extends State<EarlyReleaseLetterPage> {
  // Track the current language, default is English
  bool isEnglish = true;

  // English and Hindi versions of the letter content
  final String englishText = "RE: [probationer's full name], DC# (a number assigned by a corrections department)\n\n"
      "Honorable Judge,\n\n"
      "I am [former employer's full name]. I want to support [probationer's full name]'s early release.\n\n"
      "I have known [probationer's name] since [the year the employer first met the probationer] after he arrived at [employer's company name], where I recruited several former inmates.\n\n"
      "Many probationers start with little to nothing, but [probationer's name] effectively manages his time and resources.\n\n"
      "I have also witnessed [probationer's name]'s growth into becoming a law-abiding and respectable citizen. This person has sometimes even guided other young men to lead exemplary lives.\n\n"
      "Along with being well-read and educated, [probationer's name] is also a gifted artist and creative person. He not only enjoys strong family ties, which many former inmates lack, but he also has consistent community support.\n\n"
      "I am confident that [probationer's name] will carry on being an honorable, law-abiding, and diligent person after his release from probation.\n\n"
      "Sincerely,\n\n"
      "[Your full name]\n"
      "[Contact information, such as email or phone number]";

  final String hindiText = "विषय: [प्रोबेशनर का पूरा नाम], DC# (सुधार विभाग द्वारा असाइन किया गया एक नंबर)\n\n"
      "माननीय न्यायाधीश,\n\n"
      "मैं [पूर्व नियोक्ता का पूरा नाम] हूँ। मैं [प्रोबेशनर का पूरा नाम] की जल्द रिहाई का समर्थन करना चाहता हूँ।\n\n"
      "[नियोक्ता के कंपनी नाम] में आने के बाद से मैंने [प्रोबेशनर का नाम] को [वर्ष जब नियोक्ता ने पहली बार प्रोबेशनर से मुलाकात की थी] से जाना है, जहाँ मैंने कई पूर्व कैदियों को भर्ती किया था।\n\n"
      "कई प्रोबेशनर बहुत कम या कुछ भी नहीं से शुरुआत करते हैं, लेकिन [प्रोबेशनर का नाम] अपने समय और संसाधनों का कुशलतापूर्वक प्रबंधन करता है।\n\n"
      "मैंने यह भी देखा है कि [प्रोबेशनर का नाम] एक कानून का पालन करने वाला और सम्मानित नागरिक बन रहा है। इस व्यक्ति ने कभी-कभी अन्य युवा पुरुषों को अनुकरणीय जीवन जीने का मार्ग भी दिखाया है।\n\n"
      "अच्छी तरह से पढ़े-लिखे और शिक्षित होने के साथ-साथ, [प्रोबेशनर का नाम] एक प्रतिभाशाली कलाकार और रचनात्मक व्यक्ति भी है। उसे न केवल मजबूत पारिवारिक संबंधों का आनंद है, जो कई पूर्व कैदियों के पास नहीं है, बल्कि उसे लगातार सामुदायिक समर्थन भी प्राप्त है।\n\n"
      "मुझे विश्वास है कि [प्रोबेशनर का नाम] प्रोबेशन से रिहा होने के बाद एक सम्मानजनक, कानून का पालन करने वाला और परिश्रमी व्यक्ति बना रहेगा।\n\n"
      "साभार,\n\n"
      "[आपका पूरा नाम]\n"
      "[संपर्क जानकारी, जैसे ईमेल या फोन नंबर]";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Early release letter",style: TextStyle(fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SampleLetterPage()),
            );
            // Add your back navigation logic here
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sample Letter Title
            Text(
              "Sample letter",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Language Switcher
            Row(
              children: [
                ChoiceChip(
                  label: Text("English"),
                  selected: isEnglish,
                  onSelected: (selected) {
                    setState(() {
                      isEnglish = true;
                    });
                  },
                  selectedColor: Colors.purple[200],
                ),
                SizedBox(width: 10),
                ChoiceChip(
                  label: Text("Hindi"),
                  selected: !isEnglish,
                  onSelected: (selected) {
                    setState(() {
                      isEnglish = false;
                    });
                  },
                  selectedColor: Colors.purple[200],
                ),
              ],
            ),
            SizedBox(height: 20),
            // Sample Letter Content
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  isEnglish ? englishText : hindiText,
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
