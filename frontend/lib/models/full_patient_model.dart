class FullPatientModel {
  int? id;
  String? name;
  String? email;
  String? phnNumber;
  String? address;
  String? medDetails;
  String? latestMedDetails;
  String? createdAt;
  String? updatedAt;

  FullPatientModel({
    this.id,
    this.name,
    this.email,
    this.phnNumber,
    this.address,
    this.medDetails,
    this.latestMedDetails,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data['email'] = email;
    data['name'] = name;
    data["phn_number"] = phnNumber;
    data["address"] = address;
    data["med_details"] = medDetails;
    data["latest_med_details"] = latestMedDetails;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }

  FullPatientModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    name = json["name"];
    phnNumber = json["phn_number"];
    address = json["address"];
    medDetails = json["med_details"];
    latestMedDetails = json["latest_med_details"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }
}
