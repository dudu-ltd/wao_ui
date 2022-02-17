import 'package:flutter/material.dart';
import 'package:wao_ui/src/others/w_image.dart';

class ApiImage extends StatelessWidget {
  const ApiImage({Key? key}) : super(key: key);

  Widget get basic {
    var fits = BoxFit.values;
    var src =
        'https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg';
    return Row(
      children: List.generate(fits.length, (index) {
        return Expanded(
          child: Column(
            children: [
              Text(fits[index].name),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: WImage(
                    props: WImageProp(src: src, fit: fits[index]),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget get slotPlaceholder {
    var src =
        'https://cube.elemecdn.com/6/94/4d3ea53c084bad6931a56d5158a48jpeg.jpeg';
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const Text('默认'),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: WImage(
                    props: WImageProp(src: src),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const Text('自定义'),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: WImage(
                    props: WImageProp(src: src),
                    slots: WImageSlot(null, placeholder: const Text('加载中...')),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget get slotError {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [const Text('默认'), WImage()],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Text('自定义'),
              WImage(
                slots: WImageSlot(null,
                    error: const Icon(Icons.picture_in_picture_outlined)),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget get lazy {
    var urls = [
      'https://fuss10.elemecdn.com/a/3f/3302e58f9a181d2509f3dc0fa68b0jpeg.jpeg',
      'https://fuss10.elemecdn.com/1/34/19aa98b1fcb2781c4fba33d850549jpeg.jpeg',
      'https://fuss10.elemecdn.com/0/6f/e35ff375812e6b0020b6b4e8f9583jpeg.jpeg',
      'https://fuss10.elemecdn.com/9/bb/e27858e973f5d7d3904835f46abbdjpeg.jpeg',
      'https://fuss10.elemecdn.com/d/e6/c4d93a3805b3ce3f323f7974e6f78jpeg.jpeg',
      'https://fuss10.elemecdn.com/3/28/bbf893f792f03a54408b3b7a7ebf0jpeg.jpeg',
      'https://fuss10.elemecdn.com/2/11/6535bcfb26e4c79b48ddde44f4b6fjpeg.jpeg'
    ];

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 600),
      child: ListView(
        children: List.generate(urls.length, (index) {
          return WImage(
            props: WImageProp(
              src: urls[index],
              lazy: true,
            ),
          );
        }),
      ),
    );
  }

  Widget get previewSrcList {
    var url =
        'https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg';
    var srcList = [
      'https://fuss10.elemecdn.com/8/27/f01c15bb73e1ef3793e64e6b7bbccjpeg.jpeg',
      'https://fuss10.elemecdn.com/1/8e/aeffeb4de74e2fde4bd74fc7b4486jpeg.jpeg'
    ];
    return WImage(
      props: WImageProp(src: url, previewSrcList: srcList),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const Text('WImage'),
      ____________________________________,
      const Text('基本用法'),
      ____________________________________,
      basic,
      const Text('占位内容'),
      ____________________________________,
      slotPlaceholder,
      const Text('加载失败'),
      ____________________________________,
      slotError,
      ____________________________________,
      const Text('懒加载'),
      ____________________________________,
      lazy,
      ____________________________________,
      const Text('大图预览'),
      ____________________________________,
      previewSrcList,
    ]);
  }

  final Widget ____________________________________ = const SizedBox(
    height: 10,
    width: 1,
  );
}
