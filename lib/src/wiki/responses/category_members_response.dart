class CategoryMembersResponse {

  final List<CategoryMember> query = [];

  CategoryMembersResponse.fromJson(Map<String, dynamic> json) {
		//continue = json['continue'] != null ? new Continue.fromJson(json['continue']) : null;
		query = json['query'] != null ? new Query.fromJson(json['query']) : null;
	}
}

class Continue {
	String? cmcontinue;
	String? continue;

	Continue({this.cmcontinue, this.continue});

	Continue.fromJson(Map<String, dynamic> json) {
		cmcontinue = json['cmcontinue'];
		continue = json['continue'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['cmcontinue'] = this.cmcontinue;
		data['continue'] = this.continue;
		return data;
	}
}

class Query {
	List<Categorymembers>? categorymembers;

	Query({this.categorymembers});

	Query.fromJson(Map<String, dynamic> json) {
		if (json['categorymembers'] != null) {
			categorymembers = <Categorymembers>[];
			json['categorymembers'].forEach((v) { categorymembers!.add(new Categorymembers.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.categorymembers != null) {
      data['categorymembers'] = this.categorymembers!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Categorymembers {
	int? pageid;
	int? ns;
	String? title;

	Categorymembers({this.pageid, this.ns, this.title});

	Categorymembers.fromJson(Map<String, dynamic> json) {
		pageid = json['pageid'];
		ns = json['ns'];
		title = json['title'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['pageid'] = this.pageid;
		data['ns'] = this.ns;
		data['title'] = this.title;
		return data;
	}
}
