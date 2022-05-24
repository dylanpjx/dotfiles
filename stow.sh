#!/bin/bash

stow --target="$HOME" linux --adopt
git reset --hard
