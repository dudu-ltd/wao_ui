import 'package:flutter/material.dart';

import 'package:wao_ui/src/basic/w_container_layout.dart';

class ApiContainerLayout extends StatelessWidget {
  const ApiContainerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 50,
          child: WContainerLayout(
            props: WContainerLayoutProp(
              barSize: 3.0,
              leftJudge: true,
              rightJudge: true,
              headerJudge: true,
              footerJudge: true,
            ),
            slots: WContainerLayoutSlot(
              Container(
                child: const Center(
                  child: Text("MAIN"),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                ),
              ),
              asideLeft: Container(
                child: const Center(
                  child: Text("LEFT"),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                ),
              ),
              asideRight: Container(
                child: const Center(
                  child: Text("RIGHT"),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                ),
              ),
              footer: Container(
                child: const Center(
                  child: Text("FOOTER"),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                ),
              ),
              header: Container(
                child: const Center(
                  child: Text("HEADER"),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
