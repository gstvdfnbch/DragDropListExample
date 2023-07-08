import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InformationProdutoEdit extends StatelessWidget {
  final String textoFirst;
  final String textoSecond;
  final String preco;
  final List<int> indPageAndProd;

  const InformationProdutoEdit(
      {Key? key,
      required this.textoFirst,
      required this.textoSecond,
      required this.preco,
      required this.indPageAndProd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        left: 16.0,
        right: 16.0,
        bottom: 12.0,
      ),
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
                Text(textoFirst,
                    //style: miniBoldTitleStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(width: 8),
                Text(textoSecond,
                    //style: miniTitleStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          Text(
            "R\$ $preco",
            //style: miniTitleStyle,
          ),
          const SizedBox(width: 16.0),
          GestureDetector(
            onTap: () {
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
    );
  }
}
