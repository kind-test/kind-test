#! /usr/bin/env bash
# Uninstall the whoami service

rm -f $(git root)/routes.d/hello
helm uninstall whoami
