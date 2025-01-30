import 'package:fluency/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SignUpValidator
{
  String? validateEmail(String? value)
  {
    if (value == null || value.trim().isEmpty)
    {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!emailRegex.hasMatch(value))
    {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value)
  {
    if (value == null || value.isEmpty)
    {
      return 'Password is required';
    }
    if (value.length < 8)
    {
      return 'at least 8 characters';
    }

    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$');

    if (!passwordRegex.hasMatch(value))
    {
      return 'Password is not Valid';
    }
    return null;
  }

  void submitForm(GlobalKey<FormState> formKey, bool isChecked, context)
  {
    if (formKey.currentState!.validate() && !isChecked)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You Must Accept The Terms & Conditions', style: Styles.textStyle16,)),);
    }
    else if (!(formKey.currentState!.validate()) && isChecked)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Wrong Email Or Password!', style: Styles.textStyle16,)),);
    }
    else if (!(formKey.currentState!.validate()) && !isChecked)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Fill The Fields Correctly Please!', style: Styles.textStyle16,)),);
    }
  }

}


class LoginValidator
{
  String? validateEmail(String? value)
  {
    if (value == null || value.isEmpty)
    {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value))
    {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value)
  {
    if (value == null || value.isEmpty)
    {
      return 'Password is required';
    }
    if (value.length < 6)
    {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  void submitForm(GlobalKey<FormState> loginFormKey, context)
  {
    if (!(loginFormKey.currentState!.validate()))
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Wrong Email Or Password', style: Styles.textStyle16,)),);
    }
  }
}