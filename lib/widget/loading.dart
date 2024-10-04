import '../imports.dart';

class Loading extends StatelessWidget {
  final bool isShow;

  const Loading({super.key, this.isShow = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 45,
        height: 45,
        padding: const EdgeInsets.all(10),
        //color: Constants.COLOR_APP_SEMI_TRANSPARENT,
        child: Center(
          child: CircularProgressIndicator(
            color: Themes.getTheme(context).primaryColor,
            strokeWidth: 3.5,
            strokeCap: StrokeCap.butt,
          ),
        ),
      ),
    );
  }
}
