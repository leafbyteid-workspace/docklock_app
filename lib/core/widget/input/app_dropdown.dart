import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:doclock_app/core/widget/input/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../constants/app_typography.dart';

class DropdownItem<T> {
  final T value;
  final String label;

  DropdownItem({
    required this.value,
    required this.label,
  });
}

class AppDropdownInput<T> extends FormField<T> {
  AppDropdownInput({
    super.key,
    String? label,
    String? hintText,
    required List<DropdownItem<T>> items,
    T? value,
    void Function(T?)? onChanged,
    bool enabled = true,
    bool readOnly = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    super.validator,
    bool searchable = true,
  }) : super(
          initialValue: value,
          builder: (field) {
            return _DropdownField<T>(
              label: label,
              hintText: hintText,
              items: items,
              value: field.value,
              enabled: enabled,
              readOnly: readOnly,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              searchable: searchable,
              errorText: field.errorText,
              onChanged: (value) {
                field.didChange(value);
                onChanged?.call(value);
              },
            );
          },
        );
}

class _DropdownField<T> extends StatefulWidget {
  final String? label;
  final String? hintText;

  final List<DropdownItem<T>> items;

  final T? value;

  final void Function(T?)? onChanged;

  final bool enabled;
  final bool readOnly;
  final bool searchable;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final String? errorText;

  const _DropdownField({
    this.label,
    this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.enabled = true,
    this.readOnly = false,
    this.searchable = true,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
  });

  @override
  State<_DropdownField<T>> createState() => _DropdownFieldState<T>();
}

class _DropdownFieldState<T> extends State<_DropdownField<T>> {
  late TextEditingController _searchController;

  late List<DropdownItem<T>> _filteredItems;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();

    _filteredItems = widget.items;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _bukaDropdown() {
    if (!widget.enabled || widget.readOnly) {
      return;
    }

    _searchController.clear();

    _filteredItems = widget.items;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return SafeArea(
              top: false,
              child: DraggableScrollableSheet(
                expand: false,
                builder: (
                  context,
                  scrollController,
                ) {
                  return Container(
                    decoration: BoxDecoration(
                      color: context.appTheme.surfaceVariant,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(
                          16,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            top: 12,
                            left: 16,
                            right: 16,
                            bottom: 16,
                          ),
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: context.appTheme.disabledBorder,
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        if (widget.searchable) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: AppTextField(
                                controller: _searchController,
                                type: AppTextFieldType.search,
                                hint: "Cari sesuatu...",
                                onChanged: (query) {
                                  setModalState(() {
                                    _filteredItems = widget.items.where((item) {
                                      return item.label
                                          .toLowerCase()
                                          .contains(query.toLowerCase());
                                    }).toList();
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                        Expanded(
                          child: _filteredItems.isEmpty
                              ? Center(
                                  child: Text(
                                    'Data tidak ditemukan',
                                    style: AppTypography.bodyPrimary(),
                                  ),
                                )
                              : ListView.separated(
                                  controller: scrollController,
                                  itemCount: _filteredItems.length,
                                  separatorBuilder: (_, __) =>
                                      const Divider(height: 1),
                                  itemBuilder: (
                                    context,
                                    index,
                                  ) {
                                    final item = _filteredItems[index];

                                    final isSelected =
                                        widget.value == item.value;

                                    return ListTile(
                                      key: ValueKey(item.value),
                                      dense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      title: Text(
                                        item.label,
                                        style: AppTypography.bodyPrimary(
                                          fontWeight: isSelected
                                              ? AppTypography.semiBold
                                              : AppTypography.regular,
                                        ).copyWith(
                                          color: isSelected
                                              ? context.appTheme.primary
                                              : context.appTheme.textPrimary,
                                        ),
                                      ),
                                      trailing: isSelected
                                          ? Icon(
                                              Icons.check_rounded,
                                              color: context.appTheme.primary,
                                              size: 20,
                                            )
                                          : null,
                                      onTap: () {
                                        widget.onChanged?.call(item.value);
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  String _tampilanLabel() {
    final item = widget.items
        .where(
          (e) => e.value == widget.value,
        )
        .firstOrNull;

    return item?.label ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final label = _tampilanLabel();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppTypography.subhead().copyWith(
              color: widget.enabled
                  ? context.appTheme.textPrimary
                  : context.appTheme.disabledText,
              fontWeight: AppTypography.semiBold,
            ),
          ),
          const SizedBox(height: 6),
        ],
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: _bukaDropdown,
            child: IgnorePointer(
              child: InputDecorator(
                isEmpty: label.isEmpty,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  errorText: widget.errorText,
                  filled: true,
                  fillColor: widget.enabled
                      ? (widget.readOnly
                          ? context.appTheme.surfaceVariant
                          : context.appTheme.surface)
                      : context.appTheme.disabledBackground,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon ??
                      const Icon(
                        Symbols.expand_more_rounded,
                      ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: context.appTheme.borderDefault,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: context.appTheme.borderDefault,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: context.appTheme.borderFocus,
                      width: 1.8,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: context.appTheme.disabledBorder,
                      width: 1,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: context.appTheme.danger,
                      width: 1,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: context.appTheme.danger,
                      width: 1.8,
                    ),
                  ),
                  errorStyle: AppTypography.error.copyWith(
                    color: context.appTheme.danger,
                  ),
                ),
                child: Text(
                  label.isEmpty ? '' : label,
                  style: AppTypography.bodyPrimary().copyWith(
                    color: label.isEmpty
                        ? context.appTheme.textMuted
                        : widget.enabled
                            ? context.appTheme.textPrimary
                            : context.appTheme.disabledText,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
