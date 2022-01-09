class Trainings {
  String? trainingId;
  String? trainingTitle;
  String? ratings;
  String? tag;
  String? trainerName;
  String? trainingDate;
  String? trainingTime;
  String? trainerImage;
  String? companyImage;
  String? trainingBanner;
  String? trainingLocation;
  String? oldPrice;
  String? newPrice;

  Trainings(
      {trainingId,
      trainingTitle,
      ratings,
      tag,
      trainerName,
      trainingDate,
      trainingTime,
      trainerImage,
      companyImage,
      trainingBanner,
      trainingLocation,
      oldPrice,
      newPrice});

  Trainings.fromJson(Map<String, dynamic> json) {
    trainingId = json['training_id'];
    trainingTitle = json['training_title'];
    ratings = json['ratings'];
    tag = json['tag'];
    trainerName = json['trainer_name'];
    trainingDate = json['training_date'];
    trainingTime = json['training_time'];
    trainerImage = json['trainer_image'];
    companyImage = json['company_image'];
    trainingBanner = json['training_banner'];
    trainingLocation = json['training_location'];
    oldPrice = json['old_price'];
    newPrice = json['new_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['training_id'] = trainingId;
    data['training_title'] = trainingTitle;
    data['ratings'] = ratings;
    data['tag'] = tag;
    data['trainer_name'] = trainerName;
    data['training_date'] = trainingDate;
    data['training_time'] = trainingTime;
    data['trainer_image'] = trainerImage;
    data['company_image'] = companyImage;
    data['training_banner'] = trainingBanner;
    data['training_location'] = trainingLocation;
    data['old_price'] = oldPrice;
    data['new_price'] = newPrice;
    return data;
  }
}
