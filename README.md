coursePlayer
============

Course player prototype - not by any means fully functional

Just here to show the type of things I have been working on recently. 

Load up with "grunt serve". Will open to the error page (routing goes to NONE/0 in hash). Change to "step/1".

The first title is the course name, second is the page. For instance, step/1 will load step1.html.

TODO:

*Create a better system for loading up the HTML based on hash.

*Move logic that will need to be duplicated for different activity types (currently only multiple choice exists) into a service or the ActivityCtrl module.

*Flesh out the other activity types. Currently plannes are drag & drop, fill in the blank, and multiple choice.

*Need to implement these directives into the Course Builder to allow easy creation of these static HTML files.
