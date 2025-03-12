class DiseaseInfoModel {
  final String disease;
  final String description;
  final String diet;
  final String medication;
  final String causes;
  final String symptoms;
  final String prevention;
  final String diagnosis;
  final String complications;
  final String treatmentDuration;
  final String advice;
  final String homeRemedies;
  final String atRiskGroups;
  final String alternativeTreatments;
  final String references;
  final String image;
  final String lifestyle;
  final String doctorSpecialization;

  DiseaseInfoModel({
    required this.lifestyle,
    required this.doctorSpecialization,
    required this.disease,
    required this.description,
    required this.diet,
    required this.medication,
    required this.causes,
    required this.symptoms,
    required this.prevention,
    required this.diagnosis,
    required this.complications,
    required this.treatmentDuration,
    required this.advice,
    required this.homeRemedies,
    required this.atRiskGroups,
    required this.alternativeTreatments,
    required this.references,
    required this.image,
  });
  factory DiseaseInfoModel.empty() {
    return DiseaseInfoModel(
      lifestyle: '',
      doctorSpecialization: '',
      disease: '',
      description: '',
      diet: '',
      medication: '',
      causes: '',
      symptoms: '',
      prevention: '',
      diagnosis: '',
      complications: '',
      treatmentDuration: '',
      advice: '',
      homeRemedies: '',
      atRiskGroups: '',
      alternativeTreatments: '',
      references: '',
      image: '',
    );
  }
}
