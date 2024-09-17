import 'package:evoltsoft/core/index.dart';
import 'package:evoltsoft/generated/l10n.dart';
import 'package:evoltsoft/presentation/widget/custom_btn_widget.dart';
import 'package:evoltsoft/presentation/widget/custom_icon_navigation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_view_model.dart';
import 'profile_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with BaseCommonWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: CentralLoader(
              baseChild: _baseChild(context, viewModel),
              centralViewState: viewModel.viewState,
            ),
          ),
        );
      },
      onViewModelReady: (viewModel) => viewModel.onInit(),
    );
  }

  Widget _baseChild(BuildContext context, ProfileViewModel viewModel) {
    //
    return Container(
      padding: EdgeInsets.only(
        left: SizeConfig.relativeWidth(4),
        right: SizeConfig.relativeWidth(4),
        top: SizeConfig.relativeWidth(4),
      ),
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight! * 0.8,
      child: Column(
        children: [
          ProfileWidget(
            profileUpdateRE: viewModel.profileUpdateRE,
          ),
          SizeConfig.verticalSpacer(2),
          CustomIconNavigation(
            icon: Icons.card_membership,
            label: S.of(context).membership_invoices,
            onTab: () => showToast(
              message: S.of(context).under_development,
            ),
          ),
          SizeConfig.verticalSpacer(2),
          CustomIconNavigation(
            icon: Icons.link,
            label: S.of(context).add_offer_code,
            onTab: () => showToast(
              message: S.of(context).under_development,
            ),
          ),
          SizeConfig.verticalSpacer(2),
          CustomIconNavigation(
            icon: Icons.ios_share_rounded,
            label: S.of(context).replace_card_or_key_fob,
            onTab: () => showToast(
              message: S.of(context).under_development,
            ),
          ),
          SizeConfig.verticalSpacer(2),
          CustomIconNavigation(
            icon: Icons.ac_unit,
            label: S.of(context).update_payment_details,
            onTab: () => showToast(
              message: S.of(context).under_development,
            ),
          ),
          SizeConfig.verticalSpacer(2),
          CustomBtnWidget(
            label: S.of(context).upgrade_subscription,
            onTap: () => showToast(
              message: S.of(context).under_development,
            ),
          ),
        ],
      ),
    );
  }
}
