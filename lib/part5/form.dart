import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_trainee_education/part5/user.dart';
import 'package:flutter_trainee_education/part5/user_info_page.dart';

class FormExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RegisterFormPage());
  }
}

class RegisterFormPage extends StatefulWidget {
  @override
  _RegisterFormPageState createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _hidePass = true;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passController = TextEditingController();

  List<String> _countries = ["Russia", "Ukraine", "Germany", "France"];
  String _selectedCountry;

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passwordFocus = FocusNode();

  User newUser = User();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Register form"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              focusNode: _nameFocus,
              autofocus: true,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _nameFocus, _phoneFocus);
              },
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Full name *",
                hintText: "What's your name?",
                prefixIcon: Icon(Icons.person),
                suffixIcon: GestureDetector(
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  onTap: () {
                    _nameController.clear();
                  },
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.black, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.blue, width: 1)),
              ),
              keyboardType: TextInputType.text,
              validator: _validateName,
              onSaved: (value) => newUser.name = value,
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              focusNode: _phoneFocus,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _phoneFocus, _passwordFocus);
              },
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: "Phone number *",
                hintText: "How can we reach you?",
                helperText: "Phone format (XXX)XXX-XXXX",
                // helperStyle: TextStyle(
                //   backgroundColor: Colors.blue,
                //   color: Colors.white
                // ),
                prefix: Icon(Icons.call),
                suffixIcon: GestureDetector(
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  onLongPress: () {
                    _phoneController.clear();
                  },
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.black, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.blue, width: 1)),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                WhitelistingTextInputFormatter(RegExp(r"^[()\d -]{1,15}"))
              ],
              validator: (value) =>
              _validatePhoneNumber(value) ? null : "Phone incorrect",
              onSaved: (value) => newUser.phone = value,
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: "Email address",
                  hintText: "Enter email address",
                  icon: Icon(Icons.mail)),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => newUser.email = value,
            ),
            SizedBox(
              height: 16,
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.map),
                  labelText: "Country"),
              items: _countries.map((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              onChanged: (data) {
                print(data);
                setState(() {
                  _selectedCountry = data;
                  newUser.country = data;
                });
              },
              value: _selectedCountry,
              validator: (val) {
                return val == null ? "Select country" : null;
              },
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _storyController,
              decoration: InputDecoration(
                  labelText: "Life story",
                  hintText: "Tell us about yourself",
                  helperText: "Keep it short. This is just a demo",
                  border: OutlineInputBorder()),
              maxLines: 3,
              inputFormatters: [LengthLimitingTextInputFormatter(100)],
              onSaved: (value) => newUser.story = value,
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _passController,
              obscureText: _hidePass,
              focusNode: _passwordFocus,
              decoration: InputDecoration(
                  labelText: "Password *",
                  hintText: "Enter password",
                  suffixIcon: IconButton(
                    icon: Icon(
                        _hidePass ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _hidePass = !_hidePass;
                      });
                    },
                  ),
                  icon: Icon(Icons.security)),
              maxLength: 8,
              onSaved: (value) => newUser.name = value,
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              obscureText: _hidePass,
              decoration: InputDecoration(
                  labelText: "Confirm password",
                  hintText: "Confirm password",
                  suffixIcon: IconButton(
                    icon: Icon(
                        _hidePass ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _hidePass = !_hidePass;
                      });
                    },
                  ),
                  icon: Icon(Icons.border_color)),
              maxLength: 8,
            ),
            SizedBox(
              height: 24,
            ),
            RaisedButton(
              onPressed: _submitForm,
              color: Colors.green,
              child: Text(
                "Submit form",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    print("Name ${_nameController.text}");

    if (_formKey.currentState.validate()) {
      print("Form is valid");
      _formKey.currentState.save();
      _showDialog(_nameController.text);
    } else {
      _showMessage(message: "Form is not valid");
    }
  }

  String _validateName(String value) {
    final _nameExp = RegExp("[A-Za-z]+");
    if (value.isEmpty) {
      return "Name is required";
    } else if (!_nameExp.hasMatch(value)) {
      return "Please enter chars";
    } else {
      return null;
    }
  }

  bool _validatePhoneNumber(String value) {
    final _phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
    return _phoneExp.hasMatch(value);
  }

  void _fieldFocusChange(BuildContext context, FocusNode current,
      FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  void _showMessage({String message}) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
      content: Text(
        message,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18
        ),
      ),
    ));
  }

  void _showDialog(String name) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Registration successful",
              style: TextStyle(
                  color: Colors.green
              ),
            ),
            content: Text(
              "$name is now verified",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoPage(userInfo: newUser)));
                },
                child: Text(
                  "Verified",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 18
                  ),
                ),
              )
            ],
          );
        }
    );
  }
}
