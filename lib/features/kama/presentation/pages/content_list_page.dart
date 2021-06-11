

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kama/core/constants/AdHelper.dart';
import 'package:kama/features/kama/presentation/pages/about_page.dart';
import 'package:kama/features/kama/presentation/pages/pdf_viewer_page.dart';

class ContentListPage extends StatefulWidget {
  static final routeName = "/content_list_page";
  @override
  _ContentListPageState createState() => _ContentListPageState();
}

class _ContentListPageState extends State<ContentListPage> {

  int makePageNumber(int page){
    return page + 29;
  }

  List<PdfContentData> pdfContentDataList = <PdfContentData>[];


  // TODO: Change ad height
  int adHeight = 0;
  // TODO: Add a BannerAd instance
  BannerAd _ad;
  // TODO: Add _isAdLoaded
  bool _isAdLoaded = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    pdfContentDataList = <PdfContentData>[
      PdfContentData(title: "အသက် (၁၈) နှစ်အောက်ကလေး မကြည့်ရ", page: makePageNumber(5)),
      PdfContentData(title: "ယခုခေတ် လိင်ပညာပေး", page: makePageNumber(25)),
      PdfContentData(title: "ကမ္ဘာတည်စ ဖိုနှင့်မ", page: makePageNumber(29)),
      PdfContentData(title: "ကျားမ အစ X-Y က", page: makePageNumber(39)),
      PdfContentData(title: "အပျိုဝင်စအရွယ်", page: makePageNumber(45)),
      PdfContentData(title: "အရွယ်ရောက် လူပျိုပေါက်ကလေးများ အကြောင်း", page: makePageNumber(67)),
      PdfContentData(title: "မင်္ဂလာမဆောင်မီ သိသင့်သော အချက်များ", page: makePageNumber(77)),
      PdfContentData(title: "အမြှူဆွယ် တော်သူမလေး", page: makePageNumber(91)),
      PdfContentData(title: "လူပျိုကြီး ချစ်မိပြီဆိုရင် အသည်းစွဲ", page: makePageNumber(94)),
      PdfContentData(title: "ကြိုတင် ဘွတ်ကင်လုပ်မိသူ", page: makePageNumber(104)),
      PdfContentData(title: "သမီးအပျို စစ်စေလို", page: makePageNumber(109)),
      PdfContentData(title: "လင်နှင့်မယား ဆက်ဆံရေး", page: makePageNumber(112)),
      PdfContentData(title: "သုတ်ကောင် ဘယ်က ထွက်ပေါ်လာ", page: makePageNumber(116)),
      PdfContentData(title: "မိသားစု ကျန်းမာရေး စီမံကိန်း", page: makePageNumber(129)),
      PdfContentData(title: "သန္ဓေခြားရေး ကိစ္စ", page: makePageNumber(133)),
      PdfContentData(title: "ကိုယ်ဝန် ရှိ မရှိ ဘယ်လိုသိ", page: makePageNumber(175)),
      PdfContentData(title: "ကိုယ်ဝန်သည်တို့ သိမှတ်စရာ", page: makePageNumber(179)),
      PdfContentData(title: "သန္ဓေကိုယ်ဝန် အဆင့်ဆင့် ပြောင်းလဲလာပုံ", page: makePageNumber(185)),
      PdfContentData(title: "ကိုယ်ဝန်သည်တို့ တွေးတောမှု၊ ခံစားမှုနှင့် စိတ်ဝေဒနာ", page: makePageNumber(199)),
      PdfContentData(title: "သားမဖွားမီ မိခင် ဖခင်တို့၏ ဆက်ဆံရေးနှင့် ကူညီမှု", page: makePageNumber(207)),
      PdfContentData(title: "သားဉီးမဟုတ်သော ကိုယ်ဝန်သည်တို့ သိမှတ်စရာ", page: makePageNumber(211)),
      PdfContentData(title: "မိခင်နှင့် ကလေး အဟာရဓာတ်", page: makePageNumber(214)),
      PdfContentData(title: "ကိုယ်ဝန်သည်တို့ ကိုယ်ဝန်ရှိစဉ် တွေ့ကြုံရမည့် ဒုက္ခ", page: makePageNumber(225)),
      PdfContentData(title: "ကြိုတင်ကာကွယ်နိုင်သော အသက်ကို ရန်ရှာနိုင်သည့် ကိုယ်ဝန်နှင့် အန္တရာယ်များ", page: makePageNumber(233)),
      PdfContentData(title: "ကိုယ်ဝန်နှင့်ယှည်သော ဒုက္ခများ ကင်းဝေးရေး", page: makePageNumber(241)),
      PdfContentData(title: "ကိုယ်ဝန်သည်တို့ ရင်သားထိန်းသိမ်းရေး", page: makePageNumber(247)),
      PdfContentData(title: "မီးဖွားချိန်", page: makePageNumber(252)),
      PdfContentData(title: "သားဖွားပြီးသော မိခင်အကြောင်း", page: makePageNumber(259)),
      PdfContentData(title: "အမျိုးသားကြောင့် အမျိုးသမီးများ အဖြူဆင်း", page: makePageNumber(266)),
      PdfContentData(title: "ဖို မ ဆက်ဆံရေး အမေး နှင့် အဖြေ", page: makePageNumber(277))
    ];


    // TODO: Create a BannerAd instance
    _ad = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.largeBanner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          print('Ad loaded');
          setState(() {
            _isAdLoaded = true;
            adHeight = 100;
          });
        },
        onAdFailedToLoad: (ad, error) {
          // Releases an ad resource when it fails to load
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );

    // TODO: Load an ad
    _ad.load();

  }

  Widget _adContainer(){
    return Container(
      child: AdWidget(ad: _ad),
      width: _ad.size.width.toDouble(),
      height: adHeight.toDouble(),
      alignment: Alignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("ဖိုမ ဆက်ဆံရေး")),
      ),
      body: Column(
        children: [
          _adContainer(),
          Expanded(child: pdfContentListView()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, AboutPage.routeName);
        },
        child: Icon(
          Icons.home
        ),
      ),
    );
  }

  Widget pdfContentListView(){
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index){
            return PdfContentListTile(
              pdfContentData: pdfContentDataList[index],
              callback: (){
                Navigator.pushNamed(context, PdfViewerPage.routeName,arguments: pdfContentDataList[index].page);
                },
            );
            /*
            return ListTile(
              title: Text(pdfContentDataList[index].title),
              onTap: (){
                Navigator.pushNamed(context, PdfViewerPage.routeName,arguments: pdfContentDataList[index].page);
              },
            );

             */
          },
          separatorBuilder: (context,index) => Divider(), itemCount: pdfContentDataList.length),
    );
  }
}

class PdfContentData{
  final String title;
  final int page;
  PdfContentData({
    @required this.title,
    @required this.page
  });
}

class PdfContentListTile extends StatelessWidget {
  final PdfContentData pdfContentData;
  final VoidCallback callback;
  PdfContentListTile({
    @required this.pdfContentData,
    @required this.callback
});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print("PdfCOntentListTile onTap");
        callback();
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(40.0),

          ),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.blue.shade800,
              Colors.lightBlueAccent
            ]
          ),
            boxShadow: [
              BoxShadow(
                  color: Colors.blue,
                  blurRadius: 12,
                  offset: Offset(0,6)
              )
            ]
        ),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Image.asset("assets/images/app_icon.png")),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text(pdfContentData.title,style: TextStyle(color: Colors.yellow, fontSize: 16, fontWeight: FontWeight.bold),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}



