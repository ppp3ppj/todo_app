import 'package:crud_bloc/src/bloc/crud_bloc.dart';
import 'package:crud_bloc/src/models/device_model.dart';
import 'package:crud_bloc/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoPage extends StatefulWidget {
  final String title;

  const AddTodoPage({Key? key, required this.title}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {

  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  bool toggleSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            CustomText(text: 'title'.toUpperCase()),
            TextFormField(controller: _title),
            CustomText(text: 'description'.toUpperCase()),
            TextFormField(controller: _description),
            CustomText(text: 'important'.toUpperCase()),
            Switch(
              value: toggleSwitch,
              onChanged: (newVal) {
                setState(() {
                  toggleSwitch = !toggleSwitch;
                });
              },
            ),
            BlocBuilder<CrudBloc, CrudState>(
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: () {
                      if (_title.text.isNotEmpty &&
                          _description.text.isNotEmpty) {
                        context.read<CrudBloc>().add(
                          AddDevice(title: _title.text),
                            );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text("todo added successfully"),
                        ));
                        // context.read<CrudBloc>().add(const FetchTodos());
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "title and description fields must not be blank"
                                  .toUpperCase()),
                        ));
                      }
                    },
                    child: const Text('Add Todo'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
