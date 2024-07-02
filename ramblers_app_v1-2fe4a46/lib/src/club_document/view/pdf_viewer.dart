import 'package:advance_pdf_viewer2/advance_pdf_viewer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/widgets/custom_app_bar.dart';

class NetworkPdfViewer extends StatefulWidget {
  final String pdfUrl;
  final String title;
  const NetworkPdfViewer(
      {super.key, required this.pdfUrl, required this.title});

  @override
  // ignore: library_private_types_in_public_api
  _NetworkPdfViewerState createState() => _NetworkPdfViewerState();
}

class _NetworkPdfViewerState extends State<NetworkPdfViewer> {
  bool _isLoading = true;
  PDFDocument? _document;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  _loadPdf() async {
    setState(() {
      _isLoading = true;
    });
    try {
      PDFDocument document = await PDFDocument.fromURL(widget.pdfUrl);
      setState(() {
        _document = document;
        _isLoading = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print("Error loading PDF: $e");
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: CustomAppBar(
        buildContext: context,
        pageTitle: widget.title,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _document != null
              ? PDFViewer(
                  document: _document!,
                )
              : const Center(child: Text('Failed to load PDF')),
    );
  }
}
