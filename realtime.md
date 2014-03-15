# Creating a Realtime Data Visualization
  
-----

##What a Webpage Is

A webpage is document that can be viewed by a web browser.

Usually this document is made up of multiple files:

- Hyper Text (.html)
- Cascading Style Sheet (.css)
- Javscript (.js)
- Images (.png, .jpg)


---

##Hyper Text Markup Language

The `.html` file is the main file of a web page. It describes the content of the page and tells the browser what other files to load.

The main piece of syntax in HTML is a tag. Tags usually come in pairs, and describe what kind of content they contain. The `<h1></h1>` tag pair shows that "A Great Example" is a headline. Tags can be nested to indicate structure. 

Tags are how the browser understands the nature of your text.


```html
<!DOCTYPE html>
<html>
<head>
	<title>An Example Page</title>
</head>
<body>
	<h1>A Great Example</h1>
	<p>This is an example.</p>
</body>
</html>
```

[Dive Into HTML5](http://diveintohtml5.info/)  
[MDN HTML5](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5/Introduction_to_HTML5)


---

##Cascading Style Sheets

The `.css` file(s) define how different types of content should look.

A CSS file will contain many **rulesets**. Each ruleset will begin with one or more **selectors** that describe what types of content they apply to. After the selector is a block of **declarations** that describe how to style the content.

Every rule with a selector that matches an element in the HTML will be applied. If the ruleset contains declarations for the same property, the value in the ruleset with the **most specific** selector will be used.

```css
body
{
  background-color: black;
  color: white; 
}

h1, h2
{
	font-size: 50px;
}

p
{
	background-color: gray;
  font-size: 20px;
	padding: 10px;
}
```

[MDN CSS](https://developer.mozilla.org/en-US/docs/Web/CSS)


---

##JavaScript

The `.js` file(s) define the web page behavior. They are computer programs that the browser will run. While the run they can access and modify the web page content using a library provided by the browser called the Document Object Model (DOM).

The syntax of JavaScript is similar to that of Processing.

```javascript
window.onload = function() {
  newParagraph = document.createElement("p");
  text = document.createTextNode("Hello, World!");
  newParagraph.appendChild(text);
  document.body.appendChild(newParagraph);  
}
```

[MDN DOM](https://developer.mozilla.org/en-US/docs/DOM/DOM_Reference/Introduction#DOM_and_JavaScript)


---

<p data-height="304" data-theme-id="0" data-slug-hash="fsrDt" data-default-tab="result" class='codepen'>See the Pen <a href='http://codepen.io/jbakse/pen/fsrDt'>A Basic Webpage</a> by Justin Bakse (<a href='http://codepen.io/jbakse'>@jbakse</a>) on <a href='http://codepen.io'>CodePen</a>.</p>
<script async src="//codepen.io/assets/embed/ei.js"></script>

------

[Reveal Slideshow](http://justinbakse.com/reveal/index.php?src=https://raw.github.com/jbakse/psam5600_demos/master/realtime.md#/)
