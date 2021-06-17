.. _sphinx_set_up:

======
Sphinx
======

This is a tutorial for setting up website with the `PyData Sphinx Theme <https://pydata-sphinx-theme.readthedocs.io/en/latest/index.html>`__.

.. _set_up_repository:

Setting up a repository
-----------------------

First create the repository and place yourself in its directory::

    git init <github-user>.github.io
    cd <github-user>.github.io

Add your remote for your github repo. Create an empty commit and push it.

    git remote add origin https://github.com/<github-user>/<github-user>.github.io
    git commit --allow-empty "Inital commit"
    git push --set-upstream origin main

.. _pip_install:

Installing from PyPI
--------------------

First you will need ``sphinx``, **sphinx_panels**, and **nbsphinx** package to be installed. Run the following commands from a terminal window::

    pip install sphinx
    pip install sphinx_panels
    pip install nbsphinx

.. _create_sphinx:

Creating your Sphinx
--------------------

Initialize a Sphinx documentation::

    sphinx-quickstart

Configure your project perferrably::

    > Separate source and build directories (y/n) [n]: y
    ...
    > Project name: your_project_name
    ...
    > Author name(s): your_name
    ...
    > Project release []: 0.0.1
    ...
    > Project language [en]: en

.. _add_theme:

Adding a theme
--------------

Intalling ``pydata-sphinx-theme`` package with PyPI::

    pip install pydata-sphinx-theme

In the ``conf.py`` of your Sphinx source, update the ``html_theme`` configuration option::

    html_theme = "pydata_sphinx_theme"

For more configuration of the theme, follow `documentation <https://pydata-sphinx-theme.readthedocs.io/en/latest/index.html>`__. Then, build Sphinx in a ``./docs`` subdirectory to suit GitHub Pages preset setup to serve a documentation, and add an empty `.nojekyll` file in `docs` repository to make GitHub to not try interpret files as part of a Jekyll site. You could summarize in a ``run.sh`` file::

    #!/bin/bash
    echo "deleting current documentation..."
    rm -rf docs/
    echo "starting building..."
    sphinx-build -E -b html ./source ./docs
    echo "add .nojekyll file..."
    touch ./docs/.nojekyll

.. _publish_enjoy:

Publishing and enjoying
-----------------------

Commit and push changes::

    git add .; git commit -m "$(date)"

Check result either locally starting an http server with Python::

    python -m http.server 8080 --directory ./docs

with address http://localhost:8080, or directly visit::

    open <github-user>.github.io

.. warning::

    The documentation was last updated on |today| and may be deprecated. If unexpected errors occur, check out official documentation for `Sphinx`_, `PyData Sphinx Theme`_, `GitHub Pages`_.
    
.. _Sphinx: https://www.sphinx-doc.org/en/master/index.html
.. _PyData Sphinx Theme: https://pydata-sphinx-theme.readthedocs.io/en/latest/index.html
.. _GitHub Pages: https://docs.github.com/en/pages/getting-started-with-github-pages

.. note::

    In order to eliminating username and password when pushing and pulling with your GitHub account, run the following commands from a terminal window::

        lc -al ~/.ssh # check for existing keys
        ssh-keygen -t ed25519 -C "<xxx>@gmail.com" # add new SSH key
        eval `ssh-agent -s` # fire up the SSH agent
        ssh-add ~/.ssh/id_ed25519 # add the SSH key
        cat ~/.ssh/id_ed25519.pub # pull up the key
        # navigate to Github settings and add key
        git remote set-url origin git@github.com:<username>/<repo>.git
