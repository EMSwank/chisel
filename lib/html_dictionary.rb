module HtmlDictionary

  HEADER_TAGS   = { "#"       => "<h1> </h1>",
                    "##"      => "<h2> </h2>",
                    "###"     => "<h3> </h3>",
                    "####"    => "<h4> </h4>",
                    "#####"   => "<h5> </h5>",
                    "######"  => "<h6> </h6>"
                  }

  SPLAT_TAGS    = { "*"   => "<em> </em>",
                    "**"  => "<strong> </strong>"
                  }

  LIST_TAGS     = { "*"  => "<li> </li>\n"  }

end
