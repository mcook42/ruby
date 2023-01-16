# Notes

## Build tools (gem, rake)
- There are two ways to call other files from within ruby code.  The two are `load` and `require`
    - `load` is like `require` lite.  It will run the file called as many times as `load("foo.bar")` is called.
    `require` will only call the file once no matter how many times `require("foo.bar")` is called.
    - `require` keeps track of the known paths-to-files in `$LOAD_PATH` much like unix does in `$PATH`.  It seems pretty
    similar to Java"s classpath, but it"s not as much of a pain to understand and work with.
    - `require` doesn"t need file extensions or absolute paths to load a file because it loops through the directories
    in `$LOAD_PATH` to find the file you are referencing
    - `require` also keeps track of which files have been loaded via the `$LOADED_FEATURES` env variable
    - `require` does not check the current directory, since the current directory is by default not in $LOAD_PATH
    - `require_relative` is like `require` but it looks for the file referenced in the same directory as the calling file.
        For example, take a project with two files `~/my-repo/main/foo.rb` and `~/my-repo/bar.rb`.  If foo.rb uses
        `require("bar.rb")` bar.rb will not be found. If foo.rb uses `require_relative("bar.rb") bar.rb will be found
- A gem is a ruby package used by the RubyGems package manager.  Gems are zip files containing ruby files, metadata, and
    dynamic library files. It's a bundle of the files needed to understand and run whatever code is included in the gem
- `gem install [library name]` to install new gems much like `npm install [library name]`
- To see where on my filesystem the gems are saved and where they were downloaded from, run `gem environment`
- The sane default for gem hosting is `https://rubygems.org`, but this can be overridden much like maven repository locations
and linux repository locations can be overridden. The reasons to override seem like much the same as with java/linux
- `gem install [library name] -v [version number]` allows for specific versions to be downloaded. This seems a little risky
because it allows for multiple versions of that library to be installed.  It could lead to dependency hell like you've
seen in java when multiple versions of a library are imported and different code uses those different versions.  It's
probably smart to avoid this as much as possible, but the option is there, so it's likely there are cases where installing
multiple versions is the right decision
- To import a specific version of a library in a ruby file, use `gem('library name', 'version number')`. Once this
has been called, the specific version number is loaded into the LOAD_PATH, so subsequent code can use `load` and `require`
like usual to use the specific version.  Once again, this seems like a bad idea, but it may have a use case.
- `Gemfile` is a way to specify all of the gems a project needs, and optionally which versions of the gems.  The `bundle`
command installs all these gems AND their dependencies. This is similar to a pom.xml file in maven and package.json in node.js
- `bundle` also creates a `Gemfile.lock` to lock in the specified versions. This is similar to how node (npm/yarn) works with package/yarn.lock files
- To force a subsequent command to use the version of a library specified in the Gemfile.lock file, prefix your command
with `bundle exec`. For example, `bundle exec ruby foo.rb` will include the version of a gem from the lockfile, while
`ruby foo.rb` will use the latest version. Use the lockfile religiously so that you don't open yourself up to supply-chain
attacks and randomness during a build.

## Language and syntax
- Symbols and Strings are NOT the same
- Symbols are defined like `:symbol_name` and are IMMUTABLE. These are string constants and are always referenced as the
same object at the same memory location.
- Strings are defined like `str = "my string"` and are MUTABLE. Every time a string is written it creates a new object
with a new place in memory, even if the string is identical to an existing string.
- “If the textual content of the object is important, use a String. If the identity of the object is important, use a Symbol.” -Jim Weirich
- Use Symbols for hash keys or the identity of the key will be in question. Strings can be identical to a human but different to the machine


### Helpful Documentation
- [Load/Require/Gems](https://medium.com/@connorstack/understanding-ruby-load-require-gems-bundler-and-rails-autoloading-from-the-bottom-up-3b422902ca0)
- [Syntax Cheatsheet](https://github.com/ThibaultJanBeyer/cheatsheets/blob/master/Ruby-Cheatsheet.md)
- [Symbols and Strings](https://medium.com/@lcriswell/ruby-symbols-vs-strings-248842529fd9)
