This represents a common phase guide body for DBC sites to build off of.

Full documentation of our [branching strategy][] can be found in Confluence.

When branching off of `master` to create your own site-specific branch, you
will want to search through the files to find the placeholder text:

`<- FILL IN DETAILS HERE ->`

This is where your site-specific changes can be made.

As time continues, your site-specific branch can continue to rebase on master
and, through the magic of git, your changes will be applied on top of the
common base.

We would suggest that one of your site-specific commits be to remove this file
;). It should not be required after your site begins customizing its phase
guide.

[branching strategy]: http://confluence.devbootcamp.com/display/CUR/Introduction+to+Branches
