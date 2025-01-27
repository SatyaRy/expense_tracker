import 'package:expense_tracker/presentation/home_page/expense.dart';
import 'package:expense_tracker/presentation/profile_page/profile.dart';
import 'package:expense_tracker/provider/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/form");
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(0xff57C84D),
        child: const Icon(
          Icons.add,
          size: 25,
          color: Colors.white,
        ),
      ),
      body: SelectedPage(),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class SelectedPage extends ConsumerWidget {
  SelectedPage({super.key});
  final List<Widget> pages = [const Expense(), const ProfilePage()];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(pageIndexProvider);
    return IndexedStack(
      index: index,
      children: pages,
    );
  }
}

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(pageIndexProvider);
    return BottomNavigationBar(
      backgroundColor: Colors.white,
        currentIndex: index,
        selectedItemColor: const Color(0xff00712D),
        unselectedItemColor: const Color(0xff010b13),
        onTap: (value) =>
            ref.read(pageIndexProvider.notifier).changePage(value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "profile",
          )
        ]);
  }
}
