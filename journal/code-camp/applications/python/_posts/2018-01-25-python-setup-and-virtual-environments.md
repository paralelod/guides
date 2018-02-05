---
title: "Python Setup and Virtual Environments"
cover: "journal/v1517094413/python-basics.jpg"
topics:
        - topic: Installing with Python Homebrew
          links: 
            - url: http://www.pyladies.com/blog/Get-Your-Mac-Ready-for-Python-Programming/
              description: "Python comes with OS X, so you can probably don't need to do this step. You can check this by typing python --version into Terminal. If you get an error message, you need to install Python. "
            - url: http://www.pyladies.com/blog/Get-Your-Mac-Ready-for-Python-Programming/
              description: "If for some reason you don't have Python or if you want to get the current version, you can now do this easily with Homebrew! $ brew install Python"
            - url: http://www.pyladies.com/blog/Get-Your-Mac-Ready-for-Python-Programming/
              description: "pip is the preferred installer program. Starting with Python 3.4, it is included by default with the Python binary installers. If pip not installed $ sudo easy_install pip"
            - url: https://github.com/pyenv/pyenv#homebrew-on-mac-os-x
              description: "You can install pyenv using the Homebrew package manager for Mac OS X. $ brew update $ brew install pyenv. To upgrade pyenv in the future, use upgrade"
            - url: https://github.com/pyenv/pyenv-virtualenv
              description: "Mac OS X users can install pyenv-virtualenv with the Homebrew package manager. This will give you access to the pyenv-virtualenv command."
            - url: https://github.com/pyenv/pyenv-virtualenv
              description: "Mac OS X users can install pyenv-virtualenvwrapper with the Homebrew package manager. This is recommended method of installation if you installed pyenv with Homebrew."
              
        - topic: Virtual Environments
          # notes:
          #   - url: note_plc.jpg
          #     description: demo note as example of a real one
          #   - url: note_plc.jpg
          #     description: demo note as example of a real one
          links: 
            - url: https://jeffknupp.com/blog/2014/02/04/starting-a-python-project-the-right-way/
              description: "What is a virtual environment? It's a Python installation completely segregated from the rest of the system (and the system's default Python installation)."
            - url: http://docs.python-guide.org/en/latest/dev/virtualenvs/
              description: "Pypenv is a dependency manager for Python projects. If you’re familiar with Node.js’ npm or Ruby’s bundler, it is similar in spirit to those tools."
            - url: https://medium.com/@henriquebastos/the-definitive-guide-to-setup-my-python-workspace-628d68552e14
              description: "Use pyenv to install Python interpreters, pyenv-virtualenv to configure environments,pyenv-virtualenvwrapper to work on them"
            - url: https://medium.com/@henriquebastos/the-definitive-guide-to-setup-my-python-workspace-628d68552e14
              description: "It’s necessary to configure the shell to initialize pyenv when you start a terminal session. It's also necessary config your ~/.bashrc or ~/.bash_profile  file"
            - url: http://docs.python-guide.org/en/latest/dev/virtualenvs/
              description: "$ mkvirtualenv my_project, $ workon my_project,  $ deactivate, $ rmvirtualenv venv (delete), lsvirtualenv (list all envs)."     
        - topic: Managing Packages with PIP
          links: 
            - url: https://jeffknupp.com/blog/2014/02/04/starting-a-python-project-the-right-way/
              description: "make sure you have pip available. You can check this by running: pip --version. If you installed Python from source, with via Homebrew you should already have pip."
            - url: https://jeffknupp.com/blog/2014/02/04/starting-a-python-project-the-right-way/
              description: "The most common usage of pip is to install from the Python Package Index using a requirement specifier. pip install 'SomePackage'"
            - url: https://packaging.python.org/tutorials/installing-packages/
              description: "Upgrading packages - Upgrade an already installed SomeProject to the latest from PyPI. $ pip install --upgrade SomeProject"
            - url: https://packaging.python.org/tutorials/installing-packages/
              description: "Requirements files Install a list of requirements specified in a Requirements File. pip install -r requirements.txt"
            - url:
              description: "Requirements files are used to hold the result from pip freeze for the purpose of achieving repeatable installations. $ pip freeze > requirements.txt"
---

 
