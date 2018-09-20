# Layout Drill Right Hand Navigation

## Learning Competencies

* discern difference between markup and presentation
* edit presentation layer to achieve a new layout
* position using css float

## Summary

We're going to learn some fundamentals about webpage layout.  You'll have a
fixed HTML file to work with and your job is to change the CSS and *only* the
CSS to achieve the desired layout.

The `blog.html` contains basic HTML that models a blog post, including:

1. A page header
2. A navigation bar
3. The blog post content
4. A footer

**NOTE:** This is slightly different source content than the left-hand and right-hand
navigation challenges.  Make sure you use the correct source gist!

If you're not familiar with floating in CSS, you might need to take time to
read these resources:

* [A Step-by-Step Float Tutorial][]
* [Simple 2 column CSS layout][]

## Releases

### Release 0 : Implement Right-hand Navigation

As closely as you can, edit the `main.css` file so that the blog post now looks like this:

<a href="http://cl.ly/image/1J3g0O060b3k" target="_blank"><img
src="http://f.cl.ly/items/263S160T3a2H3j1F3S23/Screen%20Shot%202013-02-16%20at%207.14.14%20PM.png"
width="780"></a>

The entire page is `720px` wide; don't change that.  The entire `.content` area
should be `600px` wide, including any padding and borders.  The content area
should be flush against the left-hand side of the page.

The right-hand navigation should be `120px` wide including any padding and
borders.  There should be `20px` of space between the content area and the
right-hand navigation.

The footer text should align with the start of the content text and there
should be `20px` of space between the footer text and both the bottom of the
content area and the bottom of the page.

## Resources

* [A Step-by-Step Float Tutorial][]
* [Simple 2 column CSS layout][]

[A Step-by-Step Float Tutorial]: http://css.maxdesign.com.au/floatutorial/.
[Simple 2 column CSS layout]: http://www.456bereastreet.com/lab/developing_with_web_standards/csslayout/2-col/
