import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../core/widget/navigation/app_appbar.dart';
import '../../../../../../../../../localization/locale_keys.dart';
import '../../../controllers/bantuan/kebijakan_privasi/index_controller.dart';
import 'widgets/changes_section.dart';
import 'widgets/children_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/footer_section.dart';
import 'widgets/information_section.dart';
import 'widgets/introduction_section.dart';
import 'widgets/local_storage_section.dart';
import 'widgets/permission_section.dart';
import 'widgets/privacy_hero.dart';
import 'widgets/security_section.dart';
import 'widgets/third_party_section.dart';

class IndexKebijakanPrivasiView extends GetView<IndexKebijakanPrivasi> {
  const IndexKebijakanPrivasiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPengguna(
        title: LocaleKeys.privacyPolicy.tr,
        onBackPressed: () {
          Get.back();
        },
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          PrivacyHero(),
          SizedBox(height: 28),
          IntroductionSection(),
          SizedBox(height: 24),
          InformationSection(),
          SizedBox(height: 24),
          PermissionSection(),
          SizedBox(height: 24),
          LocalStorageSection(),
          SizedBox(height: 24),
          SecuritySection(),
          SizedBox(height: 24),
          ThirdPartySection(),
          SizedBox(height: 24),
          ChildrenSection(),
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
