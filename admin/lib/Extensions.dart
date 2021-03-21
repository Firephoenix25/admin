extension NumberParsing on String {
  String toStringMonth() {
    if (this == "1") return "Gennaio";
    if (this == "2") return "Febbraio";
    if (this == "3") return "Marzo";
    if (this == "4") return "Aprile";
    if (this == "5") return "Maggio";
    if (this == "6") return "Giugno";
    if (this == "7") return "Luglio";
    if (this == "8") return "Agosto";
    if (this == "9") return "Settembre";
    if (this == "10") return "Ottobre";
    if (this == "11") return "Novembre";
    if (this == "12") return "Dicembre";

    return this;
  }
}

extension A on DateTime {
  String verifyday() {
    if (this.day == DateTime.now().day) return "Oggi";
    if (this.day == DateTime.now().add(Duration(days: 1)).day) return "Domani";
    if (this.day == DateTime.now().add(Duration(days: 2)).day)
      return "DopoDomani";

    return this.day.toString();
  }
}
