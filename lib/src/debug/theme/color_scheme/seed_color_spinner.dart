class SeedColorSpinner extends StatelessWidget {

  SeedColorSpinner({super.key}) {}

  @override
  Widget build(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;
    //final colorScheme = colorSchemeN.value;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Consumer<SeedColorNotifier>(
          builder: (context, value, child) =>
            IconButton(
              icon: Icon(Icons.color_lens),
              color: value.prevColor.colorSwatch,
              onPressed: () {value.decColorIdx();},
            ),
        ), // Consumer
        Consumer<SeedColorNotifier>(
          builder: (context, value, child) =>
            IconButton(
              icon: Icon(Icons.color_lens),
              color: value.prevShade.color,
              onPressed: () {value.decShadeIdx();},
            ),
        ), // Consumer
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
          child: AnimatedDefaultTextStyle(
            child: Text('orange'),
            duration: Duration(milliseconds: 500,),
          ),
        ),
        IconButton(
          icon: Icon(Icons.color_lens),
          color: Colors.orange.shade700,
          onPressed: () {},
        ),
        Consumer<SeedColorNotifier>(
          builder: (context, value, child) =>
            IconButton(
              icon: Icon(Icons.color_lens),
              color: value.nextColor.colorSwatch,
              onPressed: () {value.incColorIdx();},
            ),
        ), // Consumer
      ],
    );
  }

}