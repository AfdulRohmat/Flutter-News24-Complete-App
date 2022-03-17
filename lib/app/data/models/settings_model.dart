class SettingsModel {
  String icon, title;

  SettingsModel(this.icon, this.title);
}

List settingsData = [
  {
    "icon": "account.png",
    "title": "Account",
  },
  {
    "icon": "term_cond.png",
    "title": "Term & Conditions",
  },
  {
    "icon": "about.png",
    "title": "About",
  },
  {
    "icon": "logout.png",
    "title": "Log Out",
  },
];

List<SettingsModel> settings = settingsData
    .map((item) => SettingsModel(item['icon'], item['title']))
    .toList();
