import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NiceSearchBar extends StatefulWidget {
  final Function(String) onChanged;
  final String? hint;
  final double foldedWidth;
  final double unfoldedWidth;
  final IconData foldedIcon;
  final IconData unfoldedIcon;
  final Color? foldedIconColor;
  final Color? unfoldedIconColor;
  final bool autoExpand;
  final bool autofocus;
  final VoidCallback? additionalFunction;

  const NiceSearchBar({
    super.key,
    required this.onChanged,
    this.hint = 'Search',
    this.foldedWidth = 56,
    this.unfoldedWidth = 400,
    this.foldedIcon = Icons.search,
    this.unfoldedIcon = Icons.close,
    this.foldedIconColor,
    this.unfoldedIconColor,
    this.autoExpand = true,
    this.autofocus = false,
    this.additionalFunction,
  });

  @override
  State<NiceSearchBar> createState() => _NiceSearchBarState();
}

class _NiceSearchBarState extends State<NiceSearchBar> {
  bool _folded = true;

  @override
  void initState() {
    super.initState();

    if (widget.autoExpand) {
      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted) {
          setState(() {
            _folded = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: _folded ? widget.foldedWidth : widget.unfoldedWidth,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              blurRadius: 7.0,
              color: Theme.of(context).primaryColorLight.withOpacity(0.3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child:
                  !_folded
                      ? Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: TextField(
                          autofocus: widget.autofocus,
                          onChanged: widget.onChanged,
                          decoration: InputDecoration(
                            hintText: widget.hint,
                            hintStyle: GoogleFonts.montserrat(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      )
                      : const SizedBox.shrink(),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _folded = !_folded;
                });
                widget.additionalFunction?.call();
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  _folded ? widget.foldedIcon : widget.unfoldedIcon,
                  color:
                      _folded
                          ? widget.foldedIconColor ??
                              Theme.of(context).iconTheme.color
                          : widget.unfoldedIconColor ??
                              Theme.of(context).iconTheme.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
