import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lt_app/services/propertyServices.dart';
import 'package:lt_app/ui/others/error_screen.dart';

class TenantPropertyChoices extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final p = watch(propertyStates);
    final id = watch(propertyId).state;
    return p.when(
        data: (i) => StaggeredGridView.countBuilder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: i.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: id == i[index].propertyId
                            ? Colors.black
                            : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey[200])),
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.resolveWith(
                            (states) => EdgeInsets.zero),
                      ),
                      onPressed: () =>
                          context.read(propertyId).state = i[index].propertyId,
                      child: Text(i[index].name,
                          style: GoogleFonts.slabo27px(
                            color: id == i[index].propertyId
                                ? Colors.white
                                : Colors.black,
                          )),
                    ),
                  ),
                );
              },
              crossAxisCount: 2,
              staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
            ),
        loading: () => Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            )),
        error: (e, v) => ErrorScreen(
              error: e.toString(),
              provider: propertyStates,
            ));
  }
}
