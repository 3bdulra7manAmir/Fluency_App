import 'package:flutter_riverpod/flutter_riverpod.dart';

class BnbController extends StateNotifier<int>
{
  BnbController() : super(2); // Default selected index

  void setIndex(int index)
  {
    state = index;
  }
}

final bnbProvider = StateNotifierProvider<BnbController, int>((ref)
{
  return BnbController();
});
