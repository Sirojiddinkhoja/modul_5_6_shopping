import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/config/app_colors.dart';

Future<bool> showConfirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  required String confirmText,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (dialogContext) => Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: .circular(16)),
      child: Padding(
        padding: .fromLTRB(20, 24, 20, 20),
        child: Column(
          mainAxisSize: .min,
          children: [
            Text(
              title,
              textAlign: .center,
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: AppColors.greyTitle),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(dialogContext, false),
                    style: ElevatedButton.styleFrom(
                      minimumSize: .fromHeight(44),
                      elevation: 0,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: AppColors.primary),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(dialogContext, true),
                    style: ElevatedButton.styleFrom(
                      minimumSize: .fromHeight(44)
                    ),
                    child: Text(confirmText),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    // content: Text(message, textAlign: .center),
    // actionsAlignment: .spaceBetween,
    // actions: [
    //   TextButton(
    //     onPressed: () => Navigator.pop(dialogContext, false),
    //     child: Text("Cancel"),
    //   ),
    //   ElevatedButton(
    //     onPressed: () => Navigator.pop(dialogContext, true),
    //     child: Text(confirmText),
    //   ),
    // ],
  );
  return result ?? false;
}
