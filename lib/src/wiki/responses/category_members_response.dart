class CategoryMembersResponse {

  final List<CategoryMember> query = [];

  CategoryMembersResponse.fromJson(Map<String, dynamic> json) {
    query = json['query'] != null
      ? _fromJson(json['query'] as Map)
      : null;
	}

  List<CategoryMember> _fromJson(Map query) {
    return query['categorymembers'] != null
    ? query['categorymembers'].map(
      (item) => CategoryMember.fromJson(item)
    ).toList()
    : List.empty();
  }
}
