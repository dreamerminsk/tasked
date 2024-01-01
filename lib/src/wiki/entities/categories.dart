enum Categories implements Comparable<Categories> {
  media(id: -2, title: 'Media'),
  special(id: -1, title: 'Special'),
  main(id: 0, title: 'Main\Article'),
  talk(id: 1, title: 'Talk'),
  user(id: 2, title: 'User'),
  userTalk(id: 3, title: 'User talk'),
  wikipedia(id: 4, title: 'Project'),
  wikipediaTalk(id: 5, title: 'Project talk'),
  file(id: 6, title: 'File'),
  fileTalk(id: 7, title: 'File talk'),
  mediaWiki(id: 8, title: 'MediaWiki'),
  mediaWikiTalk(id: 9, title: 'MediaaWiki talk'),
  template(id: 10, title: 'Template talk'),
  templateTalk(id: 11, title: 'Template talk');

  const Categories({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  @override
  int compareTo(Categories other) => id - other.id;
}