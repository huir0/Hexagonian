String deltaToHtmlEncoder(List delta) {
  StringBuffer html = StringBuffer();

  for (var element in delta) {
    if (element['insert'] is Map<String, dynamic>) {
      if (element['insert'].containsKey('link')) {
        String link = element['insert']['link'].toString();
        html.write("<a href='$link'>${element['insert']['text']}</a>");
      } else if (element['insert'].containsKey('code')) {
        html.write("<code>${element['insert']['text']}</code>");
      }
    } else {
      html.write(element['insert'].toString());
    }
  }

  return html.toString();
}
