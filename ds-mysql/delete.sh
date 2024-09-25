#! /usr/bin/env bash
# Unnstall MySQL

helm uninstall ds-mysql-post
helm uninstall ds-mysql-phpmyadmin
helm uninstall ds-mysql
helm uninstall ds-mysql-pre

