import 'package:flutter/material.dart';
import 'package:valorant_agents_app/ui/widgets/abilities_list.dart';

import '../../helper/assets.dart';

import '../widgets/agents_list.dart';

enum ListFilters { AGENTS, ABILITIES }

class AgentListingsScreen extends StatefulWidget {
  static const routeName = "/agent_listings_screen";

  const AgentListingsScreen();

  @override
  _AgentListingsScreenState createState() => _AgentListingsScreenState();
}

class _AgentListingsScreenState extends State<AgentListingsScreen> {
  // ignore: unused_field
  late ListFilters _currentFilter;

  @override
  void initState() {
    _currentFilter = ListFilters.AGENTS;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.listingBg), fit: BoxFit.fill),
        ),
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "VALORANT AGENTS",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FilterButton(
                      text: "AGENTS",
                      onTap: () {
                        setState(() {
                          _currentFilter = ListFilters.AGENTS;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: FilterButton(
                      text: "ABILITIES",
                      onTap: () {
                        setState(() {
                          _currentFilter = ListFilters.ABILITIES;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _currentFilter == ListFilters.AGENTS ? const AgentsList() : const AbilitiesList(),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const FilterButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      hoverElevation: 4,
      height: 40,
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
