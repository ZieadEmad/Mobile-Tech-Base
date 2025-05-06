bool isValidLink(String? value) {
  if (value == null) return false;
  return RegExp(r'^http(s)?://([\w-]+.)+[\w-]+(/[\w- ./?%&=])?$')
      .hasMatch(value);
}
