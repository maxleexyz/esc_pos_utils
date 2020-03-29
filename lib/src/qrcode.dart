
import 'package:gbk_codec/gbk_codec.dart';

import 'enums.dart';

class QRSize {
  const QRSize._internal(this.value);
  final List<int> value;

  static const Zero4 = QRSize._internal([0x1d, 0x28, 0x6b, 0x03, 0x00, 0x31, 0x43, 0x04]);

  static const Zero5 = QRSize._internal([0x1d, 0x28, 0x6b, 0x03, 0x00, 0x31, 0x43, 0x05]);

  static const Zero6 = QRSize._internal([0x1d, 0x28, 0x6b, 0x03, 0x00, 0x31, 0x43, 0x06]);

  static const Zero7 = QRSize._internal([0x1d, 0x28, 0x6b, 0x03, 0x00, 0x31, 0x43, 0x07]);

  static const Zero8 = QRSize._internal([0x1d, 0x28, 0x6b, 0x03, 0x00, 0x31, 0x43, 0x08]);

}


class QRCode {
  List<int> _data = <int>[];
  List<int> get data => _data;
  List<int> _gbkText;

  QRCode(QRSize size, PosAlign align, String text){
    _data += size.value;
    _data += [0x1d, 0x28, 0x6b, 0x03, 0x00, 0x31, 0x45, 0x30];
    _gbkText = gbk_bytes.encode(text);
    // 设置数据长度
    _data += [0x1d, 0x28, 0x6b, _gbkText.length + 3, 0x00, 0x31,0x50,0x30];
    _data += _gbkText;

    // 设置二维码位置
    _data += [0x1b ,0x61 ,align.index];
    _data += [0x1d, 0x28, 0x6b, 0x03, 0x00, 0x31, 0x52, 0x30];
    _data += [0x1d, 0x28, 0x6b, 0x03, 0x00, 0x31, 0x51, 0x30];

  }

}