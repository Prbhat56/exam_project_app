import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_project_app/cubic/internet_cubic.dart';

class DynamicInternetPage extends StatelessWidget {
  const DynamicInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state == InternetState.Gained) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Internet Connected!"),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state == InternetState.Lost) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Internet not connected"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state == InternetState.Lost) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Please connect your device to the internet."),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => context.read<InternetCubit>().checkConnectivity(),
                      child: Text("Retry Connection"),
                    ),
                  ],
                );
              } else {
                // Return a different widget or simply an empty container when the connection is available
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
