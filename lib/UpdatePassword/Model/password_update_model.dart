class UpdatePassword{

  final String oldPassword;
  final String newPassword;

  UpdatePassword({
    required this.oldPassword,
    required this.newPassword
});

  Map<String, dynamic> toJson(){
    return {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    };
  }
}