import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/common_button.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/features/food/presentation/CreateFood/pg_addfood.dart';

class PgCreatefood extends ConsumerStatefulWidget {
  const PgCreatefood({super.key});

  @override
  ConsumerState<PgCreatefood> createState() => _PgCreatefoodState();
}

class _PgCreatefoodState extends ConsumerState<PgCreatefood> {
  int? activeIndex = 0;
  TextEditingController? fieldFoodPlanName;
  TextEditingController? fieldProgramDetail;
  TextEditingController? fieldProgramTip;
  int? selectedValue;

  List<String> goals = [
    "Weight Lost",
    "Maintenance",
    "Muscle Gain",
    "Body Recomposition"
  ];

  @override
  void initState() {
    print("Create food page");
    super.initState();
    fieldFoodPlanName = TextEditingController();
    fieldProgramDetail = TextEditingController();
    fieldProgramTip = TextEditingController();
  }

  @override
  void dispose() {
    fieldFoodPlanName?.dispose();
    fieldProgramDetail?.dispose();
    fieldProgramTip?.dispose();
    super.dispose();
  }

  void showMessage(String msg) {
    var snackBar = SnackBar(content: Text(msg), duration: const Duration(seconds: 1),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AppAssets.background,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => {Navigator.pop(context)},
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Label(
                            txt: "Custom workout plan",
                            type: TextTypes.f_16_700,
                            forceColor: AppColors.whiteColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: Image.asset(
                          AppAssets.bellicon,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                height: 176,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.grey,
                ),
                child: Stack(
                  children: [
                    const Align(
                        alignment: Alignment.topCenter,
                        child: Label(
                          txt: "Start building your program",
                          type: TextTypes.f_20_900i,
                          forceColor: AppColors.whiteColor,
                        )),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Label(
                            txt: "PPL Bulking",
                            type: TextTypes.f_16_700,
                            forceColor: AppColors.whiteColor,
                          ),
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: Image.asset(
                              AppAssets.edit,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              if (activeIndex == 0)
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(children: [
                      const Label(
                        txt: "Give a meanigull name for your food plan",
                        type: TextTypes.f_14_700,
                        forceColor: AppColors.primaryColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        height: 54,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: AppColors.lightGrey),
                        ),
                        child: TextField(
                          controller: fieldFoodPlanName,
                          textAlignVertical: TextAlignVertical.top,
                          decoration: const InputDecoration(
                            hintText: "Type  name for food plan",
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontFamily: AppConst.fontFamily),
                          textInputAction: TextInputAction.done,
                          maxLines: null,
                        ),
                      )
                    ])),
              if (activeIndex == 1)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    child: GridView.builder(
                        itemCount: goals.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 items per row
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 3.5,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedValue = index;
                              });
                            },
                            child: Container(
                              // height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.red, width: 2), // Red border
                                borderRadius: BorderRadius.circular(
                                    15), // Rounded corners
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Radio<int>(
                                    value: index,
                                    groupValue: selectedValue,
                                    activeColor: Colors.red,
                                    onChanged: (int? value) {
                                      print(value);
                                      setState(() {
                                        selectedValue = value;
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      goals[index],
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                      softWrap: true,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              //here

              //here end

              if (activeIndex == 2)
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        const Label(
                          txt: "Descripe the program in details",
                          type: TextTypes.f_14_700,
                          forceColor: AppColors.primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          height: 120,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColors.lightGrey),
                          ),
                          child: TextField(
                            controller: fieldProgramDetail,
                            textAlignVertical: TextAlignVertical.top,
                            decoration: InputDecoration(
                              hintText:
                                  "A detail let you remind the value of your plan.",
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontFamily: AppConst.fontFamily),
                            textInputAction: TextInputAction.done,
                            maxLines: null,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Label(
                          txt: "Instruction and tips for the program",
                          type: TextTypes.f_14_700,
                          forceColor: AppColors.primaryColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          height: 120,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColors.lightGrey),
                          ),
                          child: TextField(
                            controller: fieldProgramTip,
                            textAlignVertical: TextAlignVertical.top,
                            decoration: InputDecoration(
                              hintText:
                                  "Let's see how you write a tip for your program",
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontFamily: AppConst.fontFamily),
                            textInputAction: TextInputAction.done,
                            maxLines: null,
                          ),
                        ),
                      ],
                    )),

                SizedBox(height: 60),
              commonButton(
                txt: "Next",
                context: context,
                onPressed: ()  {
                  if (activeIndex == 0)
                    {
                      if (fieldFoodPlanName!.text.isNotEmpty)
                        {
                          setState(() {
                            activeIndex = 1;
                          });
                        }
                      else
                        {showMessage("Please enter food plan.");}
                    }
                  else if (activeIndex == 1)
                    {
                      if (selectedValue != null)
                        {
                          setState(() {
                            activeIndex = 2;
                          });
                        }
                      else
                        {showMessage("Please choose your goal.");}
                    }
                  else
                    {
                      if (fieldProgramDetail!.text.isNotEmpty &&
                          fieldProgramTip!.text.isNotEmpty)
                        {
                          DataForPageAddPlan  plan  = DataForPageAddPlan(planName: fieldFoodPlanName!.text,
                            goalName: goals[selectedValue!], 
                            planDescription: fieldProgramDetail!.text,
                             planTip: fieldProgramTip!.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>   PgAddfood(planData: plan)),
                          );
                        }
                      else
                        {showMessage("Please write your details.");}
                    }
                },
              ),
            
              const SizedBox(height: 20),
            ],
          ),
        ])));
  }
}
