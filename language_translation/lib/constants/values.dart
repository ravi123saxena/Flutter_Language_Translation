
 enum TranslationType {
   textInput,
   voiceRecognition;
 }

class TranslationHelperType{
  static String getValue(TranslationType type){
    switch(type){
      case TranslationType.textInput: 
        return "Text Input";
      case TranslationType.voiceRecognition:
        return "Voice Recognition";
      default:
        return "";
    }
  }
}