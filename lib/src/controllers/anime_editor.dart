class AnimeEditorController extends GetxController {
  final animeFormKey = GlobalKey<FormState>();
  final titleController = TextEditingController();

  @override
  void onInit() {
    
    super.onInit();
  }
  
  @override
  void onClose() {
    titleController.dispose();
    super.onClose();
  }

  String validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

}
