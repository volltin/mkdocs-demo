#!/usr/bin/env bash

USER=volltin
EMAIL=volltin@live.com
REPO=mkdocs-demo

set -e

git remote add gh-token "https://${GH_TOKEN}@github.com/$USER/$REPO.git";
git fetch gh-token && git fetch gh-token gh-pages:gh-pages;

if [ "$1" != "dry" ]; then
    # Update git config.
    git config user.name "Travis Builder"
    git config user.email "$EMAIL"
fi

mkdocs gh-deploy -v --clean --remote-name gh-token;
