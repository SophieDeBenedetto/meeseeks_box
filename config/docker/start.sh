#!/usr/bin/env bash

# Prefix `bundle` with `exec` so puma shuts down gracefully on SIGTERM (i.e. `docker stop`)
bundle exec puma -C config/puma.rb