import '../../core/vms/base_vm.dart';

class EmptyTxs extends StatelessWidget {
  const EmptyTxs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 70.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/empty-tx.png', height: 72.h),
            SizedBox(height: 8.h),
            BlumeText(
              'No Transactions',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
            SizedBox(height: 4.h),
            BlumeText(
              'You do not have any transactions',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.grey200,
            ),
          ],
        ),
      ),
    );
  }
}
