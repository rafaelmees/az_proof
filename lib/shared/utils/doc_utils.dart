class DocUtils {
  static String formatDoc(
    String value,
  ) {
    if (value.length > 11) {
      return value.replaceAllMapped(RegExp(r'(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})'), (Match match) => '${match[1]}.${match[2]}.${match[3]}/${match[4]}-${match[5]}');
    }
    return value.replaceAllMapped(RegExp(r'(\d{3})(\d{3})(\d{3})(\d{2})'), (Match match) => '${match[1]}.${match[2]}.${match[3]}-${match[4]}');
  }
}