import 'package:bloc_examples/bloc/Switch/switch_bloc.dart';
import 'package:bloc_examples/bloc/Switch/switch_event.dart';
import 'package:bloc_examples/bloc/Switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Switch Example'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Notifications'),
                  BlocBuilder<SwitchBloc, SwitchState>(
                    buildWhen: (previous, current) =>
                        previous.isSwitch != current.isSwitch,
                    builder: (context, state) {
                      print('switch');
                      return Switch(
                          value: state.isSwitch,
                          onChanged: (newvalue) {
                            print(newvalue);
                            context
                                .read<SwitchBloc>()
                                .add(enableanddisablenotification());
                          });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.slider),
                );
              }),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) =>
                      previous.slider != current.slider,
                  builder: (context, state) {
                    print('slider');
                    return Slider(
                        value: state.slider,
                        onChanged: (value) {
                          context
                              .read<SwitchBloc>()
                              .add(slidervalue(slider: value));
                        });
                  }),
            ],
          ),
        ));
  }
}
