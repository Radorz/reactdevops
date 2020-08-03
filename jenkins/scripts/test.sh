#!/usr/bin/env sh


npm test
npm audit | tail -n 2
