
# This website

I redesigned my website to be what I believe the web should be as a whole. Readability and Accessibility are its primary goals. There is no `javascript`, animation, `webgl`, analytics, tracking or *insert web technology here*. It is just `html`, minimal `css` and sometimes images.

This website is written in markdown and is statically generated using a `bash` script. A page load (*without images*) is only a single `http` request. The build script (*minus image minification*) runs in under `10ms` and can easily be run inside of a loop to mimic `jekyll serve` functionality.

The build process looks like this:

1. Convert `md` files to `html`.
2. Insert generated `html` into the template.
3. Minify the resulting `html` file.
4. Save it to `.site/`.

The `css` is as minimal and as generic as possible while still providing a fully responsive layout. It is so tiny it is faster to inline it on every page than to load it from an external file. There are no classes and `html` tags themselves are styled.

There is zero `javascript` here nor analytics or tracking. It is not needed. I do not care how many people visit my website. Nor should you.

No web fonts are used. The `css` just sets `font-family: sans-serif` resulting in your system's default fonts being used. I do not have some mystical design vision which requires 7 different downloadable fonts.

I do not care for `favicons`. However, not including one slows down your website, as modern browsers make network requests for `favicons` even if they are not present in the `html`. I work around this by setting the favicon to the smallest possible `base64` encoded `png`.

```
<link href="data:image/png;base64," rel=icon type="image/png">
```

Images are provided in two different sizes. One size to match the `max-width` of the content and a second size (*which is twice as large*) for High-DPI displays. I also provide two different image formats, `webp` and `jpg`/`png` as a fallback if the former is unsupported.

The source is available on my GitHub account, here:  [website source](https://github.com/dylanaraps/blag)

