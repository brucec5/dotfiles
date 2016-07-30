slate.configAll({
  defaultToCurrentScreen: true,
  nudgePercentOf: 'screenSize',
  resizePercentOf: 'windowSize',
  windowHintsIgnoreHiddenWindows: false,
  windowHintsSpread: true,
  windowHintsShowIcons: true,
  windowHintsDuration: 10,
  windowHintsFontColor: [235, 235, 235, 1.0]
});

slate.bindAll({
  // Shrink Bindings
  "right:cmd;ctrl":       resizeBy(-50, 0, 'bottom-right'),
  "left:cmd;ctrl":        resizeBy(-50, 0, 'bottom-left'),
  "up:cmd;ctrl":          resizeBy(0, -50, 'top-left'),
  "down:cmd;ctrl":        resizeBy(0, -50, 'bottom-right'),
  "right:shift;cmd;ctrl": resizeBy(-25, 0, 'bottom-right'),
  "left:shift;cmd;ctrl":  resizeBy(-25, 0, 'bottom-left'),
  "up:shift;cmd;ctrl":    resizeBy(0, -25, 'top-left'),
  "down:shift;cmd;ctrl":  resizeBy(0, -25, 'bottom-right'),

  // Grow Bindings
  "right:alt;cmd;ctrl":       resizeBy(100, 0, 'bottom-left'),
  "left:alt;cmd;ctrl":        resizeBy(100, 0, 'top-right'),
  "up:alt;cmd;ctrl":          resizeBy(0, 100, 'bottom-left'),
  "down:alt;cmd;ctrl":        resizeBy(0, 100, 'top-right'),
  "right:shift;alt;cmd;ctrl": resizeBy(50, 0,  'bottom-left'),
  "left:shift;alt;cmd;ctrl":  resizeBy(50, 0,  'top-right'),
  "up:shift;alt;cmd;ctrl":    resizeBy(0, 50,  'bottom-left'),
  "down:shift;alt;cmd;ctrl":  resizeBy(0, 50,  'top-right'),

  // Max/half/whatever bindings
  "right:ctrl;alt": push('right'),
  "left:ctrl;alt":  push('left'),
  "up:ctrl;alt":    move('screenOriginX', 'screenOriginY', 'screenSizeX', 'screenSizeY'),

  // Window hints
  "esc:cmd": hint('ASDFJKLGHWERTYUIOXCVBNMZQP'),

  "esc:cmd;ctrl;alt;shift": slate.operation('relaunch'),

  "f7:cmd":       shell("/usr/local/bin/mpc prev"),
  "f8:cmd":       shell("/usr/local/bin/mpc toggle"),
  "f9:cmd":       shell("/usr/local/bin/mpc next"),
  "f8:cmd;shift": shell("/Users/chris.bruce/bin/mpdnotify.sh"),

  "/:cmd;ctrl": focusApp('Slack'),
  "s:cmd;ctrl": focusApp('Slack'),

  "l:cmd;ctrl": shell('/Users/chris.bruce/bin/lockscreen'),
});

// Bind all of the throw bindings that I will ever need
for (var i = 0; i < 9; i++) {
  slate.bind((i + 1) + ":ctrl;alt", throwWindow(i));
}

// Convenience operation functions

function resizeBy(w, h, anchor) {
  w = w >= 0 ? "+" + w : w;
  h = h >= 0 ? "+" + h : h;
  return slate.operation('resize', {
    width: w + '%',
    height: h + '%',
    anchor: anchor
  });
}

function push(direction) {
  return slate.operation('push', {
    direction: direction,
    style: 'bar-resize:screenSizeX/2'
  });
}

function move(x, y, w, h) {
  return slate.operation('move', {
    x: x,
    y: y,
    width: w,
    height: h
  });
}

function throwWindow(s) {
  // TODO: actually try out the real throw operation
  return slate.operationFromString("throw " + s + " resize");
}

function hint(characters) {
  return slate.operation('hint', {
    characters: characters
  });
}

function shell(cmd) {
  return slate.operation("shell", {
    command: cmd
  });
}

function focusApp(app) {
  return slate.operation('focus', {
    "app": app
  });
}
