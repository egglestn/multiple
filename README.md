# README

This is a small example project to demo collection_radio_buttons, which
is fairly limited as provided by rails. There is a page showing the
limitations, plus two further pages with enhanced implementations.

You might use collection_radio_buttons where you are collecting votes for 
multiple things, for example if you have a review site like goodreads or 
TripAdvisor.

You can see a live demo at https://multiple-radio-buttons.herokuapp.com/

## Get started

* Setup sqlite
* Create the database
* Run rails db:seed
* Launch the rails server
* Go to http://localhost:3000/

## Collection Radio Buttons - out of the box

#### View features

Uses collection_radio_buttons 'out of the box'. Demonstrates two major issues, 
* the CSS styling needs some work if you don't want a vertical layout
* the hidden field has identical syntax for each row, as follows:
  - user[books_user][score]

The hidden field causes quite some pain, it means that you can only select any
one of the radio buttons in the page. Once you change to a different book, the old
score is lost.


There's no controller for this, it's just to showcase the problems in the view,
and the controller for the other views is not compatible.

Improvements are in Collection Radio Buttons - Adjusted

### References for Collection Radio Buttons

Collection Radio Buttons
https://apidock.com/rails/ActionView/Helpers/FormOptionsHelper/collection_radio_buttons

## Collection Radio Buttons - adjusted

#### Controller features

* Process multiple score params
* Create new join entries for each score
* When the page is loaded, destroy all previous scores 
  - This feature is **not** recommended in production, it just makes the demo easier

#### View features

Users collection radio buttons with some adjustments to solve the issues in the
first version.

edit_a.html.erb

* fields_for each book
* collection_radio_buttons
* save

I had several more complex incarnations of this page, with hidden fields
that interacted differently with the controller. It took me a while, 
mostly deep in the chrome debugger, to get to this solution. 

Here is how the hidden field
syntax ended up, for each book:

* [user][books_user][book_id][score]

### Best Practices

Best practice debate: would it be better to use this syntax instead?

* [user][books_user][user_id][book_id][score]

Related best practice debate: should this page and url be?

* users_books -> post / create OR
* user -> put / update

This structure may not be theoretical best practice, but it is functional
(it was genuinely non-trivial to get there), and both the hidden field
and the controller code ended up fairly succinct, especially relative to 
several other incarnations I tried out.

I defend the end result as 'best pragmatic', if not 'best practice'.

### References and notes about SCSS

SCSS
https://sass-lang.com/

Scss and Sass are the same thing, they were different at some point in history, 
but merged.

It might be possible to build this demo in plain old CSS, and maybe I should have done,
but I find it frustrating to work without the SCSS nesting and variables, even in a short
file. 

If you never used SCSS / SASS before, please make time to have a go: it is extremely
powerful. Also, plain old CSS works just fine in an SCSS file, all the extra features are 
entirely optional.

## Styled radio buttons

The last version, styled radio buttons, has improvements to make the view look more
appealing.

#### Controller features

The controller is the same one, used for both edit_a and edit_b, nothing changes 
about the controller interactions

#### View features

* 5 empty spans
* numbered high to low

The high to low numbering is important, it helps the CSS that uses rtl (see below)

#### SCSS features

* different icons and styling for scored vs non-scored icons
* bidi rtl infrastructure to support...
* tilde magic

The tilde magic means that when you select a middle score, the icons to the left show "scored" as well

#### JS features
* javascript adds a hidden field
* hidden field to save the score
* toggle the "scored" class when a user selects a score
* remove the "scored" class if the user changes their mind

The JS might be short, but it's important: the end result is an exact 
match of the hidden field in edit_a

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
This works well for demos, but in production recommend V5 or V6 and consider Pro versions 
if budget allows. 

If you're using font awesome and an icon doesn't display, here are some things to check:

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

I prefer bootstrap over semantic, for several reasons. The most significant is the 
bootstrap grid base is 12, which divides nicely in 2, 3, and 4, but the semantic grid 
base is 10, which only divides nicely into 2 and 5, but not 3 or 4.
