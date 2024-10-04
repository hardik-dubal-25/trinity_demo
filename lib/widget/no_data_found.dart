import '../imports.dart'; 

// ignore: must_be_immutable
class NoDataFoundView extends StatelessWidget {
    String message;
    NoDataFoundView({super.key,required this.message});

   
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 250,
        //height: 350.dynamicHeight(),
        padding: const EdgeInsets.all(10),
        //color: Constants.COLOR_APP_SEMI_TRANSPARENT,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              
            Text(message,style: Themes.getTextStyleBold(context).copyWith(color: colorTextBlueGrey,fontSize: fs18,fontWeight: fwt500),),
          ],
        ),
      ),
    );
  }
}
