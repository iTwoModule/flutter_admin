import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/vo/selectOptionVO.dart';
import 'cryFormField.dart';

class CrySelect extends CryFormField {
  CrySelect({
    Key key,
    double width,
    String label,
    String value,
    ValueChanged onChange,
    FormFieldSetter onSaved,
    List<SelectOptionVO> dataList = const [],
  }) : super(
          key: key,
          width: width,
          builder: (CryFormFieldState state) {
            return DropdownButtonFormField<String>(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                labelText: label,
              ),
              value: value,
              items: dataList.map((v) {
                return DropdownMenuItem<String>(
                  value: v.value,
                  child: Text(v.label),
                );
              }).toList(),
              onChanged: (v) {
                value = v;
                if (onChange != null) {
                  onChange(v);
                }
                state.didChange();
              },
              onSaved: onSaved,
            );
          },
        );
}
