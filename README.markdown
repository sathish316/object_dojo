ObjectDojo is a utility to practice Object oriented programming using the rules described in the article "Object Calisthenics" by JeffBay:

[www.xpteam.com/jeff/writings/objectcalisthenics.rtf](www.xpteam.com/jeff/writings/objectcalisthenics.rtf)

### The Rules

1. One level of indentation per method
2. Don’t use the ELSE keyword
3. Wrap all primitives and Strings￼(Not implemented)
4. First class collections
5. One dot per line
6. Don’t abbreviate (Not implemented)
7. Keep all entities small
8. No classes with more than two instance variables
9. No getters/setters/properties

### Installation

To install object dojo

$ gem install object_dojo

### Usage

Run the command line utility dojo with path to code

$ dojo /path/to/code

### Configure

The rules can be configured by passing command line options. To get the full list of command line options

$ dojo -h

#### Supported languages

The current version supports only Ruby.