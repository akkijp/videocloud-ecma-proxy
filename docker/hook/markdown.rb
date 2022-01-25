r = Nginx::Request.new
r.content_type = "text/html"

# setup markdown engine
title = "md test"
css = "https://gist.github.com/andyferra/2554919/raw/2e66cabdafe1c9a7f354aa2ebf5bc38265e638e5/github.css"
md = Discount.new css, title

# create markdown data
body = <<DATA

# Section
## aaa

- hoge
- foo

## bbb

__code__

    a = 1
    b = a + 1

DATA

# create html
html = md.header
html << body.to_html
html << md.footer

# create response
Nginx.echo html
