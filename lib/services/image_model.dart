class ImageModel {
  int? notesId;
  String? notesTitle;
  String? notesContent;
  String? notesImage;
  int? notesUsers;

  ImageModel(
      {this.notesId,
      this.notesTitle,
      this.notesContent,
      this.notesImage,
      this.notesUsers});

  ImageModel.fromJson(Map<String, dynamic> json) {
    notesId = json['notes_id'];
    notesTitle = json['title'];
    notesContent = json['content'];
    notesImage = json['image'];
    notesUsers = json['notes_users'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['notes_id'] = this.notesId;
  //   data['notes_title'] = this.notesTitle;
  //   data['notes_content'] = this.notesContent;
  //   data['notes_image'] = this.notesImage;
  //   data['notes_users'] = this.notesUsers;
  //   return data;
  // }
}