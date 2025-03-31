import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NiceSearchBar extends StatefulWidget {
  final Function(String) onChanged;
  final String hint;
  final dynamic additionalFunction;

  const NiceSearchBar({
    super.key,
    required this.onChanged,
    required this.hint,
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
    Timer(const Duration(milliseconds: 800), () {
      setState(() {
        _folded = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: _folded ? 56 : 400,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 7.0,
              color: Theme.of(context).primaryColorLight,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 16),
                child:
                    !_folded
                        ? TextField(
                          autofocus: true,
                          onChanged: widget.onChanged,
                          decoration: InputDecoration(
                            hintText: widget.hint,
                            hintStyle: GoogleFonts.montserrat(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            border: InputBorder.none,
                          ),
                        )
                        : null,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_folded ? 32 : 0),
                    topRight: const Radius.circular(32),
                    bottomLeft: Radius.circular(_folded ? 32 : 0),
                    bottomRight: const Radius.circular(32),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      _folded ? Icons.search : Icons.close,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _folded = !_folded;
                    });
                    widget.additionalFunction();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
