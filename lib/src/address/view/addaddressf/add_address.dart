import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:fashionapp/src/address/controller/address_notifier.dart';
import 'package:fashionapp/src/addresses2/models/create_address.dart';
import 'package:flutter/cupertino.dart';
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
    _address = TextEditingController();
    _phone = TextEditingController();
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
        title: Text('Add Shipping address', style: TextStyle(fontSize: 15)),
        centerTitle: true,
      ),
      body: Consumer<AddressNotifier>(
        builder: (context, value, child) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            children: [
              SizedBox(height: 20.h),
              _buildtextfield(
                hintText: 'phone',
                keyboard: TextInputType.phone,
                controller: _phone,
                onSubmitted: (p0) {},
              ),
              _buildtextfield(
                hintText: 'address',
                keyboard: TextInputType.text,
                controller: _address,
                onSubmitted: (p0) {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(value.addressTypes.length, (i) {
                  final addressType = value.addressTypes[i];
                  return GestureDetector(
                    onTap: () {
                      value.setAddressType(addressType);
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.symmetric(horizontal: 18.w),
                      decoration: BoxDecoration(
                        color: value.addressType == addressType
                            ? Kolors.kPrimaryLight
                            : Kolors.kWhite,
                        border: Border.all(color: Kolors.kPrimary, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ReusableText(
                        text: addressType,
                        style: appStyle(12, Kolors.kWhite, FontWeight.normal),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      text: 'Set this address as default',
                      style: appStyle(12, Kolors.kDark, FontWeight.normal),
                    ),
                    CupertinoSwitch(
                      value: value.defaultToggle,
                      thumbColor: Kolors.kSecondaryLight,
                      activeTrackColor: Kolors.kPrimary,
                      onChanged: (d) {
                        value.setDefaultToggle(d);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: 30,

                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 161, 125, 112),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton(
                  onPressed: () {
                    if (_address.text.isNotEmpty &&
                        _phone.text.isNotEmpty &&
                        value.addressType != '') {
                      CreateAddress createAddress = CreateAddress(
                        lat: 0.00,
                        lan: 0.00,
                        isDefault: value.defaultToggle,
                        address: _address.text,
                        phone: _phone.text,
                        addressType: value.addressType,
                      );

                      String data = createAddressToJson(createAddress);
                      value.addAddress(data, context);
                    } else {
                      print('fields are empty');
                    }
                  },
                  child: Text(
                    'S U B M I T',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          );
        },
      ),
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
          border: InputBorder.none,
        ),
        controller: controller,
        cursorHeight: 25,
        style: appStyle(12, Colors.black, FontWeight.normal),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
