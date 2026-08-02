import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../core/widget/navigation/app_appbar.dart';
import '../../../../../../../../../localization/locale_keys.dart';
import '../../../controllers/bantuan/syarat_dan_ketentuan/index_controller.dart';
import '../kebijakan_privasi/widgets/changes_section.dart';
import '../kebijakan_privasi/widgets/contact_section.dart';
import '../kebijakan_privasi/widgets/footer_section.dart';
import '../kebijakan_privasi/widgets/introduction_section.dart';
import 'widgets/AcceptanceofTerms.dart';
import 'widgets/Hero.dart';
import 'widgets/IntellectualProperty.dart';
import 'widgets/LimitationofLiability.dart';
import 'widgets/SecurityDisclaimer.dart';
import 'widgets/Termination.dart';
import 'widgets/UseoftheApplication.dart';
import 'widgets/UserResponsibilities.dart';

class IndexSyaratdanKetentuanView
    extends GetView<IndexSyaratdanKetentuanController> {
  const IndexSyaratdanKetentuanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPengguna(
        title: LocaleKeys.terms.tr,
        onBackPressed: () {
          Get.back();
        },
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          TermsHero(),
          SizedBox(height: 28),
          IntroductionSection(),
          SizedBox(height: 24),
          AcceptanceSection(),
          SizedBox(height: 24),
          UseApplicationSection(),
          SizedBox(height: 24),
          UserResponsibilitySection(),
          SizedBox(height: 24),
          SecurityDisclaimerSection(),
          SizedBox(height: 24),
          IntellectualPropertySection(),
          SizedBox(height: 24),
          LiabilitySection(),
          SizedBox(height: 24),
          TerminationSection(),
          SizedBox(height: 24),
          ChangesSection(),
          SizedBox(height: 24),
          ContactSection(),
          SizedBox(height: 24),
          FooterSection(),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
