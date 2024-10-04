
import '../imports.dart';

class ConnectionLostView extends StatelessWidget {
  final bool isShow;
  final VoidCallback onRetryPressed;

  const ConnectionLostView(
      {Key? key, required this.isShow, required this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isShow,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.cloud_off,color: colorAppGrey, size: 80,),
              Text("Whoops",style: Themes.getTextStyleBold(context).copyWith(color: colorAppGrey,fontSize: 24),),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35, top: 35,bottom: 35),
                child: Text("No Internet",textAlign: TextAlign.center,style: Themes.getTextStyle(context).copyWith(color: colorAppGrey),),

              ),
              OutlinedButton(
                  onPressed: onRetryPressed,
                  child: Text("Tap to retry",style: Themes.getTextStyleBold(context).copyWith(color: colorAppGrey),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


