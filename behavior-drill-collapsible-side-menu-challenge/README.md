# Behavior Drill Collapsible Side Menu 
 
##Learning Competencies 
* Position elements using CSS positioning, display and float 
* Write custom event handlers in JavaScript and jQuery 
* Use jQuery effects like toggle, show, hide

##Summary 

When designing user interfaces, there are often elements that you would be useful to include if they didn't take up so much screen real estate.  It's a competitive market, and you have to position your elements wisely.

One way to get around this problem is to make elements collapsible, and then add event handlers to toggle the display of the element.

This is exactly what we're going to build in this challenge: a collapsible sidebar-style navigation area.

If you haven't already written the styles for a "sticky" sidebar-style navigation area, go and do the prerequisite challenge.  You can reuse that code for this challenge.

The `source` directory contains a basic HTML file for a product site.  To complete this challenge, you will need to edit the HTML, add some styles to the `main.css` stylesheet, and write your own JavaScript in a separate file.

You will need to brandish the powers of CSS's `position` property, and you will want to use jQuery to help you out with the showing/hiding part.  

##Releases

###Release 0 : Make it Collapsible

The first step in making an element respond to user input is to ask the question "what should trigger this behavior?"  In other words, what should your JavaScript "listen" for it to know what to do?

This is called *event binding* and it is a core component of designing rich client-side applications.  In this challenge, we're going to stick with a tried-and-true event to trigger the behavior: the mouse click. 

To make the sidebar collapsible, you will need to provide the user with two things:

1. A way to open the menu (if it is closed)
2. A way to close the menu (if it is open)

It's as simple as that.  In the screenshots below, you can see how this works in action.

**1. Open the page, sidebar is closed, and a link is provided to trigger the "open" action**

![Closed Side Menu](http://f.cl.ly/items/2g3z220f2f0Q0H0E1414/collapsible_side_menu-closed.png)

**2. When the `Open Sesame` link is clicked, the sidebar appears.  Ta-da!**

Notice that the content area is still centered in the white area of the page, *not* centered on the browser window itself.

![Open Side Menu](http://f.cl.ly/items/2H110f0P0D2n1C1A123k/collapsible_side_menu-open.png)

**3. The sidebar is sticky and can be opened or closed from any scroll position on the page**

![Menu open and page scrolled down](http://f.cl.ly/items/3Z3d3U19421M2N2U0W0u/collapsible_side_menu-scrolled_down.png)

Write whatever HTML, CSS, and JavaScript is needed to achieve the above functionality.

###Release 1 : Make it Pretty
Add the following improvements to your design: 

- Instead of an ugly link, make a nicely-styled button toggle the sidebar.  Use the same button to open and close the sidebar.
- Redesign the sidebar so that when it is closed, a small section of it (~ `20px`) is still showing, and when the user hovers over that section, the full sidebar is shown.
- Animate the show/hide behavior with jQuery's `animate()` function. 

<!-- ##Optimize Your Learning  -->

##Resources

* [CSS Positioning 101][css-positioning]
* [jQuery Click Event Binding][jquery-event-binding]
* [jQuery Toggle Function][jquery-toggle]

[css-positioning]: http://alistapart.com/article/css-positioning-101
[jquery-event-binding]: http://api.jquery.com/click/
[jquery-toggle]: http://api.jquery.com/toggle/
