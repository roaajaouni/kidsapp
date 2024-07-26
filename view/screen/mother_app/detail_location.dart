import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/location_bloc/child_location_bloc.dart';
import 'package:flutter_childhood/core/constant/color.dart';

class DetailLocationPage extends StatelessWidget {
  final int id;
  final String name;
  const DetailLocationPage({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ChildLocationBloc()..add(FetchChildLocationEvent(childId: id)),
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(8),
          child: BlocBuilder<ChildLocationBloc, ChildLocationState>(
            builder: (context, state) {
              if (state is ChildLocationIsFetchedState) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Icon(
                      Icons.location_on_outlined,
                      color: AppColor.terqaz,
                      size: 90,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text("$name's state",style:const TextStyle(fontSize: 30,color: AppColor.terqaz),),
                     const SizedBox(
                      height: 75,
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
                          child: state.motherLocationModel.Important_notes.isEmpty
     ? Text(
          "${state.motherLocationModel.location} \n",
          textAlign: TextAlign.center,style: const TextStyle(fontSize: 20),
        )
      : Text(
          "${state.motherLocationModel.Important_notes} \n",
          textAlign: TextAlign.center,style: const TextStyle(fontSize: 20),
        ),
                          
                          
                          ),
                    ),
                  ],
                );
              } else if (state is ChildLocationFailureState) {
                return Center(child: Text(state.errorMessage));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
