# Unixcorn Website

Built with [Middleman](https://middlemanapp.com/) for our main website.

## Running

Refer to the Middleman website to know how to install it.

```bash
middleman
```

## Building for production

```bash
middleman build
```

## Writing new articles

```bash
middleman article -s -t tag -t unixcorn 'My title'
```

Then edit the newy created file in `source/blog`.
You can add media to the corresponding folder and use them in your article as if they were in the same directory.