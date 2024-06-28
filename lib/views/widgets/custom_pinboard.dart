import 'custom_text.dart';

class BlumePinKeyboard extends StatefulWidget {
  final double space;
  final int length;
  final void Function(String)? onChange;
  final void Function(String)? onConfirm;
  final VoidCallback? onBiometric;
  final TextEditingController controller;

  const BlumePinKeyboard({
    super.key,
    this.space = 60,
    this.length = 4,
    this.onChange,
    this.onConfirm,
    this.onBiometric,
    required this.controller,
  });

  @override
  State<BlumePinKeyboard> createState() {
    return _BlumePinKeyboardState();
  }
}

class _BlumePinKeyboardState extends State<BlumePinKeyboard> {
  // String _pinCode = "";

  int? length;

  @override
  void initState() {
    length = widget.length + 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 50.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _createNumber("1", _handleTabNumber),
              const Spacer(),
              _createNumber("2", _handleTabNumber),
              const Spacer(),
              _createNumber("3", _handleTabNumber),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _createNumber("4", _handleTabNumber),
              const Spacer(),
              _createNumber("5", _handleTabNumber),
              const Spacer(),
              _createNumber("6", _handleTabNumber),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _createNumber("7", _handleTabNumber),
              const Spacer(),
              _createNumber("8", _handleTabNumber),
              const Spacer(),
              _createNumber("9", _handleTabNumber),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _createBiometricIcon(),
              const Spacer(),
              _createNumber("0", _handleTabNumber),
              const Spacer(),
              _createBackspaceIcon(),
            ],
          ),
        ],
      ),
    );
  }

  _createNumber(String number, void Function(String) onPress) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.space.h),
      ),
      child: Container(
        height: widget.space.h,
        width: widget.space.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.grey,
        ),
        child: Center(
          child: Text(
            number,
            style: GoogleFonts.nunito(
              fontSize: 30.sp,
              color: AppColors.grey200,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      onTap: () {
        onPress(number);
      },
    );
  }

  Widget _createImage(Widget icon, void Function() onPress) => InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.space.h),
        ),
        child: SizedBox(
          height: widget.space.h,
          width: widget.space.h,
          child: Center(child: icon),
        ),
        onTap: () {
          onPress();
        },
      );

  void _handleTabNumber(String number) {
    if (widget.controller.text.length + 1 == length) {
      return;
    }
    if (widget.onChange == null || widget.onConfirm == null) return;
    if (widget.controller.text.length < length!) {
      widget.controller.text += number;
      widget.onChange!(widget.controller.text);
      if (widget.controller.text.length == length) {
        widget.onConfirm!(widget.controller.text);
        widget.controller.text = "";
      }
    }
  }

  void _handleTabBiometric() {
    if (widget.onBiometric != null) widget.onBiometric!();
  }

  void _handleTabBackspace() {
    if (widget.controller.text.isNotEmpty) {
      widget.controller.text = widget.controller.text
          .substring(0, widget.controller.text.length - 1);
      if (widget.onChange != null) {
        widget.onChange!(widget.controller.text);
      }
    }
  }

  Widget _createBiometricIcon() {
    return _createImage(
      widget.onBiometric == null
          ? const SizedBox()
          : Container(
              height: widget.space.h,
              width: widget.space.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.grey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox() ??
                      Image.asset(
                        'assets/images/scan.png',
                        height: 26.h,
                        color: AppColors.grey200,
                      ),
                ],
              ),
            ),
      _handleTabBiometric,
    );
  }

  Widget _createBackspaceIcon() {
    return _createImage(
      Container(
        height: widget.space.h,
        width: widget.space.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.grey,
        ),
        child: Icon(
          Icons.backspace_outlined,
          size: 26.h,
          color: AppColors.grey200,
        ),
      ),
      _handleTabBackspace,
    );
  }
}
