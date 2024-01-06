class HealthWidget extends StatelessWidget {
  const HealthWidget({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 200,
      child: Column(
        crossAxisAlignment:
          CrossAxisAlignment.center,
        mainAxisAlignment:
          MainAxisAlignment.center,
        children: <Widget>[
          Obx(() => Text(
            c.started.value?.toString() ?? 'NOT IMPLEMENTED',
              style: textTheme.displaySmall!
                .copyWith(
                  color: colorScheme.onSecondaryContainer
                ),
          )), // Text
        ],
      ), // Column
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ), // BorderRadius
        color: colorScheme.secondaryContainer,
      ), // BoxDecoration
    ); //Container
  };
}
