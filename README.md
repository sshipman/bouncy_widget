bouncy_widget is a simple animated bouncing widget.  It encapsulates the animation configurations
necessary to create a widget that rises, then falls, bounces, and then optionally waits, before
starting all over.

<img src="https://raw.githubusercontent.com/sshipman/bouncy_widget/master/example/bouncy_widget.gif">

## Features

* Configure the ratio of up/down/pause phases
* Configure how high the widget bounces
* That's it.  If you want more, you're better off building the animations yourself.

## Usage

```dart
Bouncy(
    duration: Duration(milliseconds: 2000),
    width: 24,
    height: 24,
    lift: 50,
    ratio: 0.5,
    pause: 0.5,
    child: const Icon(Icons.new_releases_outlined));
```
