import '../entities/category_member.dart';

class CategoryMembersResponse {

  final List<CategoryMember> query;

  const CategoryMembersResponse({
    required this.query,
  });

  factory CategoryMembersResponse.fromJson(Map<String, dynamic> json) {
    return CategoryMembersResponse(
      query: json['query'] != null
      ? _fromJson(json['query'] as Map)
      : List.empty(),
    );
  }

  static List<CategoryMember> _fromJson(Map query) {
    return query['categorymembers'] != null
    ? query['categorymembers'].map(
      (item) => CategoryMember.fromJson(item)
    ).toList()
    : List.empty();
  }
}
