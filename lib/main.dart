import 'package:flutter/material.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:list_drag_drop/model.dart';
import 'data.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DragAndDropScreen(),
    );
  }
}

class DragAndDropScreen extends StatefulWidget {
  @override
  _DragAndDropScreenState createState() => _DragAndDropScreenState();
}

class _DragAndDropScreenState extends State<DragAndDropScreen> {
  late List<DragAndDropList> lists;

  @override
  void initState() {
    super.initState();

    lists = paginasList.map(buildList).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reorderable List'),
        ),
        body: DragAndDropLists(
          children: lists,
          listPadding: EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
          itemDivider: Divider(
            thickness: 1.0,
            height: 1,
            color: Colors.black,
          ),
          listInnerDecoration: BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          itemDecorationWhileDragging: BoxDecoration(
              color: Colors.greenAccent,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 4)
              ]),
          onItemReorder: onReorderListItem,
          onListReorder: onReorderList,
        ));
  }

  DragAndDropList buildList(Pagina list) => DragAndDropList(
      header: Container(
        child: Text("PAGINA", style: TextStyle(color: Colors.red)),
      ),
      children: list.produtosList
          .map((item) => DragAndDropItem(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.arrow_up_arrow_down,
                        size: 22,
                        //color: currentTheme.primaryColor.withAlpha(170),
                      ),
                      const SizedBox(width: 16.0),
                      Container(width: 40, height: 40, color: Colors.black),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.texto1,
                                //style: miniBoldTitleStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                            const SizedBox(width: 8),
                            Text(item.texto2,
                                //style: miniTitleStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                      Text(
                        "R\$ ${item.preco}",
                        //style: miniTitleStyle,
                      ),
                      const SizedBox(width: 16.0),
                      GestureDetector(
                        onTap: () {
                          print("DELETED");
                          //providerMeusEncartes.removeProduto(indPageAndProd);
                        },
                        child: Icon(
                          CupertinoIcons.delete,
                          size: 22,
                          //color: colorRedForAllTheme,
                        ),
                      )
                    ],
                  ),
                ),
              ))
          .toList());

  void onReorderListItem(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    setState(() {
      final oldListItems = lists[oldListIndex].children;
      final newListItems = lists[newListIndex].children;

      final movedItem = oldListItems.removeAt(oldItemIndex);
      newListItems.insert(newItemIndex, movedItem);
    });
  }

  void onReorderList(
    int oldListIndex,
    int newListIndex,
  ) {}
}
