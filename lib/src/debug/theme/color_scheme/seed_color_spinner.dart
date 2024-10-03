class SeedColorSpinner extends StatelessWidget {

  SeedColorSpinner({super.key}) {}

  @override
  Widget build(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;
    //final colorScheme = colorSchemeN.value;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.color_lens),
          color: Colors.yellow,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.color_lens),
          color: Colors.orange.shade300,
          onPressed: () {},
        ),
        AnimatedContainer(
          duration: const Duration(
            seconds: 1,
          ),
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text('orange'),
        ),
        IconButton(
          icon: Icon(Icons.color_lens),
          color: Colors.orange.shade700,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.color_lens),
          color: Colors.brown,
          onPressed: () {},
        ),
      ],
    );
  }

}