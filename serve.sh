#!/bin/sh

env HUGO_ENV="DEV" hugo server --theme=hugo_theme_robust --buildDrafts
