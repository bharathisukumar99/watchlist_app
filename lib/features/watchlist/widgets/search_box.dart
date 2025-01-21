// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_app/features/watchlist/bloc/watchlist_bloc.dart';

class SearchBox extends StatelessWidget {
  final bool readOnly;
  final Function()? onTap;
  const SearchBox({
    super.key,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xff121212),
          ),
          child: ListTile(
            onTap: onTap,
            title: TextFormField(
              onTap: onTap,
              onChanged: (value) {
                context.read<WatchlistBloc>().add(OnSearchSymbol(value: value));
              },
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              style: TextStyle(
                  decoration: TextDecoration.none, decorationThickness: 0),
              readOnly: readOnly,
              decoration: InputDecoration(
                hintStyle:
                    TextStyle(color: Theme.of(context).hintColor, fontSize: 14),
                border: InputBorder.none,
                hintText: "Search & Add",
              ),
            ),
            leading: Icon(Icons.search),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                VerticalDivider(
                  indent: 20,
                  endIndent: 20,
                  width: 1,
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: readOnly ? null : () {},
                  icon: Icon(
                    Icons.apps_rounded,
                    color: Color(0xff38B990),
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: readOnly ? null : () {},
                  icon: RotatedBox(
                    quarterTurns: 1,
                    child: Icon(
                      Icons.tune,
                      color: Color(0xff38B990),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
