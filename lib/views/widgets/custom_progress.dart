import '../../core/vms/base_vm.dart';

class BlumeProgress extends StatelessWidget {
  const BlumeProgress({this.size = 20, super.key});
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.h,
      width: size.h,
      child: CircularProgressIndicator(
        strokeWidth: 3.h,
        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
      ),
    );
  }
}
