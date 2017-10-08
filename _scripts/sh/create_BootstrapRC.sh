cat >  ./.bootstraprc <<- 'EOF'
---
# Output debugging info
# loglevel: debug

# Major version of Bootstrap: 3 or 4
bootstrapVersion: 4

# If Bootstrap version 4 is used - turn on/off flexbox model
useFlexbox: true

# Webpack loaders, order matters
styleLoaders:
  - style
  - css
  - postcss
  - sass

# Extract styles to stand-alone css file
# Different settings for different environments can be used,
# It depends on value of NODE_ENV environment variable
# This param can also be set in webpack config:
#   entry: 'bootstrap-loader/extractStyles'
extractStyles: false
# env:
#   development:
#     extractStyles: false
#   production:
#     extractStyles: true


# Customize Bootstrap variables that get imported before the original Bootstrap variables.
# Thus, derived Bootstrap variables can depend on values from here.
# See the Bootstrap _variables.scss file for examples of derived Bootstrap variables.
#
# preBootstrapCustomizations: ./path/to/bootstrap/pre-customizations.scss


# This gets loaded after bootstrap/variables is loaded
# Thus, you may customize Bootstrap variables
# based on the values established in the Bootstrap _variables.scss file
#
# bootstrapCustomizations: ./src/bootstrap-custom.scss


# Import your custom styles here
# Usually this endpoint-file contains list of @imports of your application styles
#
# appStyles: ./path/to/your/app/styles/endpoint.scss


### Bootstrap styles
styles:

  # Mixins
  mixins: true

  # Reset and dependencies
  normalize: true
  print: true

  # Core CSS
  buttons: true
  code: true
  forms: true
  grid: true
  images: true
  reboot: true
  tables: true
  type: true

  # lib
  alert: true
  badge: true
  breadcrumb: true
  button-group: true
  card: true
  close: true
  custom-forms: true
  dropdown: true
  input-group: true
  jumbotron: true
  list-group: true
  media: true
  nav: true
  navbar: true
  pagination: true
  progress: true
  responsive-embed: true
  transitions: true

  # lib w/ JavaScript
  carousel: true
  modal: true
  popover: true
  tooltip: true

  # Utility classes
  utilities: true

### Bootstrap scripts
scripts:
  alert: true
  button: true
  carousel: true
  collapse: true
  dropdown: true
  modal: true
  popover: true
  scrollspy: true
  tab: true
  tooltip: true
  util: true

EOF

file -I  ./.bootstraprc
echo "encoding " ./.bootstraprc" ("us-ascii") to utf-8"

echo "🐙 \033[1;34m BootstrapRC done!!! \033[0m"
