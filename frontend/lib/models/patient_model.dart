class PatientModel {
  String? name;
  String? email;
  String? phnNumber;
  String? address;
  String? medDetails;
  String? latestMedDetails;

  PatientModel({
    this.name,
    this.email,
    this.phnNumber,
    this.address,
    this.medDetails,
    this.latestMedDetails,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['name'] = name;
    data["phn_number"] = phnNumber;
    data["address"] = address;
    data["med_details"] = medDetails;
    data["latest_med_details"] = latestMedDetails;
    return data;
  }
}
