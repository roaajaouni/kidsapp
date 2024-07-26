import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/mother_select_meals_bloc/selecte_meals_bloc.dart';
import 'package:flutter_childhood/model/mother_app_model/mother_meals_model.dart';
import 'package:flutter_childhood/service/base_service.dart';

import '../../../core/constant/color.dart';

class MealsPage extends StatefulWidget {
  final int id;
  const MealsPage({super.key, required this.id,  });

  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
 late List<MoherMealsModel> meals=[];
  //  late List<bool> isSelected; 
late List< bool >isSelectedMeal=[];
  @override
  void initState() {
    super.initState();
      isSelectedMeal = List<bool>.generate(meals.length, (index) => false);
    // isSelectedMeal = List<bool>.generate(meals.length, (index) => false);
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Meal service",
              style: TextStyle(color: AppColor.fairuz),
            ),
            backgroundColor: AppColor.terqaz,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColor.fairuz,
              ),
            )),
      body: BlocProvider(
        create: (context) => SelecteMealsBloc()..add(GetAllMealsEvent()),
       
          child: ListView(children: [
            
               Column(
                children: [
                 
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                      child: Text('Choose your child \'s favorite meal ',
                          style:
                              TextStyle(fontSize: 20, color: AppColor.grey))),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<SelecteMealsBloc, SelecteMealsState>(
                        builder: (context, state) {
                          if (state is GetAllMealsSuccesState) {
                           
                        
                         meals=state.moherMealsModel;
                  
                            return  SizedBox(
                              height: 700,
                              child: ListView.builder(
                                   
                                  // ! put item count here
                                  itemCount: meals.length,
                                  // state.moherMealsModel.length,
                                
                                  itemBuilder: (context, index) {
                                    return Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        alignment: Alignment.center,
                                        height: 100,
                                        // margin: const EdgeInsets.only(
                                        //   top: 15,
                                        // ),
                                        child: ListTile(
                                          // leading:  CircleAvatar(
                                          //     radius: 30,
                                          //     backgroundColor: AppColor.babypurple,
                                          //     backgroundImage:
                                          //         // AssetImage(AppImageAsset.home)
                                          //         state.moherMealsModel[index].image,
                                          //         ),
                                
                                          leading: SizedBox(width: 40,height: 40,
                                            child: ClipOval(child: Image.network(BaseService.imageurl + state.moherMealsModel[index].image))),
                                          // ! put food name here
                                          title:  Text(state.moherMealsModel[index].name
                                            
                                              ),
                              
                                              trailing: InkWell(
                                                onTap: () { 
                                           
                                                  context.read<SelecteMealsBloc>().add( SelectMealEvent(id: widget.id, mealName: state.moherMealsModel[index].name));
                                                },
                                                child:const Icon(Icons.add_circle_outline,color: AppColor.terqaz,),
                                              ),
                                          // trailing: Checkbox(
                                          //   activeColor: AppColor.fairuz,
                                          //   // ! put isSelcetd value here
                                          //   value: isSelectedMeal[index]=false,
                                            
                                          //   //  state.moherMealsModel[index],
                                          //   onChanged: (val) {
                                          //     // ! onChanged Function here
                                          //     setState(() {
                                          //       isSelectedMeal[index] = val!;
                                          //     // state.moherMealsModel[index].isSelcetd =val!;
                                          //     });
                                          //   },
                                          // ),
                                        ));
                                  },
                                ),
                            );
                           
                          } else if(state is MealsFailureState){
                            return Center(child: Text(state.errorMessage),);
                          }
                         else if (state is MealsLoadingState) {
                        
                            return const Center(
                              child:Center(child: CircularProgressIndicator(),),
                            );
                            }else{
                              return SizedBox();
                            }
                           
                          
                        },
                      ),
                 

                ],
              ),
            
          ]),
        
      ),
    );
  }
}
