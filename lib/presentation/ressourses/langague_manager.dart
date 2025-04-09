enum LangagueType {
  ARABIC,
  ENGLISH,
}

extension LangagueTypeExtension on LangagueType {
  String get value {
    switch (this) {
      case LangagueType.ARABIC:
        return "ar";
      case LangagueType.ENGLISH:
        return "en";
    }
  }

  String get displayName {
    switch (this) {
      case LangagueType.ARABIC:
        return "Arabic";
      case LangagueType.ENGLISH:
        return "English";
    }
  }
}
