import 'package:flutter/material.dart';

class SearchResultsHeader extends StatelessWidget {
  const SearchResultsHeader({
    super.key,
    required this.hasResults,
    required this.searchKey,
  });

  final bool hasResults;
  final String searchKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          hasResults ? const Text('Search') : const Text(''),
          hasResults ? Text(searchKey) : const Text(''),
        ],
      ),
    );
  }
}
