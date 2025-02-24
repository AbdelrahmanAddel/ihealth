import 'package:flutter/material.dart';
import 'package:i_health/core/constants/app_strings.dart';
import 'package:i_health/core/constants/app_text_style.dart';
import '../../data/disease_info.dart';

class DictionaryContent extends StatelessWidget {
  const DictionaryContent({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          diseaseInfo[index].disease,
          style: AppTextStyle.poppins60030.copyWith(fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              sectionTitle(AppStrings.description),
              sectionContent(diseaseInfo[index].description),
              divider(),
              sectionTitle(AppStrings.causes),
              sectionContent(diseaseInfo[index].causes),
              divider(),
              sectionTitle(AppStrings.symptoms),
              sectionContent(diseaseInfo[index].symptoms),
              divider(),
              sectionTitle(AppStrings.diagnosis),
              sectionContent(diseaseInfo[index].diagnosis),
              divider(),
              sectionTitle(AppStrings.treatmentDuration),
              sectionContent(diseaseInfo[index].treatmentDuration),
              divider(),
              sectionTitle(AppStrings.medication),
              sectionContent(diseaseInfo[index].medication),
              divider(),
              sectionTitle(AppStrings.alternativeTreatments),
              sectionContent(diseaseInfo[index].alternativeTreatments),
              divider(),
              sectionTitle(AppStrings.diet),
              sectionContent(diseaseInfo[index].diet),
              divider(),
              sectionTitle(AppStrings.homeRemedies),
              sectionContent(diseaseInfo[index].homeRemedies),
              divider(),
              sectionTitle(AppStrings.advice),
              sectionContent(diseaseInfo[index].advice),
              divider(),
              sectionTitle(AppStrings.atRiskGroups),
              sectionContent(diseaseInfo[index].atRiskGroups),
              divider(),
              sectionTitle(AppStrings.complications),
              sectionContent(diseaseInfo[index].complications),
              divider(),
              sectionTitle(AppStrings.prevention),
              sectionContent(diseaseInfo[index].prevention),
              divider(),
              sectionTitle(AppStrings.references),
              sectionContent(diseaseInfo[index].references),
              divider(),
              sectionTitle(AppStrings.diseaseImage),
              const SizedBox(height: 10),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      diseaseInfo[index].image,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 8),
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyle.poppins60030.copyWith(
              fontSize: 22,
              decoration: TextDecoration.underline, // خط تحت العنوان
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionContent(String content) {
    return SelectableText(
      content,
      style: AppTextStyle.poppins50020.copyWith(fontSize: 18),
    );
  }

  Widget divider() {
    return const Divider(thickness: 1.2, height: 30, color: Colors.grey);
  }
}
