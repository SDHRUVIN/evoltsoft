import 'package:evoltsoft/core/index.dart';
import 'package:evoltsoft/generated/l10n.dart';
import 'package:evoltsoft/presentation/dashboard/account/account_view.dart';
import 'package:evoltsoft/presentation/dashboard/dashboard_view_model.dart';
import 'package:evoltsoft/presentation/dashboard/garage/garage_view.dart';
import 'package:evoltsoft/presentation/dashboard/map/map_view.dart';
import 'package:evoltsoft/presentation/dashboard/saved/saved_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> with BaseCommonWidget {
  int _selectedIndex = 3;
  final ScrollController _homeController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await exitApplication(context) ?? false,
      child: ViewModelBuilder<DashboardViewModel>.reactive(
        viewModelBuilder: () => DashboardViewModel(),
        builder: (context, viewModel, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surface,
              body: CentralLoader(
                baseChild: _baseChild(context, viewModel),
                centralViewState: viewModel.viewState,
              ),
            ),
          );
        },
        onViewModelReady: (viewModel) => viewModel.onInit(),
      ),
    );
  }

  Widget _baseChild(BuildContext context, DashboardViewModel viewModel) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: bottomNavigationClass(context, viewModel),
      ),
      bottomNavigationBar: bottomNavigationBar(context, viewModel),
    );
  }

  Widget bottomNavigationBar(
      BuildContext context, DashboardViewModel viewModel) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Theme.of(context).colorScheme.onSecondary,
      unselectedItemColor: Theme.of(context).hintColor,
      showUnselectedLabels: true,
      iconSize: 17,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: S.of(context).map,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.file_copy),
          label: S.of(context).saved,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.car_crash),
          label: S.of(context).garage,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person_outline),
          label: S.of(context).account,
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ],
      onTap: (int index) {
        setState(
          () {
            _selectedIndex = index;
          },
        );
      },
    );
  }

  Widget bottomNavigationClass(
      BuildContext context, DashboardViewModel viewModel) {
    //
    switch (_selectedIndex) {
      case 0:
        {
          // statements;
          return const MapView();
        }
        break;

      case 1:
        {
          //statements;
          return const SavedView();
        }
        break;

      case 2:
        {
          // statements;
          return const GarageView();
        }
        break;

      case 3:
        {
          //statements;
          return const AccountView();
        }
        break;

      default:
        {
          //statements;
          return Center(
            child: S.of(context).under_development.text(context),
          );
        }
        break;
    }
  }
}
