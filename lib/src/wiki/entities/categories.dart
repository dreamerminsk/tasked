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
  template(id: 10, title: 'Template'),
  templateTalk(id: 11, title: 'Template talk'),
  help(id: 12, title: 'Help'),
  helpTalk(id: 13, title: 'Help talk'),
  category(id: 14, title: 'Category'),
  categoryTalk(id: 15, title: 'Category talk'),
  portal(id: 100, title: 'Portal'),
  portalTalk(id: 101, title: 'Portal talk'),
  draft(id: 118, title: 'Draft'),
  draftTalk(id: 119, title: 'Draft talk'),
  timedText(id: 710, title: 'TimedText'),
  timedTextTalk(id: 711, title: 'TimedText talk'),
  module(id: 828, title: 'Module'),
  moduleTalk(id: 829, title: 'Module talk'),
  gadget(id: 2300, title: 'Gadget'),
  gadgetTalk(id: 2301, title: 'Gadget talk'),
  gadgetDefinition(id: 2302, title: 'Gadget definition'),
  gadgetDefinitionTalk(id: 2303, title: 'Gadget definition talk');

  const Categories({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  @override
  int compareTo(Categories other) => id - other.id;
}