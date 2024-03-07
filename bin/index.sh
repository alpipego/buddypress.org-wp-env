#!/bin/bash

# Exit if any command fails.
set -e

# Setup the environment
npm run wp-env start

# Update wp configs
npm run wp-env run cli wp config set WPORG_SANDBOXED true

# Import tables
npm run wp-env run cli wp db import wp-content/uploads/buddypress_org_wp_env.sql

# Activate plugins
npm run wp-env run cli wp plugin activate akismet bbpress-no-admin debug-bar email-post-changes syntaxhighlighter buddypress bbpress-org buddypress-org

# Activate theme
npm run wp-env run cli wp theme activate bb-base

# Change permalinks
npm run wp-env run cli wp rewrite structure '/%postname%/'
