import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int selectedIndex = 0;
// List<String> selectionDayList = ["Yesterday" , "Today" , "Tomorrow"];
Map<String, String> selectionDays = {
  "Yesterday" : "Yesterday, a chapter closed, but its lessons linger still. In the tapestry of time, each moment weaves a thread of experience, shaping our journey forward. Though yesterday fades into memory, its echoes resonate in the present. Every triumph, every setback, serves as a beacon of guidance for the path ahead. And as we reflect on yesterday, we glean insights that illuminate our tomorrows. For in the tapestry of our lives, every thread, every article, contributes to the rich tapestry of our existence, weaving a story of resilience, growth, and endless possibility.",
  "Today" : "Today marks a new dawn, ripe with possibilities. As the sun ascends, so do our aspirations. With each breath, we inhale the promise of opportunity, ready to embrace the challenges ahead. Today, let us set forth with determination, fueled by passion and guided by wisdom. Let us seize the day, for it is ours to shape and mold. In this moment, we hold the power to create, to inspire, and to thrive. Today, let us embark on a journey of growth, discovery, and fulfillment." ,
  "Tomorrow" : "With each passing moment, we draw closer to the horizon of our dreams. Two more steps, two more chances to chase our aspirations with unwavering resolve. Let us not falter in our pursuit, but rather press forward with courage and conviction. Two more opportunities to make a difference, to leave an indelible mark upon the world. With every stride, we inch closer to our destination, fueled by the fire within. Two more moments to embrace the journey, to savor the triumphs, and to learn from the setbacks." };
String currentSelectString = selectionDays['Yesterday']!;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // get app  primary color
    Color primaryColor = Theme.of(context).primaryColor;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: primaryColor.withOpacity(0.3),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //title
                Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width:1)
                    )
                  ), child: Center(child: Text('Gemini' , style: TextStyle(color: primaryColor , fontWeight: FontWeight.bold , fontSize: size.width*0.05),))),
                const SizedBox(height: 10,),
                
                //selection button group
                selectedDaySection(),
                SizedBox(height: size.height*0.05,),
                
                Text(currentSelectString , style: TextStyle(fontSize: size.width*0.05),)
              ],
            ),
          ),
        ),
      ),
    );

  }

  Widget selectedDaySection(){
    return Row(
      children: selectionDays.keys.toList().asMap().entries.map((entry){
        String day = entry.value;
        int index = entry.key, first = 0 , last = selectionDays.keys.toList().length-1;
     print('day :: $entry' );
        return Expanded(
          child: InkWell(
            onTap: (){
              setState(() {
                selectedIndex = index;
                currentSelectString = selectionDays[entry.value]!;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius:index == first ?  const BorderRadius.only(topLeft: Radius.circular(10) ,bottomLeft:  Radius.circular(10)) : index == last ? const BorderRadius.only(topRight: Radius.circular(10) ,bottomRight:  Radius.circular(10)) : null,
                  border:index != first && index != last ? const Border(top: BorderSide(width: 1) , bottom: BorderSide(width: 1)) :  Border.all(width: 1)
              ),
              child: Center(child: Text(day.toString() ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.05 , color:index != selectedIndex  ?  Theme.of(context).primaryColor.withOpacity(0.6): Theme.of(context).primaryColor , fontWeight: FontWeight.bold), )),
            ),
          ),
        );
      }).toList(),
    );
  }
}
