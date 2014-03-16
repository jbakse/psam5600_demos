# Creating a Realtime Data Visualization
  
------

##What a Web Page Is

A web page is document that can be viewed by a web browser.

Usually this document is made up of multiple files:

-	Hyper Text (.html)
-	Cascading Style Sheet (.css)
-	JavaScript (.js)
-	Images (.png, .jpg)


---

##Hyper Text Markup Language

The `.html` file is the main file of a web page. It describes the content of the page and tells the browser what other files to load.

The main piece of syntax in HTML is a tag. Tags usually come in pairs, and describe what kind of content they contain. The `<h1></h1>` tag pair shows that "A Simple Example" is a headline. Tags can be nested to indicate structure. 

Tags are how the browser understands the nature of your text.


```html
<!DOCTYPE html>
<html>
<head>
	<title>An Example Page</title>
</head>
<body>
	<h1>A Simple Example</h1>
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
  text = document.createTextNode("Hello, JavaScript!");
  newParagraph.appendChild(text);
  document.body.appendChild(newParagraph);  
}
```

[MDN DOM](https://developer.mozilla.org/en-US/docs/DOM/DOM_Reference/Introduction#DOM_and_JavaScript)


---

<p data-height="304" data-theme-id="0" data-slug-hash="fsrDt" data-default-tab="result" class='codepen'>See the Pen <a href='http://codepen.io/jbakse/pen/fsrDt'>A Basic Webpage</a> by Justin Bakse (<a href='http://codepen.io/jbakse'>@jbakse</a>) on <a href='http://codepen.io'>CodePen</a>.</p>
<script async src="//codepen.io/assets/embed/ei.js"></script>

------

##How the Browser Renders the Document

-	Loads the `.html`
-	Creates an internal representation of the document structure and content
-	Loads linked assets like `.css` and `.js` files.
-	For each element in the document, applies matching CSS rulesets.
-	Determines layout of the document.
-	Displays initial view of the document.
-	Runs the JavaScript, updating the view when the program modifies the representation of the document.

------

##Demo: A Basic Web Page

-	HTML
-	CSS
-	JavaScript
-	Chrome Developer Tools

------

##Web Servers

Web servers are computers that send web files over the Internet. They listen for requests, and respond with the corresponding resource. The request will contain a few pieces of information including the address the request coming from, and a **URL** (Uniform Resource Locator). The URL is a reference to a specific resource. Often the URL will describe a file on the server, and the server will send the contents of that file in the response.

You can use your browser to display local files, but you need to use a server if you want people to be able to access your web page via the Internet.

Browsers act a little differently when they are showing local files instead of files served over the network connection. Because of this, it is sometimes helpful to run web server software on your own machine during development. When your browser requests the files from the local web server, it will act the same way it would with files loaded from a remote web server.

On OS X, two common ways you can run a local server are MAMP or Python.

[MAMP](http://www.mamp.info/en/)  
[Python](https://github.com/mbostock/d3/wiki)

-----

-----

##JQuery

JQuery is a JavaScript Library for working with web content. It makes many things easier and more consistent across browsers.

```javascript
window.onload = function() {
  newParagraph = document.createElement("p");
  text = document.createTextNode("Hello, World!");
  newParagraph.appendChild(text);
  document.body.appendChild(newParagraph);  
}
```
becomes

```javascript
$( function () {
	$("body").append("<p>Hello, JQuery!</p>");
});
```

[JQuery](http://jquery.com/)  
[Tutorials](http://learn.jquery.com/)  
[API Ref](http://api.jquery.com/)  
[devdocs.io](http://devdocs.io)  


-----

##D3

D3 is a JavaScript Library for working creating Data Driven Documents.

- Select and Manipulate DOM Elements
- Select and Manipulate SVG Elements
- Bind (Associate) data with elements
- Manipulate Data
- Quickly generating common types of visualizations

```javascript
d3.select("body")
    .selectAll("div")
    .data([3, 10, 4, 7])
    .enter()
    .append("div")
    .attr("class", "bar")
    .style("width", function(d) {
        return d * 50 + "px";
    });
```

[D3](http://d3js.org/)  
[D3 Tutorials](https://github.com/mbostock/d3/wiki)  
[More Tutorials](http://alignedleft.com/tutorials/d3/)  
[API Ref](https://github.com/mbostock/d3/wiki/API-Reference)  
[devdocs.io](http://devdocs.io)  

----

##Method Chaining

Method Chaining is a style of programming where you call a second method on the result of the first directly. This allows for very succinct code. In order to work, each methods you are using must return a value appropriate for to call the next method on.

<p data-height="268" data-theme-id="0" data-slug-hash="rptun" data-default-tab="result" class='codepen'>See the Pen <a href='http://codepen.io/jbakse/pen/rptun'>D3 Survey Demo, Basic</a> by Justin Bakse (<a href='http://codepen.io/jbakse'>@jbakse</a>) on <a href='http://codepen.io'>CodePen</a>.</p>
<script async src="//codepen.io/assets/embed/ei.js"></script>

------

##JSFiddle and CodePen

JSFiddle and CodePen are both websites that let you make small html, css, js demos and easily share them.

[CodePen](http://codepen.io/)
[Example](http://codepen.io/Matnard/pen/EILwl)

[JSFiddle](http://jsfiddle.net/)
[Example](http://jsfiddle.net/apipkin/qUTwQ/light/)

------

##Demo: A Basic Web Page

-	HTML, CSS, JavaScript on CodePen
-	Adding D3
-	Basic Bar Chart
-	Survey Example

------

##Data: APIs

JSON is JavaScript Object Notation, it is a way to include a complex JavaScript as a literal in your code or in a file to be loaded.

JSONP means JSON with Padding. It is a convention to wrap JSON in a function call to make loading data from another domain easy, without violating XSS rules enforced by the browser.

[Stack Exchange API](https://api.stackexchange.com/)
[Request Builder](https://api.stackexchange.com/docs/questions#pagesize=1&order=desc&sort=activity&filter=default&site=stackoverflow&run=true)
[Sample Response JSON](https://api.stackexchange.com/2.2/questions?pagesize=1&order=desc&sort=activity&site=scifi)
[Sample Response JSONP](https://api.stackexchange.com/2.2/questions?pagesize=1&order=desc&sort=activity&site=scifi&callback=callme)

What the request URL looks like:
<https://api.stackexchange.com/2.2/questions?pagesize=10&order=desc&sort=activity&site=scifi&filter=!)srVcvVeY6)9bllt7InG>

http://codepen.io/jbakse/pen/bgmkB

------

##Class Examples

[GitHub Examples](https://github.com/jbakse/psam5600_demos)
[Code Pen Examples](http://codepen.io/collection/jsEfA/)
