# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

This is the source for [Geospatial Python Tutorials](https://www.geopythontutorials.com/), a Jupyter Book site published by Spatial Thoughts. Content is a homepage (`introduction.md`) plus ~30 tutorial notebooks in `notebooks/`, organized by topic (`geopandas_*`, `xarray_*`, `dask_*`, `stac_*`, `xee_*`, `samgeo_*`) and listed in `_toc.yml`.

## Build and publish

- `make html` — clean `_build/` and run `jupyter-book build .`
- `make gh-pages` — commit + push `main`, build, then force-push `_build/html` to `gh-pages` via `ghp-import`
- Any push to `main` triggers `.github/workflows/deploy.yml`, which rebuilds and force-pushes to `gh-pages`, auto-publishing the live site.
- CI pins `jupyter-book<2` (the Sphinx-based v1 line); `requirements.txt` does not pin this, so a local `pip install` can drift to v2 and behave differently. Match the CI pin when installing locally.
- Jupyter Book is configured with `execute.execute_notebooks: off` — notebooks are **not** re-executed at build time. Committed cell outputs are what gets published, so run and save notebooks locally (Colab or Jupyter) before committing if outputs need to change.

## Data convention

`notebooks/data/` and `notebooks/output/` are gitignored and not committed. Tutorial datasets are instead hosted as GitHub Release assets and fetched on demand by a `download()` helper in each notebook, from `https://github.com/spatialthoughts/geopython-tutorials/releases/download/data/<filename>`, downloading only if not already present locally. New tutorials should follow this pattern rather than committing data files.

## Notebook structure convention

Tutorial notebooks follow a consistent shape:
1. H1 title cell, then `## Introduction` (and often `## Overview of the Task`)
2. `## Setup and Data Download` — a `%%capture` cell that conditionally `pip install`s extra packages in Colab (`if 'google.colab' in str(get_ipython()): !pip install ...`), an imports cell, local `data`/`output` folder creation, and the `download()` helper described above
3. `## Procedure` — narrative markdown cells interleaved with code cells

Notebooks carry Colab metadata (`colab: {name, provenance}`) since they're authored/run in Google Colab; `_config.yml` sets a Colab launch button for each notebook page.
