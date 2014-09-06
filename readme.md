## Web Site Objectives

These are the objectives of the web site.

* Promote club
* Increase membership
* Support members
* Increase revenue

All content on the site should support one or more of these objectives.

## Formatting Content Guide

You may need to use the HTML feature to tweak some of these settings.

### Page Headers

H1 should only be used for Page Titles in banners (see below).

Use H2, H3, H4, H5, and H6 to define sections within a page. For example, major sections would use H2. Sub sections under each H2 would use H3, etc. Each number represents another nested level. Most pages will only used H2 and H3.

### Copy

Wrap text in P tag.

    <h2>Section header</h2>
    <p>some text goes here</p>

### Email Addresses

When displaying email addresses on the site, use the following format to avoid spam. This converts the text to an email address in your browser, but prevents bots from seeing the full address.

    <span class="email">landon[at]grrowing.org</span>

### Buttons

To make a link appear as a button, add class="button". For ex.

    <a href="/junior/join" class="button">Register</a>

### Tables

For tables, use the class="content". This will give them the correct format.

    <table class="content">
      <tr>
        <td></td>
      </tr>
    </table>

### Gadget Style

For WildApricot gadgets, use style "None" or "Common style 4".

### Page Image Banners

Replace the portions in all caps.

	<div id='banner'>
		<img src='/resources/img/IMAGE-NAME.jpg' width=940 height=180 alt="DESCRIPTION OF PHOTO" title="Photo &copy;2014 PHOTOGRAPHER" />
		<h1 class='upper-left light'>PAGE NAME</h1>
	</div>

### Class Options for H1 appearing over image

* lower-left
* lower-right
* middle-left
* middle-right
* upper-left
* upper-right
* light
* dark
* light-shadow
* dark-shadow

### ArtText

Landon, if you use ArtText on any page, I'll ship you back to 1995.

## Copy Guide

* Copy should support the objectives. If it does not, fix it or eliminate it.
* Copy should be accurate and short.
* Consider using bullet lists or tables to organize information more visually.
* Assume all site visitors are outsiders. Copy should be easy to understand for users who know nothing about rowing.
* Limit use of jargon. Jargon makes us appear insular to outsiders and we want to be welcoming to outsiders. When jargon is required, use sidebar content to provide definitions and clarity.

### Grammar, Punctuation

* Use single spaces between sentences. Web browsers ignore double spaces and any other white space (tabs, line breaks) anyways.

### Dates

When referencing dates in copy, write in such a way that avoids the need for copy to be updated each year. Avoid referencing specific years for items that occur annually. Dates in copy can add extra work for site maintainers and make the site appear outdated when missed.

#### Bad - Needs to be edited every year.

* Contact the Club's President or Secretary by February 1, 2014 if you are interested in serving on the 2014 board.
* Mary has been a GRRA coach for 3 years.
* The Winter season for 2014 is January to March.

#### Good - Doesn't need editing every year.

* Contact the Club's President or Secretary by February 1 if you are interested in serving on the board.
* Mary has been a GRRA coach since 2011.
* The Winter season is January to March.

Dates in specific events are OK. Ex. "The 2014 Masters National Championship Regatta is at Riverside Park in Grand Rapids on August 14-17, 2014."

### Verb Tense

Pay attention to verb tense in copy. How does it read now? How will it read in the future?

* Past - For events that were *always* in the past, use past tense. Ex. "The boathouse **was** built in 2006."
* For events where the tense will change once the even occurs, avoid using future tense. Ex. "2014 Masters National **will be** on Aug 14 to 17, 2014." This statement reads fine now, but will not make sense on Aug 18. This adds extra work to maintain the site or makes the site look out of date if missed. In these cases, use present tense. Ex. "2014 Masters National **is** Aug 14 to 17, 2014." This will read better now and after. Instead of "Board member elections **will be** held in February." say "Board Member elections **are** held in February."

## Image Guide

image | dimensions | quantity | description
----- | ---------- | -------- | -----------
Home Hero | 940x340 | 3-5 |Big splashy images that showcase the sport of rowing at our club. **Our best photography goes here.** These images should impress outsiders.
Home Promos | 220x110 | 3 | Images relating to the subject matter of the promo.
Landing Header | 940x180 | 5 | Wide images relating to the subject of the section. May be more artistic in nature, as these pages will also contains many Menu Images. **Best header images for each section should be on landing pages.**
Menu | 200x150 | dozens | A grid of menu images will appear on the landing page. Each image should relate to the content page it references.
Content Header | 940x180 | dozens | Wide image relating to the subject of the page. May be more artistic in nature.
Content images | max 660 wide | many | These images appear in the main content body of a page.
Sidebar images | max 220 wide | many | These images appear in the sidebar of content pages.
Gallery images | 400x300 | many | These images appear on gallery content pages.

* The **Menu** image and **Header** image for each page do not need to be from the same photograph, but using similar styles for both will be visually consistent.