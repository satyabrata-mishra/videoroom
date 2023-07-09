import 'dart:math';

String generateRoomId() {
  int min = 100000, max = 999999;
  return (min + Random().nextInt(max - min)).toString();
}
