class ModuleData{
  final String title;
  final String subTitle;
  final String description;
  final String subDesciption;
  final String readTime;
  final String modulePic;

  ModuleData({
  required this.title,
  required this.subTitle,
  required this.description,
  required this.subDesciption,
  required this.readTime,
  required this.modulePic,
});
}

ModuleData module1Data() {
  return ModuleData(
    title: "Dunia Bahan Terbuang",
    subTitle: "Modul 1",
    readTime: "5 Minit",
    description: "Description for Module 1",
    subDesciption: "contoh 1",
    modulePic: "contoh 1",
  );
}

ModuleData module2Data() {
  return ModuleData(
    title: "Dunia Bahan",
    subTitle: "Modul 2",
    readTime: "10 Minit",
    description: "Description for Module 2",
    subDesciption: "contoh 2",
    modulePic: "contoh 2",
  );
}

