# Agave template School Website

This repo contains a working static website written with [Jekyll](https://jekyllrb.com)

## Usage

First, install the RUBY and NODE dependencies of this project:

```
bundle
yarn
```

Then, to run this website in development mode (with live-reload):

```
yarn start
```

To build the final, production ready static website:

```
yarn build
```

The final result will be saved in the `public` directory.

## Environment

For application test, setup `AGAVECMS_BASE_URL` with `agave.lvh.me:3000` and `AGAVE_API_TOKEN` with your admin TOKEN.
