class Root {
  String alphaTwoCode;
  List<String> domains;
  String country;
  String stateProvince;
  List<String> webPages;
  String name;

  Root(
      {this.alphaTwoCode,
      this.domains,
      this.country,
      this.stateProvince,
      this.webPages,
      this.name});

  Root.fromJson(Map<String, dynamic> json) {
    alphaTwoCode = json['alpha_two_code']== null?json['alpha_two_code']='':json['alpha_two_code'];
    domains = json['domains'].cast<String>();
    country = json['country']== null?json['country']='':json['country'];
    stateProvince = json['state-province']== null?json['state-province']='':json['state-province'];
    webPages = json['web_pages'].cast<String>();
    name = json['name']== null?json['name']='':json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alpha_two_code'] = this.alphaTwoCode;
    data['domains'] = this.domains;
    data['country'] = this.country;
    data['state-province'] = this.stateProvince;
    data['web_pages'] = this.webPages;
    data['name'] = this.name;
    return data;
  }
}
