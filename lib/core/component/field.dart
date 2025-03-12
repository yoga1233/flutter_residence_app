import 'package:flutter/material.dart';
import 'package:flutter_residence_app/core/core.dart';

enum FieldStyleType { password, email, text, number }

class Field extends StatefulWidget {
  const Field.text({
    super.key,
    this.label,
    this.type = FieldStyleType.text,
    this.controller,

    this.hint,
    this.error,
    this.validator,
    this.maxline,
  });
  const Field.email({
    super.key,
    this.label,
    this.type = FieldStyleType.email,
    this.controller,

    this.hint,
    this.error,
    this.validator,
    this.maxline,
  });
  const Field.password({
    super.key,
    this.label,
    this.type = FieldStyleType.password,
    this.controller,

    this.hint,
    this.error,
    this.validator,
    this.maxline,
  });
  const Field.number({
    super.key,
    this.label,
    this.type = FieldStyleType.number,
    this.controller,

    this.hint,
    this.error,
    this.validator,
    this.maxline,
  });

  final String? label;
  final FieldStyleType type;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxline;

  final String? hint;
  final String? error;

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  bool obscureText = true;

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return switch (widget.type) {
      FieldStyleType.email => Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(widget.label ?? 'Your Email Account'),
          6.height,
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            obscureText: false,
            validator: widget.validator ?? _validateEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'ahjgsjskk@kjjkdak.com',
              // labelText: widget.label ?? "email",
              errorText: widget.error,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
      FieldStyleType.password => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label ?? 'Password'),
          6.height,
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator ?? _validatePassword,
            controller: widget.controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: '*********',
              // labelText: widget.label ?? "password",
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  obscureText = !obscureText;
                  setState(() {});
                },
              ),
              errorText: widget.error,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
      FieldStyleType.number => TextField(
        controller: widget.controller,
        obscureText: false,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: widget.hint,
          labelText: widget.label ?? "number",
          errorText: widget.error,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      FieldStyleType.text => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label ?? 'text'),
          6.height,
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            obscureText: false,
            validator: widget.validator,
            keyboardType: TextInputType.emailAddress,
            maxLines: widget.maxline,
            decoration: InputDecoration(
              hintText: widget.hint ?? 'Your name',
              // labelText: widget.label ?? "email",
              errorText: widget.error,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    };
  }
}
