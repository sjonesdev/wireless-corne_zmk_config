#!/usr/bin/env bash
set -eu

APP_DIR=/workspaces/zmk/app
LEFT_DIR=build-left
RIGHT_DIR=build-right
mkdir build/
pushd $APP_DIR
west build -b blecorne_left -d $LEFT_DIR -- -DZMK_CONFIG=/workspaces/zmk-config/config -DZMK_EXTRA_MODULES=/workspaces/zmk-config/
west build -b blecorne_right -d $RIGHT_DIR -- -DZMK_CONFIG=/workspaces/zmk-config/config -DZMK_EXTRA_MODULES=/workspaces/zmk-config/
popd
cp "$APP_DIR/$LEFT_DIR/zephyr/zmk.uf2" build/blecorne_left-zmk.uf2
cp "$APP_DIR/$RIGHT_DIR/zephyr/zmk.uf2" build/blecorne_right-zmk.uf2
