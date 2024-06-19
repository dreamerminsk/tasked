class RequestedPath extends StatelessWidget {
  RequestedPath({
    super.key,
    required this._request,
  });

  Future<Directory?> _request;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _request,
      builder: (ctx, snapshot) {
        switch(snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
      case ConnectionState.active:
        width = 0;
        break;
      case ConnectionState.done:
        width = 500;
        break;
    }
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} occurred',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.data as Directory;
            return Center(
              child: Text(
                '$data',
                style: TextStyle(fontSize: 18),
              ),
            );
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
