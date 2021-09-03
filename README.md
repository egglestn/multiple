# README

This is a small example project that shows two ways to 
build multiple radio buttons. You could use this where
you are collection multiple votes, for example if you have
a site like goodreads or TripAdvisor.

## Collection Radio Buttons

The first version: collection radio buttons, 
is built only in Ruby on Rails, with a default sqlite 
database configuration

* Run rails db:seed
* Launch the rails server
* Go to http://localhost:3000/
* Select 'Collection Radio Buttons'

Controller features:

* Processing multiple score params
* Create new join entries for each score
* When the page is loaded, destroy all previous scores 
  - This feature isn't generally recommended, it just made demo-ing easier

View features:

edit_a.html.erb

* fields_for each book
* collection_radio_buttons
* save

I had several incarnations of this page that were more complex, with hidden fields
that interacted differently with the controller. Ruby on Rails is powerful enough 
that when I dug in and removed them, this is the result.

### References for Collection Radio Buttons

Collection Radio Buttons
https://apidock.com/rails/ActionView/Helpers/FormOptionsHelper/collection_radio_buttons

SCSS
https://sass-lang.com/

### Notes about SCSS / SASS

Scss and Sass are the same thing, they were different at some point in history, 
but merged.

It might be possible to build this demo in plain old CSS, and maybe I should have done,
but I find it frustrating to work without the SCSS nesting and variables, even in a short
file. If you never used SCSS / SASS before, please make time to have a go: it is extremely
powerful. Also, plain old CSS works just fine in an SCSS file, all the extra features are 
entirely optional.

## Styled radio buttons

The second version, styled radio buttons, has improvements for the user experience.

* Go to http://localhost:3000/
* Select 'Styled Radio Buttons'

Controller features:

The controller is identical, nothing has changed relative to Collection Radio Buttons

View features:

* 5 empty spans
* numbered high to low

The high to low numbering is important, it helps the CSS that uses rtl (see below)

SCSS features
* different icons and styling for scored vs non-scored icons
* bidi rtl infrastructure to support...
* tilde magic

The tilde magic means that when you select a middle score, the icons to the left show "scored" as well

JS features
* javascript adds a hidden field
* hidden field to save the score
* toggle the "scored" class when a user selects a score
* remove the "scored" class if the user changes their mind

The JS might be short, but it's important. 

It took me a while, mostly deep in the chrome debugger, to get the syntax for 
the hidden name field exactly right: 
the end result is an exact match of the hidden field created by RoR in 
collection_radio_buttons

### References for Styled Radio Buttons

Font Awesome 4
https://fontawesome.com/v4.7/

CDN for Font Awesome 4
https://www.w3schools.com/icons/fontawesome_icons_intro.asp

Tilde selector in CSS
https://www.w3docs.com/snippets/css/what-does-the-css-tilde-selector-mean.html

### Notes about JavaScript

I usually prefer https://jquery.com/ and ES6, which woudl have allowed me to use
$ finders. Also, as far as I'm aware you can achieve all the same things in "pure" 
JS that you can in jQuery, it just makes the syntax easier.
 
In a production app, I would most likely rewrite updateStar.js in jQuery + ES6.

### Notes about Font Awesome and other icon libraries

Font Awesome 4 is **not** the most recent version, chosen because it's the easiest 
to find the free CDN for, and generally meets lowest common denominator requirements.
This works well for demos, but in production consider Pro versions of V5 or V6. 

If you're using font awesome and the icon doesn't display, here are some things to check:

* the CDN or the downloaded files are included in application layout 
* the font-family is the matching FontAwesome family
* the font weight is correct 

With apologies, I don't have a good reference for "correct", I generally use trial and error.
The font awesome docs tend to assume you are using classnames rather than CSS unicode.
Classnames are the best practice for static icons, but if you're making them interactive
as in this example, they are much easier to manage in the CSS. With hindsight, I 
possibly could have used JS to toggle the font awesome classnames, but this is 
built now.

If you are using Semantic, it comes with Font Awesome 5.0.8 icons included

Bootstrap which has its own set of Icons

I prefer bootstrap over semantic, mainly because the bootstrap grid base is 12, which
divides nicely in 2, 3, and 4, but the semantic grid base is 10, which only divides
nicely into 2 and 5.
