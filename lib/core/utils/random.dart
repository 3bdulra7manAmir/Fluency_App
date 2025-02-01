import 'dart:math';


class ColorSwitcher
{
  static bool _toggle = false;

  static int getNextColor()
  {
    _toggle = !_toggle;
    return _toggle ? 0xfff1f2fa : 0xfff8f9ff; // Red then Blue
  }
}

var random = Random(42); // Fixed seed for reproducibility
var changer = (random.nextInt(2) == 0 ? 0xfff1f2fa : 0xfff8f9ff);

