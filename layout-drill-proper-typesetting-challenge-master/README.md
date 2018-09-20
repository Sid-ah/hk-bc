# Layout Drill Proper Typesetting

## Learning Competencies

* Implement fonts and typographic styling in CSS
* Change basic CSS appearance: colors, widths, padding, margin

## Summary

We're going to learn some fundamentals about styling elements on a web page.
You'll have a set of fixed HTML files to work with and your job is to change
the CSS and *only* the CSS to achieve the desired effects.

The `./source` directory contains a set of files meant to represent a blog
article that spans multiple pages.

If you open up any of the `page*.html` pages (the `*` represents any
character), you'll find that they follow this format:

1. The name of the blog
2. A title for the article
3. The article body, broken up into sections
4. A very ugly pagination link area

If you haven't already read through it, make sure to peruse the  [Interactive
Guide to Blog Typography][Interactive Guide to Blog Typography] &mdash;  A
great resource.

Also, if you're really interested in typography, you can check out this
Smashing Article: [Typographic Design Patterns and Best
Practices][smashing-typography].


## Releases

### Release 0: Better Reading Through Typography

As closely as you can, edit the `main.css` file so that the text in each of the
blog pages (`page*.html`) looks something like this:

![Proper Typesetting][typesetting image]

You may not be able to pick out each of the differences, so in the interest of
not wasting your time playing "compare the pictures", here is a list of the
changes:

- Website header is separated from the rest of the page with a gray border
- Body copy uses a serif font while the header, title, pagination links, and
  footer use a sans-serif font
- Body copy is more readable due to improved spacing
- Blockquote copy is rendered in italics
- Headers within the blog article have more space above them than below them

## Resources

* [Interactive Guide to Blog Typography][]
* [Smashing Magazine Typography "Best Of"][smashing-typography]

[Interactive Guide to Blog Typography]: http://kaikkonendesign.fi/typography/
[smashing-typography]: http://www.smashingmagazine.com/2009/08/20/typographic-design-survey-best-practices-from-the-best-blogs/
[typesetting image]: http://f.cl.ly/items/2M0M1g0M3N2O2O1u2z1P/proper_typesetting.png

