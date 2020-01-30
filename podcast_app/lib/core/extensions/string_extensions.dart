extension UrlValidExtension on String {
  String asUrl() => Uri.encodeFull(this);
}
