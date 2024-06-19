class RequestedPaths extends StatelessWidget {
  RequestedPaths({
    super.key,
    required this._request,
  });

  Future<List<Directory>?> _request;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _request,
      builder: (ctx, snapshot) {
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
