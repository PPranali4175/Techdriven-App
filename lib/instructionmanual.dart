import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PDFScreen extends StatefulWidget {
  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  List<String> pdfPaths = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPDFs();
  }

  Future<void> _loadPDFs() async {
    final pdfAssets = [
      'assets/Images/15559-sample1.pdf',
      'assets/Images/IPC.pdf',
      'assets/Images/11 Rights of Prisoners-compressed (2).pdf'

    ];

    for (String assetPath in pdfAssets) {
      final path = await _loadPDF(assetPath);
      if (path != null) {
        pdfPaths.add(path);
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<String?> _loadPDF(String assetPath) async {
    try {
      final data = await rootBundle.load(assetPath);
      final bytes = data.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/${assetPath.split('/').last}');
      await tempFile.writeAsBytes(bytes);

      return tempFile.path;
    } catch (e) {
      print("Error loading PDF: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Screen'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: pdfPaths.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('PDF ${index + 1}'),
            trailing: Icon(Icons.picture_as_pdf),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PDFViewer(pdfPath: pdfPaths[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PDFViewer extends StatelessWidget {
  final String pdfPath;

  PDFViewer({required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: PDFView(
        filePath: pdfPath,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: true,
        pageSnap: true,
        onPageChanged: (int? page, int? total) {
          print('Page $page of $total');
        },
      ),
    );
  }
}
