import 'package:fashionapp/features/address/domain/entities/create_address.dart';
import 'package:fashionapp/features/address/presentation/controllers/address_notifier.dart';
import 'package:fashionapp/features/address/presentation/widgets/address_submit_button.dart';
import 'package:fashionapp/features/address/presentation/widgets/address_text_field.dart';
import 'package:fashionapp/features/address/presentation/widgets/address_type_selector.dart';
import 'package:fashionapp/features/address/presentation/widgets/default_address_toggle.dart';
import 'package:flutter/material.dart';
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
              AddressTextField(
                hintText: 'phone',
                keyboard: TextInputType.phone,
                controller: _phone,
                onSubmitted: (p0) {},
              ),
              AddressTextField(
                hintText: 'address',
                keyboard: TextInputType.text,
                controller: _address,
                onSubmitted: (p0) {},
              ),
              AddressTypeSelector(
                addressTypes: value.addressTypes,
                selectedType: value.addressType,
                onSelected: value.setAddressType,
              ),
              SizedBox(height: 12),
              DefaultAddressToggle(
                value: value.defaultToggle,
                onChanged: value.setDefaultToggle,
              ),
              SizedBox(height: 12),
              AddressSubmitButton(
                onPressed: () {
                  if (_address.text.isNotEmpty &&
                      _phone.text.isNotEmpty &&
                      value.addressType != '') {
                    final createAddress = CreateAddress(
                      lat: 0.00,
                      lan: 0.00,
                      isDefault: value.defaultToggle,
                      address: _address.text,
                      phone: _phone.text,
                      addressType: value.addressType,
                    );
                    value.addAddress(createAddress, context);
                  } else {
                    print('fields are empty');
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
