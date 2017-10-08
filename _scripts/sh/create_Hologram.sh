echo "🐙 \033[1;34m Criando Hologram Styleguide para $theme \033[0m"

echo "

  # Hologram will run from same directory where this config file resides
  # All paths should be relative to there

  # The directory containing the source files to parse recursively
  source: ./_theme/$theme

  # The directory that hologram will build to
  destination: ./_content/styleguide

  # The assets needed to build the docs (includes header.html,
  # footer.html, etc)
  # You may put doc related assets here too: images, css, etc.
  documentation_assets: ./_styleguide/assets

  # The folder that contains templates for rendering code examples.
  # If you want to change the way code examples appear in the styleguide,
  # modify the files in this folder
  code_example_templates: ./_styleguide/templates

  # The folder that contains custom code example renderers.
  # If you want to create additional renderers that are not provided
  # by Hologram (i.e. coffeescript renderer, jade renderer, etc)
  # place them in this folder
  code_example_renderers: ./code_example_renderers

  # Any other asset folders that need to be copied to the destination
  # folder. Typically this will include the css that you are trying to
  # document. May also include additional folders as needed.
  # dependencies:
  #   - ./_theme/html-react/assets

  # Mark which category should be the index page
  # Alternatively, you may have an index.md in the documentation assets
  # folder instead of specifying this config.
  # index: config

  # To additionally output navigation for top level sections, set the value to
  # 'section'. To output navigation for sub-sections,
  # set the value to `all`
  nav_level: all

  # Hologram displays warnings when there are issues with your docs
  # (e.g. if a component's parent is not found, if the _header.html and/or
  #  _footer.html files aren't found)
  # If you want Hologram to exit on these warnings, set the value to 'true'
  # (Default value is 'false')
  exit_on_warnings: false

  css_include:
    - ../assets/main.css

  js_include:
    - ../assets/common.js
    - ../assets/main.js
" >> _config/hologram_config.yml

echo "🐙 \033[1;34m Hologram done!!! \033[0m"
