import 'package:SIKOMPAK/models/customer.dart';
import 'package:SIKOMPAK/service/api_service.dart';
import 'package:SIKOMPAK/utils/ProgressHUD.dart';
import 'package:SIKOMPAK/utils/form_helper.dart';
import 'package:SIKOMPAK/utils/validator_service.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  APIService apiService;
  CustomerModel model;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool isApiCallProcess = false;

  @override
  void initState() {
    apiService = new APIService();
    model = new CustomerModel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: true,
        title: Text("Daftar Menjadi Anggota"),
      ),
      body: ProgressHUD(
        child: new Form(
          key: globalKey,
          child: _formUI(),
        ),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
      ),
    );
  }

  Widget _formUI() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormHelper.fieldLabel("Nama Pelaku Usaha"),
              FormHelper.textInput(
                context,
                model.name,
                (value) => {
                  this.model.name = value,
                },
                onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return 'Silahkan Masukan Nama';
                  }
                  return null;
                },
              ),
              FormHelper.fieldLabel("No. Telepon"),
              FormHelper.textInput(
                context,
                model.telephone,
                (value) => {
                  this.model.telephone = value,
                },
                onValidate: (value) {
                  return null;
                },
              ),
              FormHelper.fieldLabel("Alamat"),
              FormHelper.textInput(
                context,
                model.alamat,
                (value) => {
                  this.model.alamat = value,
                },
                onValidate: (value) {
                  return null;
                },
              ),
              // FormHelper.fieldLabel("Kategori Produk"),
              // FormHelper.textInput(
              //   context,
              //   model.kategoriProduk,
              //   (value) => {
              //     this.model.kategoriProduk = value,
              //   },
              //   onValidate: (value) {
              //     return null;
              //   },
              // ),
              FormHelper.fieldLabel("Email"),
              FormHelper.textInput(
                context,
                model.email,
                (value) => {
                  this.model.email = value,
                },
                onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return 'Silahkan Masukan Email';
                  }
                  if (value.isNotEmpty && !value.toString().isValidEmail()) {
                    return 'Silahkan masukkan email yang telah terdaftar';
                  }
                  return null;
                },
              ),
              FormHelper.fieldLabel("Password"),
              FormHelper.textInput(
                context,
                model.password,
                (value) => {
                  this.model.password = value,
                },
                onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return 'Silahkan Masukan Password';
                  }
                  return null;
                },
                obscureText: hidePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  color: Theme.of(context).accentColor.withOpacity(0.4),
                  icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              new Center(
                child: FormHelper.saveButton("Daftar", () {
                  if (validateAndSave()) {
                    print(model.toJson());
                    setState(() {
                      isApiCallProcess = true;
                    });
                    apiService.createCustomer(model).then((ret) {
                      setState(() {
                        isApiCallProcess = false;
                      });
                      if (ret) {
                        FormHelper.showMessage(
                          context,
                          "SIKOMPAK-LSJ",
                          "Pendaftaran Berhasil",
                          "OK",
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      } else {
                        FormHelper.showMessage(
                          context,
                          "SIKOMPAK-LSJ",
                          "Email sudah terdaftar",
                          "OK",
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      }
                    });
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
