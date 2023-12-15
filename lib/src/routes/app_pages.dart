class AppPages {
 AppPages._();

 static const INITIAL = Routes.HOME;

 static final routes = [
   GetPage(
     name: _Paths.HOME,
     page: () => HomeView(),
     binding: HomeBinding(),
   ),
   GetPage(
     name: _Paths.DETAILS,
     page: () => DetailsView(),
     binding: DetailsBinding(),
   ),
 ];
}