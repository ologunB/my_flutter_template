import 'custom_text.dart';

class BlumeButton extends StatelessWidget {
  const BlumeButton(
    this.text, {
    super.key,
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
    this.borderColor,
    this.busy = false,
    this.height = 52,
    this.icon,
    this.fontSize,
    this.borderRadius,
    this.safeArea,
  });

  final String text;
  final Function()? onPressed;
  final Color buttonColor;
  final Color textColor;
  final Color? borderColor;
  final bool busy;
  final bool? safeArea;
  final double height;
  final double? borderRadius;
  final double? fontSize;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: safeArea ?? true,
      child: SizedBox(
        height: height.h,
        child: TextButton(
            onPressed: busy ? null : onPressed,
            style: TextButton.styleFrom(
              disabledBackgroundColor: AppColors.btnInactive,
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
              ),
              side: busy ? null : BorderSide(color: borderColor ?? buttonColor),
            ),
            child: busy
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [BlumeProgress()],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) icon!,
                      BlumeText(
                        text,
                        color: textColor,
                        fontSize: fontSize ?? 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  )),
      ),
    );
  }
}
