import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SuccessToast {
  static void show(
    BuildContext context,
    String? title,
    String? description,
  ) {
    ShadToaster.of(context).show(
      ShadToast(
        title: Text(title ?? "Success"),
        description: Text(description ?? "Operation completed successfully"),
        action: ShadButton.outline(
          child: const HugeIcon(
            icon: HugeIcons.strokeRoundedCancel01,
            color: Colors.black,
            size: 24.0,
          ),
          onPressed: () => ShadToaster.of(context).hide(),
        ),
      ),
    );
  }
}
