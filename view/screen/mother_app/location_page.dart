import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/location_bloc/child_location_bloc.dart';
import 'package:flutter_childhood/core/constant/color.dart';
import 'package:flutter_childhood/model/mother_app_model/location_model.dart';
import 'package:flutter_childhood/view/screen/mother_app/detail_location.dart';
import 'package:flutter_childhood/view/widget/login/custombutton.dart';

class MotherLocationPage extends StatefulWidget {
  final int id;
  final String name;
  MotherLocationPage({super.key, required this.id, required this.name});

  @override
  State<MotherLocationPage> createState() => _MotherLocationPageState();
}

class _MotherLocationPageState extends State<MotherLocationPage> {
  TextEditingController Importan_notes = TextEditingController();
  String dropDownValue = 'arrive';
  @override
  Widget build(BuildContext context) {
    return Scaffold(  appBar: AppBar(
          centerTitle: true,
            title: const Text(
              " child's location",
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
            ),
            actions:<Widget> [
              IconButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DetailLocationPage(id:widget.id,name: widget.name,)));
              }, icon: const Icon(Icons.location_on_outlined),iconSize: 30,color: AppColor.fairuz,)
            ],
            ),
      
        body: BlocProvider(
          create: (context) => ChildLocationBloc(),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      ' ',
                      style: TextStyle(fontSize: 18, color: AppColor.terqaz),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.fairuz,
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.only(
                              top: 20, left: 15, right: 15),
                          height: 200,
                          width: 300,
                          child: TextField(
                            controller: Importan_notes,
                            maxLines: 3,
                            decoration: const InputDecoration(
                                hintText: 'click here ',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 233, 230, 230))),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        margin: const EdgeInsets.all(2),
                        height: 300,
                        width: 300,
                        padding: const EdgeInsets.all(18),
                        child: Center(
                          heightFactor: 50.0,
                          child: DropdownButton<String>(
                            value: dropDownValue,
                            icon: const Icon(Icons.arrow_downward),
                            style: const TextStyle(color: AppColor.terqaz),
                            underline: Container(
                              height: 4,
                              color: AppColor.terqaz,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropDownValue = newValue!;
                              });
                            },
                            items: const [
                              DropdownMenuItem<String>(
                                  value: 'arrive',
                                  child: Text(
                                    'Arrived',
                                    style: TextStyle(fontSize: 20),
                                  )),
                              DropdownMenuItem<String>(
                                  value: 'left',
                                  child: Text(
                                    'Left',
                                    style: TextStyle(fontSize: 20),
                                  )),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    BlocBuilder<ChildLocationBloc, ChildLocationState>(
                      builder: (context, state) {
                        if (state is ChildLocationInitial) {
                          return Custombutton(
                            text: 'submit',
                            onPressed: () {
                              //! put the method
                              context
                                  .read<ChildLocationBloc>()
                                  .add(AddChildLocationEvent(
                                      childId: widget.id,
                                      motherLocationModel: MotherLocationModel(
                                        location: dropDownValue,
                                        Important_notes: Importan_notes.text,
                                      )));
                            },
                          );
                        } else if (state is ChildLocationLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Custombutton(
                            text: 'submit',
                            onPressed: () {
                              //! put the method
                              context
                                  .read<ChildLocationBloc>()
                                  .add(AddChildLocationEvent(
                                      childId: widget.id,
                                      motherLocationModel: MotherLocationModel(
                                        location: dropDownValue,
                                        Important_notes: Importan_notes.text,
                                      )));
                            },
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
