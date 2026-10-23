# Geospatial Python Tutorials

This repository contains the notebooks and Jupyterbook configuration for the [Geospatial Python Tutorials](https://www.geopythontutorials.com/) website.

The website is a static website generated using the following technologies

* All the content is based on Markdown files and Jupyter notebooks.
* The HTML is generated using [Jupyterbook](https://jupyterbook.org/en/stable/intro.html).
* The webpages are hosted on [Github Pages](https://pages.github.com/). A GitHub action builds and writes the output to the `gh-pages` branch.
* Comments are powered by [utterances](https://utteranc.es/).


# Local Development

## Clone the Repository

```
git clone git@github.com:spatialthoughts/geopython-tutorials.git
cd geopython-tutorials
```

    
## Installation

The following instructions have been tested for Linux/Mac systems. I prefer conda for environment management so the instructions use conda, but if you prefer virtualenv, you can use it instead as well.

Create a new environment named `geopython-tutorials` and install dependencies. Optionally we also need `make` to build the source files.

```
conda create --name geopython-tutorials
conda activate geopython-tutorials
conda install pip
conda install make
pip install -r requirements.txt
```

## Updating the Contents

The homepage content is in the file `introduction.md`. All other content is generated from the `.ipynb` files in the `notebooks` folder. The table of content is in the `_toc.yml` file.

### Editing existing tutorials

* Edit the corresponding notebook in the `notebooks/` folder using Jupyterlab/Colab.

### Adding a new tutorial

* Add the `.ipynb` file in the `notebooks/` folder.
* Edit the `_toc.yml` file and add the section for the new tutorial.

## Build the Website and Push the Changes

The `Makefile` contains several rules to execute the commands to build the website.

After making changes, run the following to build the HTML pages and preview them.

```
make html
```

To push the changes to GitHub pages, run the following


```
make gh-pages
```

License
-------

All the tutorials are available under a [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/deed.en_US)
