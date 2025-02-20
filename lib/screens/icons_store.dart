import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/providers/icons_store_provider.dart';
import 'package:piehme_cup_flutter/services/icons_service.dart';
import 'package:piehme_cup_flutter/utils/action_utils.dart';
import 'package:piehme_cup_flutter/widgets/header.dart';
import 'package:piehme_cup_flutter/widgets/store_listitem.dart';
import 'package:provider/provider.dart';

class IconsStorePage extends StatefulWidget {
  const IconsStorePage({super.key});

  @override
  State<IconsStorePage> createState() => _IconsStorePageState();
}

class _IconsStorePageState extends State<IconsStorePage> {

  @override
  void initState() {
    super.initState();
    context.read<IconsStoreProvider>().loadStore();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<IconsStoreProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage('assets/other_background.png'),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              SafeArea(child: Header()),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.54,
                  ),
                  padding: const EdgeInsets.all(15),
                  itemCount: provider.items.length,
                  itemBuilder: (context, index) {
                    final item = provider.items[index];
                    return StoreListItem(
                      imageUrl: item.imageUrl,
                      imageKey: item.imageKey,
                      price: item.price,
                      owned: item.owned,
                      selected: item.selected,
                      buy: () => ActionUtils(
                        context: context,
                        action: () => IconsService.buyIcon(item.id),
                        callback: () {
                          context.read<IconsStoreProvider>().loadStore();
                        }).confirmAction(),
                      sell: () => ActionUtils(
                          context: context,
                          action: () => IconsService.sellIcon(item.id),
                          callback: () {
                            provider.loadStore();
                          }).confirmAction(),
                      select: () => ActionUtils(
                          context: context,
                          action: () => IconsService.selectIcon(item.id),
                          callback: () {
                            context.read<IconsStoreProvider>().loadStore();
                          }).confirmAction(),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}