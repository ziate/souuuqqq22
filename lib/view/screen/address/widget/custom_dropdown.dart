import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class SharedDropdown<T> extends StatelessWidget {
  const SharedDropdown({
    Key key,
    this.mValidator,
    this.mOnChanged,
    this.mOnSaved,
    this.listItem,
    this.value,
    this.label,
    this.enabled = true,
    this.maxHeight,
  }) : super(key: key);

  final String Function(T) mValidator;
  final void Function(T) mOnChanged;
  final void Function(T) mOnSaved;
  final List<T> listItem;
  final T value;
  final String label;
  final bool enabled;
  final double maxHeight;

//  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
//     return OutlineInputBorder( //Outline border type for TextFeild
//       borderRadius: BorderRadius.all(Radius.circular(20)),
//       borderSide: BorderSide(
//           color:Colors.redAccent,
//           width: 3,
//         )
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      // label: ,
      // hint: label,

      mode: Mode.MENU,
      selectedItem: value,
      items: listItem,
      dropDownButton: const Icon(
        Icons.keyboard_arrow_down_sharp,
        color: Colors.grey,
      ),
      dropdownSearchDecoration: InputDecoration(
        hintStyle: TextStyle(fontFamily: 'Cairo'),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        border: OutlineInputBorder(
          gapPadding: 50,
        ),
        hintText: label,
        // contentPadding:
      ),
      //dropdownSearchDecoration: InputDecoration()

      //
      //
      // kInputBorder.copyWith(
      //   labelText: label,
      //   contentPadding: const EdgeInsets.only(left: 12, top: 12),
      // ),
      onChanged: mOnChanged,
      onSaved: mOnSaved,
      maxHeight: maxHeight,
      validator: mValidator,
      enabled: enabled,
    );
  }
}