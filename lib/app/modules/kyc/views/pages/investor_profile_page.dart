import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/custom_dropdown.dart';
import 'package:yanci/app/components/custom_required_rich_text.dart';
import 'package:yanci/app/components/custom_textfield.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/kyc/controllers/kyc_controller.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class InvestorProfilePage extends StatelessWidget {
  const InvestorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Get.find<KycController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          StringConstants.investorProfile,
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w700),
        ),
        20.kheightBox,
        SizedBox(
          width: double.infinity,
          child: Text(
            StringConstants.employmentInfo,
            textAlign: TextAlign.left,
            style: TextStyleUtil.kText16_5(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        10.kheightBox,
        StDropDown(
          title: StRichText(text: StringConstants.employmentStatus, color: context.redColor),
          dropdownMenuEntries: kycController.employmentStatus.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
          onSelected: (String val) => kycController.selectedEmploymentStatus = val,
        ),
        20.kheightBox,
        StDropDown(
          title: StRichText(text: StringConstants.occupation, color: context.redColor),
          dropdownMenuEntries: kycController.occupation.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
          onSelected: (String val) => kycController.selectedOccupation = val,
        ),
        20.kheightBox,
        StDropDown(
          title: StRichText(text: StringConstants.selectMonthlyIncome, color: context.redColor),
          dropdownMenuEntries: kycController.monthlyIncome.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
          onSelected: (String val) => kycController.selectedIncome = val,
        ),
        20.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.employerName, color: context.redColor),
          hint: StringConstants.employerName,
          controller: kycController.employerNameController,
        ),
        20.kheightBox,
        StDropDown(
          title: StRichText(text: StringConstants.natureOFBusiness, color: context.redColor),
          dropdownMenuEntries: kycController.natureOfBusiness.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
          onSelected: (String val) => kycController.selectedNature = val,
        ),
        20.kheightBox,
        StDropDown(
          title: StRichText(text: StringConstants.everBoughtGhanaSecurity, color: context.redColor),
          dropdownMenuEntries: kycController.everBoughtGhanaSecurity.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
          onSelected: (String val) => kycController.selectedSecurity = val,
        ),
        20.kheightBox,
        StDropDown(
          title: StRichText(text: StringConstants.whereDidYouHearYanci, color: context.redColor),
          dropdownMenuEntries: kycController.whereHearYanci.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
          onSelected: (String val) => kycController.selectedHearYanci = val,
        ),
        20.kheightBox,
        CustomButton(
          title: StringConstants.continueText,
          onTap: () => kycController.nextPage(),
          borderRadius: 50,
        ),
      ],
    );
  }
}
