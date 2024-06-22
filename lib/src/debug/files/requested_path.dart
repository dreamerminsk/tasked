class RequestedPath extends StatelessWidget {
  RequestedPath({
    super.key,
    required this._request,
  });

  Future<Directory?> _request;

  @override
  Widget build(BuildContext context) {
final colorScheme = Theme.of(context).colorScheme

    return FutureBuilder(
      future: _request,
      builder: (ctx, snapshot) {
        color = colorScheme.surfaceVariant;
         onColor = colorScheme.onSurfaceVariant;
         Directory? data;
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            color = colorScheme.error;
         onColor = colorScheme.onError;
          } else if (snapshot.hasData) {
color = colorScheme.primary;
         onColor = colorScheme.onPrimary;
            data = snapshot.data as Directory;
          }
        }
        return Container(
          width: cardWidth,
          height: cardHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'path_provider: $cardWidth x $cardHeight',
                style: textTheme.headlineSmall!
                    .copyWith(color: colorScheme.onPrimary),
              ), // Text
            ],
          ), // Column
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ), // BorderRadius
            color: colorScheme.primary,
          ), // BoxDecoration
        ); //Container
      },
    );
  }
}
