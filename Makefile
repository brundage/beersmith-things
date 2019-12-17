beersmith_version = 3

builddir = build/.beersmith$(beersmith_version)
sourcedir = src
installdir = $${HOME}

brewsheetsrc = $(sourcedir)/deans_brewlog.html
builtbrewsheet = $(builddir)/Reports/deans_brewlog.html
cssdir=$(sourcedir)/css
css = $(wildcard $(cssdir)/*css)

all : $(builtbrewsheet)

.PHONY : css

clean :
	rm -rf build

install : all
	rsync -aHSL "$(builddir)" "$(installdir)"

$(builtbrewsheet) : $(builddir) css $(brewsheetsrc)
	tpage --include_path="$(cssdir)" "$(brewsheetsrc)" > "$@"

$(builddir) :
	mkdir -p "$(builddir)/Reports"
