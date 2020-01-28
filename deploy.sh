#!/bin/bash

git config --global user.email "kevin@zollege.com"
git config --global user.name "Kevin Colten"
if [ "${CIRCLE_BRANCH}" == "preview" ]; then export JEKYLL_ENV='preview.'; fi
if [ "${CIRCLE_BRANCH}" == "preview" ] || [ "${CIRCLE_BRANCH}" == "master" ]; then
  yarn images
  yarn jekyll-build-amp
  yarn optimize
  yarn css
  yarn jekyll-build
  yarn favicon
  yarn jekyll-build
  yarn jekyll-build-amp
  yarn optimize
  yarn deploy
fi
