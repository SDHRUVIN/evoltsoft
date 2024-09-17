import 'package:evoltsoft/core/index.dart';
import 'package:evoltsoft/domain/index.dart';
import 'package:evoltsoft/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  ProfileUpdateRE? profileUpdateRE;

  ProfileWidget({
    super.key,
    this.profileUpdateRE,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.relativeHeight(2)),
      // height: SizeConfig.relativeHeight(20),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .secondary, // Set the background color to black
        borderRadius: BorderRadius.circular(20), // Set the radius
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                foregroundImage: NetworkImage(
                    "https://imgs.search.brave.com/s4CC8oBjuIPVospzk8SUACobvEdC-lTW92rNGReh2aQ/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA1Lzg5LzkzLzI3/LzM2MF9GXzU4OTkz/Mjc4Ml92UUFFQVpo/SG5xMVFDR3U1aWt3/cllhUUQwTW11cm0w/Ti5qcGc"),
              ),
              SizeConfig.horizontalSpacer(3),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (null != profileUpdateRE && null != profileUpdateRE!.name
                          ? profileUpdateRE!.name
                          : "User Name")!
                      .text(
                    context,
                    textStyle: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizeConfig.verticalSpacer(1),
                  (null != profileUpdateRE && null != profileUpdateRE!.mail
                          ? profileUpdateRE!.mail
                          : "mail@mail.com")!
                      .text(
                    context,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                  color: Theme.of(context).hintColor,
                  onPressed: () {
                    //
                  },
                  icon: const Icon(Icons.mode_edit_outlined))
            ],
          ),
          SizeConfig.verticalSpacer(1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              userDetails(context, S.of(context).date_of_birth, "13.05.1997"),
              userDetails(context, S.of(context).location, "INDIA"),
              userDetails(context, S.of(context).number_of_cars, "3"),
            ],
          ),
        ],
      ),
    );
  }

  Widget userDetails(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label.text(
          context,
          textStyle: Theme.of(context).textTheme.bodyMedium,
        ),
        value.text(
          context,
          textStyle: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
