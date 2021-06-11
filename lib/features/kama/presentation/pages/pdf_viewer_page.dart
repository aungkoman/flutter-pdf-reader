import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatefulWidget {
  static final routeName = "/pdf_viewer_page";
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  PdfViewerController _pdfViewerController;
  int _buildCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pdfViewerController = PdfViewerController();
  }
  @override
  Widget build(BuildContext context) {

    final int _initialPage = ModalRoute.of(context).settings.arguments;
    if(_buildCount == 0 ){
      _pdfViewerController.jumpToPage(_initialPage);
      _buildCount++;
    }
    return Scaffold(
        body: Container(
            child: SfPdfViewer.asset(
              "assets/pdf/pho_ma.pdf",
              controller: _pdfViewerController,
            )
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _pdfViewerController.nextPage();
        },
        child: Icon(
          Icons.keyboard_arrow_down
        ),
      ),
    );
  }
}
