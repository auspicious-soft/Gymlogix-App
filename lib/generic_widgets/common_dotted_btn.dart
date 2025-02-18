import 'package:flutter/material.dart'; 
import 'package:dotted_border/dotted_border.dart'; 
import 'package:gymlogix/features/workout/presentation/create_exercise/AddExerciseDays/pg_add_ex_days.dart';
 
class CommonDottedButton extends StatelessWidget {
  const CommonDottedButton({
    super.key,
    required this.onClick
  });
final Function onClick;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
        child: GestureDetector(
            onTap: () => {
              onClick()
                  
                },
            child: DottedBorder(
              color: const Color.fromRGBO(147, 141, 141, 1),
              strokeWidth: 1,
              borderType: BorderType.RRect,
              radius: const Radius.circular(15),
              dashPattern: const [6, 3],
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 61,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: Color.fromRGBO(147, 141, 141, 1),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Add workout",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(147, 141, 141, 1),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
