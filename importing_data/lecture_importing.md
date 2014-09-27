# Finding and Using Data

[Revealer](http://justinbakse.com/revealer/https://raw.githubusercontent.com/jbakse/psam5600_demos/master/importing_data/lecture_importing.md)

## Data Sources

The Internet contains a literally unfathomable amount of information. Estimates on the size of the Internet vary widely, but it seems safe to say there are hundreds of billions of web pages. By bytes, web pages are only a small part of the total data on the Internet. 

A great deal of this information is uninteresting. Much of it is unavailable to the public. Much of it may just be poorly formated, incomplete, inaccurate, fabricated, or otherwise unusable. That said, there is still a great deal of interesting, public, usable data.

---

## Downloadable Data Sets

- [Data.gov](http://www.data.gov/)
- [Federal Reserve Economic Data](http://research.stlouisfed.org/fred2/)
- [R Data Sets](http://vincentarelbundock.github.io/Rdatasets/)
- [World Health Organization](http://apps.who.int/gho/data/node.main)
- [Visulizing.org](http://www.visualizing.org/data/browse)

If data is available, sometimes it is easy to find with a simple [google search](https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#safe=off&q=box%20office%20profits%20csv).

---

## Data APIs

Many websites offer data through interactive API calls. In this model, rather than downloading the complete set of data, you request specific queries and receive the results. This arrangement is useful when you are developing an application that will want to access up-to-date information, or display information interactively.


---


## Data File Formats

There are many [data formats](http://en.wikipedia.org/wiki/Comparison_of_data_serialization_formats) used to represent data in digital files. Three very common formats that can be read by Processing are CSV, XML, and JSON.

---

## Spreadsheet / Tabular Data

- Comma Seperated/Delimited Values (CSV)
- Tab Seperated/Delimited Values (TSV)

---

Example .csv

```csv
Name,Species,Age
Mr. Angsty,Cat,3
Lucky,Cat,4
Captain,Dog,3
```

---

### Nested Data

- Javascript Object Notation (JSON)
- Extensible Markup Language (XML)

---

Example .json

```json
[
	{
		"age": 3,
		"species": "Cat",
		"name": "Mr. Angsty"
	},
	{
		"age": 4,
		"species": "Cat",
		"name": "Lucky"
	},
	{
		"age": 3,
		"species": "Dog",
		"name": "Captain"
	}
]
```

---

Example .xml

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<animals>
	<animal>
		<age>3</age>
		<species>Cat</species>
		<name>Mr. Angsty</name>
	</animal>
	<animal>
		<age>4</age>
		<species>Cat</species>
		<name>Lucky</name>
	</animal>
	<animal>
		<age>3</age>
		<species>Dog</species>
		<name>Captain</name>
	</animal>
<animals>
```

------


## Importing Data to Processing

- [loadTable()](http://www.processing.org/reference/loadTable_.html) Loads .csv and .tsv files
- [loadJSONObject()](http://www.processing.org/reference/loadJSONObject_.html) Loads 
- [loadXML()](http://www.processing.org/reference/loadXML_.html) Loads .xml files

---

[Example Project: Importing CSV with Processing](https://github.com/jbakse/psam5600_demos/tree/master/importing_data/example_importing)



