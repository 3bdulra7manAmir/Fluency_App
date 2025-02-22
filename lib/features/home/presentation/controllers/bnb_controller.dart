import 'package:fluency/Config/router/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
