import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lt_app/configs/apiConfig.dart';
import 'package:lt_app/services/tenantServices.dart';
import 'package:lt_app/ui/others/error_screen.dart';
import 'package:lt_app/ui/pages/tenant/tenant_profile.dart';

class TenantList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final t = watch(tenantStates);
    return t.when(
        data: (i) => RefreshIndicator(
              onRefresh: () => context.refresh(tenantStates),
              child: StaggeredGridView.countBuilder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: i.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(color: Colors.grey[300], blurRadius: 2)
                          ],
                          color: Colors.white),
                      child: TextButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => TenantProfile(i[index]))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    '$Url/media/${i[index].tenant__image}'),
                              ),
                            ),
                            ListTile(
                              title: Center(
                                child: Text(i[index].tenant__fullName,
                                    style: GoogleFonts.slabo27px(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(i[index].paymentDate,
                                      style: GoogleFonts.slabo27px(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(i[index].paymentStatus,
                                      style: GoogleFonts.slabo27px(
                                          color: Colors.green,
                                          fontSize: 11,
                                          fontWeight: FontWeight.normal)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                crossAxisCount: 2,
              ),
            ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, v) =>
            ErrorScreen(provider: tenantStates, error: e.toString()));
  }
}
