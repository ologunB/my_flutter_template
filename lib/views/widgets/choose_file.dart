import 'custom_text.dart';

class ChooseFile extends StatefulWidget {
  const ChooseFile(this.title, {super.key, this.onChanged, this.name});

  final String title;
  final String? name;
  final Function(File?)? onChanged;

  @override
  State<ChooseFile> createState() => _ChooseFileState();
}

class _ChooseFileState extends State<ChooseFile> {
  File? file;
  @override
  Widget build(BuildContext context) {
    String mime = widget.name?.split('.').last.toLowerCase() ?? 'pdf';
    return InkWell(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();

        if (result != null) {
          file = File(result.files.single.path!);
          widget.onChanged!(file);
        } else {
          // User canceled the picker
        }
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          children: [
            Row(
              children: [
                BlumeText(
                  widget.title,
                  fontSize: 12.sp,
                  color: AppColors.textInactive,
                ),
              ],
            ),
            SizedBox(height: 4.h),
            file == null
                ? BlumeText(
                    '+  Choose File',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textInactive,
                  )
                : Row(
                    children: [
                      Image.asset(
                        mime == 'pdf'
                            ? 'assets/images/pdf.png'
                            : 'assets/images/png.png',
                        height: 15.h,
                      ),
                      SizedBox(width: 10.h),
                      Expanded(
                        child: BlumeText(
                          '${widget.title}.$mime'
                              .replaceAll('Upload', '')
                              .trim(),
                          fontSize: 14.sp,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(width: 10.h),
                      InkWell(
                        onTap: () {
                          file = null;
                          setState(() {});
                        },
                        child: Icon(
                          Icons.close_rounded,
                          size: 20.h,
                          color: AppColors.primary,
                        ),
                      )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
