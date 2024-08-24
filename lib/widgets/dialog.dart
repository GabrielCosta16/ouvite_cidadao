import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/infra/utils.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_link.dart';

Future showMyDialog(
    {required BuildContext context,
    required String titulo,
    required String mensagem,
    required String tituloBotao1,
    String? tituloBotao2,
    double? maxWidth,
    Function? onClick}) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyDialog(
          titulo: titulo,
          mensagem: mensagem,
          tituloBotao1: tituloBotao1,
          tituloBotao2: tituloBotao2,
          maxWidth: maxWidth,
          onClick: onClick,
        );
      });
}

class MyDialog extends StatelessWidget {
  double? maxWidth;
  String titulo;
  String mensagem;
  String tituloBotao1;
  String? tituloBotao2;
  Function? onClick;

  MyDialog(
      {required this.titulo,
      required this.tituloBotao1,
      required this.mensagem,
      this.tituloBotao2,
      this.maxWidth = 350,
      this.onClick,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: isVisualizacaoMobile()
            ? (context.mediaQuery.size.width - 80)
            : (maxWidth ?? 350),
        height: 250,
        padding: const EdgeInsets.all(6),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Positioned(
                  right: 5,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )),
              Positioned(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        titulo,
                        style: context.textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      mensagem,
                      style: context.textTheme.bodyMedium,
                    ),
                    tituloBotao2 != null
                        ? Botao(
                            titulo: tituloBotao2!,
                            onClick: () {
                              Navigator.of(context).pop();
                            })
                        : SizedBox(
                            height: 0,
                          ),
                    BotaoLink(
                        textAlign: TextAlign.center,
                        titulo: tituloBotao1,
                        onClick: () {
                          Navigator.of(context).pop();
                          onClick;
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
