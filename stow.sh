#!/bin/bash

stow --target="$HOME" home --adopt
git reset --hard
