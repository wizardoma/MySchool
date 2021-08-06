import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String title;
  final String placeholder;
  final bool isPassword;
  final FocusNode focusNode;
  final Function(String value) inputValidator;
  const TextInputField(
      {Key key,
        this.inputValidator,
      this.textEditingController,
      this.title,
        this.focusNode,
      this.placeholder,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: inputValidator,
            focusNode: focusNode,
            controller: textEditingController,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: placeholder,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
