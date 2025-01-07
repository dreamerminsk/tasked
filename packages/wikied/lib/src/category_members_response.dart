import 'category_member.dart';

class CategoryMembersResponse {
  final List<CategoryMember> query;

  const CategoryMembersResponse({
    required this.query,
  });

  factory CategoryMembersResponse.fromJson(Map<String, dynamic> json) {
    return CategoryMembersResponse(
      query: json['query'] != null
          ? _fromJson(json['query'] as Map)
          : List<CategoryMember>.empty(),
    );
  }

  static List<CategoryMember> _fromJson(Map query) {
    return query['categorymembers'] != null
        ? query['categorymembers']
            .map<CategoryMember>((item) => CategoryMember.fromJson(item))
            .toList()
        : List<CategoryMember>.empty();
  }
}