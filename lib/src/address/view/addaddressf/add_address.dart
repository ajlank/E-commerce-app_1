import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/src/address/controller/address_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  
  late final TextEditingController _address;
  late final TextEditingController _phone;

  @override
  void initState() {
    _address=TextEditingController();
    _phone=TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _address.dispose();
    _phone.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Shipping address',style: TextStyle(fontSize: 15),),
        centerTitle: true,
      ),
      body: Consumer<AddressNotifier>(
        builder: (context, value, child) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            children: [
              SizedBox(
                height: 20.h,
              ),
              _buildtextfield(hintText: 'phone', 
                keyboard:TextInputType.phone,
                controller: _phone,
                onSubmitted:(p0) {
                 
               }, ),
                _buildtextfield(hintText: 'address', 
                keyboard:TextInputType.text,
                controller: _address,
                onSubmitted:(p0) {
                 
               }, ),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:List.generate(value.addressTypes.length, (i){
                  return GestureDetector(
                 onTap: () {
                   value.setAddressType(value.addressTypes[i]);
                 },
               
                  );
                }),)
            ],
          );
        },),
    );
  }
}

class _buildtextfield extends StatelessWidget {
  const _buildtextfield({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onSubmitted,
    this.keyboard,
    this.readOnly,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboard;
  final void Function(String)? onSubmitted;
  final bool? readOnly;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: TextField(
          keyboardType: keyboard,
          readOnly: readOnly ?? false,
          decoration: InputDecoration(
              hintText: hintText,
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Kolors.kRed, width: 0.5),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Kolors.kPrimary, width: 0.5),
              ),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Kolors.kRed, width: 0.5),
              ),
              disabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Kolors.kGray, width: 0.5),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Kolors.kGray, width: 0.5),
              ),
              border: InputBorder.none),
          controller: controller,
          cursorHeight: 25,
          style: appStyle(12, Colors.black, FontWeight.normal),
          onSubmitted: onSubmitted),
    );
  }
}
