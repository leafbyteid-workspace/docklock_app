import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../constants/app_color.dart';
import '../../constants/app_typography.dart';

enum AppTextFieldType {
  text,
  email,
  password,
  phone,
  number,
  decimal,
  url,
  search,
  multiline,
  file,
}

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;

  final AppTextFieldType type;

  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;

  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final bool required;

  final int? maxLength;
  final int maxLines;
  final int? minLines;

  final Widget? prefix;
  final Widget? suffix;

  final VoidCallback? onTap;

  final TextInputAction? textInputAction;
  final PlatformFile? file;
  final ValueChanged<PlatformFile?>? onFileChanged;

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    super.key,
    this.controller,
    this.type = AppTextFieldType.text,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.required = false,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.file,
    this.onFileChanged,
    this.prefix,
    this.suffix,
    this.onTap,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.inputFormatters,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscure = true;

  bool get isPassword => widget.type == AppTextFieldType.password;

  bool get isFile => widget.type == AppTextFieldType.file;

  Future<void> _pilihBerkas() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.any,
    );

    if (result != null) {
      widget.onFileChanged?.call(result.files.first);
    }
  }

  TextInputType get keyboardType {
    switch (widget.type) {
      case AppTextFieldType.email:
        return TextInputType.emailAddress;

      case AppTextFieldType.phone:
        return TextInputType.phone;

      case AppTextFieldType.number:
        return TextInputType.number;

      case AppTextFieldType.decimal:
        return const TextInputType.numberWithOptions(decimal: true);

      case AppTextFieldType.url:
        return TextInputType.url;

      case AppTextFieldType.multiline:
        return TextInputType.multiline;

      default:
        return TextInputType.text;
    }
  }

  Widget? get defaultPrefix {
    switch (widget.type) {
      case AppTextFieldType.email:
        return const Icon(Symbols.email_rounded);

      case AppTextFieldType.password:
        return const Icon(Symbols.lock_rounded);

      case AppTextFieldType.phone:
        return const Icon(Symbols.phone_rounded);

      case AppTextFieldType.search:
        return const Icon(Symbols.search_rounded);

      case AppTextFieldType.url:
        return const Icon(Symbols.link_rounded);

      case AppTextFieldType.file:
        return const Icon(Symbols.attach_file_rounded);

      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isFile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null) ...[
            RichText(
              text: TextSpan(
                text: widget.label!,
                style: AppTypography.subhead().copyWith(
                  color: widget.enabled
                      ? AppColor.textPrimary
                      : AppColor.disabledText,
                  fontWeight: AppTypography.semiBold,
                ),
                children: [
                  if (widget.required)
                    const TextSpan(
                      text: " *",
                      style: TextStyle(
                        color: AppColor.danger,
                        fontWeight: AppTypography.bold,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 6),
          ],
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: widget.enabled ? _pilihBerkas : null,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                color: widget.enabled
                    ? AppColor.surface
                    : AppColor.disabledBackground,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColor.borderDefault,
                ),
              ),
              child: Row(
                children: [
                  const Icon(Symbols.attach_file_rounded),
                  const SizedBox(width: 8),
                  Expanded(
                    child: widget.file == null
                        ? Text(
                            widget.hint ?? "Pilih file",
                            style: AppTypography.bodyPrimary().copyWith(
                              color: AppColor.textMuted,
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.file!.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTypography.bodyPrimary(),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "${(widget.file!.size / 1024).toStringAsFixed(1)} KB",
                                style: AppTypography.helper.copyWith(
                                  color: AppColor.textSecondary,
                                ),
                              ),
                            ],
                          ),
                  ),
                  if (widget.file == null)
                    const Icon(Symbols.upload_file_rounded)
                  else
                    IconButton(
                      splashRadius: 20,
                      icon: const Icon(
                        Symbols.close_rounded,
                        color: AppColor.danger,
                      ),
                      onPressed: () {
                        widget.onFileChanged?.call(null);
                      },
                    ),
                ],
              ),
            ),
          ),
          if (widget.helperText != null) ...[
            const SizedBox(height: 4),
            Text(
              widget.helperText!,
              style: AppTypography.helper.copyWith(
                color: AppColor.textSecondary,
              ),
            ),
          ],
          if (widget.errorText != null) ...[
            const SizedBox(height: 4),
            Text(
              widget.errorText!,
              style: AppTypography.error.copyWith(
                color: AppColor.danger,
              ),
            ),
          ],
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          RichText(
            text: TextSpan(
              text: widget.label!,
              style: AppTypography.subhead().copyWith(
                color: widget.enabled
                    ? AppColor.textPrimary
                    : AppColor.disabledText,
                fontWeight: AppTypography.semiBold,
              ),
              children: [
                if (widget.required)
                  const TextSpan(
                    text: " *",
                    style: TextStyle(
                      color: AppColor.danger,
                      fontWeight: AppTypography.bold,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 6),
        ],
        Theme(
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(
              color: widget.enabled
                  ? AppColor.iconSecondary
                  : AppColor.disabledIcon,
              size: 20,
            ),
          ),
          child: TextFormField(
            controller: widget.controller,
            keyboardType: keyboardType,
            autofocus: widget.autofocus,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            obscureText: isPassword ? obscure : false,
            maxLength: widget.maxLength,
            maxLines:
                widget.type == AppTextFieldType.multiline ? widget.maxLines : 1,
            minLines: widget.minLines,
            validator: widget.validator,
            inputFormatters: widget.inputFormatters,
            onTap: widget.onTap,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onSubmitted,
            textInputAction: widget.textInputAction,
            style: AppTypography.bodyPrimary().copyWith(
              color:
                  widget.enabled ? AppColor.textPrimary : AppColor.disabledText,
            ),
            cursorColor: AppColor.primary,
            cursorWidth: 1.8,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: AppTypography.bodyPrimary().copyWith(
                color: AppColor.textMuted,
              ),
              helperText: widget.helperText,
              helperStyle: AppTypography.helper.copyWith(
                color: AppColor.textSecondary,
              ),
              errorText: widget.errorText,
              errorStyle: AppTypography.error.copyWith(
                color: AppColor.danger,
              ),
              errorMaxLines: 2,
              filled: true,
              fillColor: widget.enabled
                  ? (widget.readOnly
                      ? AppColor.surfaceVariant
                      : AppColor.surface)
                  : AppColor.disabledBackground,
              prefixIcon: widget.prefix ?? defaultPrefix,
              suffixIcon: isPassword
                  ? IconButton(
                      splashRadius: 20,
                      onPressed: widget.enabled
                          ? () {
                              setState(() {
                                obscure = !obscure;
                              });
                            }
                          : null,
                      icon: Icon(
                        obscure
                            ? Symbols.visibility_off_rounded
                            : Symbols.visibility_rounded,
                        color: AppColor.iconSecondary,
                        size: 20,
                      ),
                    )
                  : widget.suffix,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColor.borderDefault,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColor.borderDefault,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColor.borderFocus,
                  width: 1.8,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColor.disabledBorder,
                  width: 1.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColor.danger,
                  width: 1.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColor.danger,
                  width: 1.8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
