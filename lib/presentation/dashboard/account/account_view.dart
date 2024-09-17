import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:evoltsoft/core/index.dart';
import 'package:evoltsoft/generated/l10n.dart';
import 'package:evoltsoft/presentation/dashboard/account/account_view_model.dart';
import 'package:evoltsoft/presentation/dashboard/account/profile/profile_view.dart';
import 'package:evoltsoft/presentation/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> with BaseCommonWidget {
  int tabBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountViewModel>.reactive(
      viewModelBuilder: () => AccountViewModel(),
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            appBar: customAppBar(
              context,
              S.of(context).my_account,
              () {
                //
              },
            ),
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

  Widget _baseChild(BuildContext context, AccountViewModel viewModel) {
    //
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight! * 0.8,
      child: ContainedTabBarView(
        initialIndex: tabBarIndex,
        tabs: [
          S.of(context).profile.text(
                context,
                textStyle: Theme.of(context).textTheme.displayMedium,
              ),
          S.of(context).charging_activity.text(
                context,
                textStyle: Theme.of(context).textTheme.displayMedium,
              ),
          S.of(context).notifications.text(
                context,
                textStyle: Theme.of(context).textTheme.displayMedium,
              ),
          S.of(context).payment.text(
                context,
                textStyle: Theme.of(context).textTheme.displayMedium,
              ),
        ],
        views: [
          const ProfileView(),
          underDev(context),
          underDev(context),
          underDev(context),
        ],
        tabBarViewProperties: const TabBarViewProperties(
          physics: NeverScrollableScrollPhysics(),
        ),
        tabBarProperties: TabBarProperties(
          indicatorColor: Theme.of(context).colorScheme.onSecondary,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          labelColor: Theme.of(context).colorScheme.onSecondary,
          unselectedLabelColor: Theme.of(context).hintColor,
          unselectedLabelStyle: TextStyle(
            color: Theme.of(context).hintColor,
          ),
        ),
      ),
    );
  }
}
