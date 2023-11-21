import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/controllers/UploadController.dart';

class ContentYearSelection extends StatefulWidget {
  @override
  _ContentYearSelectionState createState() => _ContentYearSelectionState();
}

class _ContentYearSelectionState extends State<ContentYearSelection> {
  final uploadController = Get.find<UploadController>();
  late TextEditingController _yearController; // 컨트롤러를 late로 선언
  List<int> yearList = List.generate(20, (index) => DateTime.now().year - index);
  int? selectedYear;

  @override
  void initState() {
    super.initState();
    selectedYear = DateTime.now().year; // 기본값으로 현재 년도 설정
    uploadController.content.contentYear = DateTime(selectedYear!);
    _yearController = TextEditingController(text: selectedYear.toString()); // 초기값 설정
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _yearController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: '자료의 년도',
      ),
      readOnly: true, // 사용자가 직접 편집하는 것을 방지
      onTap: () {
        _selectYear(context);
      },
    );
  }

  void _selectYear(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: CupertinoPicker(
            backgroundColor: Colors.white,
            itemExtent: 30,
            scrollController: FixedExtentScrollController(initialItem: yearList.indexOf(selectedYear ?? DateTime.now().year)),
            children: yearList.map((year) => Text(year.toString())).toList(),
            onSelectedItemChanged: (value) {
              selectedYear = yearList[value];
              _yearController.text = selectedYear.toString();
              uploadController.content.contentYear = DateTime(selectedYear!); // 컨트롤러 업데이트
            },
          ),
        );
      },
    );
  }
}

