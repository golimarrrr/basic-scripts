# _really_ basic DokuWiki (MediaWiki) to Redmine (Textile) converter
# For up to date versions of DokuWiki and Redmine there are better tools available, like https://github.com/GSI/mrmt
# This worked for converting from DokuWiki 2009-12-25c to Redmine 1.2.1
# Usage: perl dokuwiki2redmine.pl < /var/www/dokuwiki/data/pages/path/mypage.txt

while (<>) {

        s/\\\\/&nbsp;/g;                # blank line

        s/^  \*/*/g;                    # L1 indent
        s/^    \*/**/g;                 # L2 indent
        s/^      \*/***/g;              # L3 indent
        s/^        \*/****/g;           # L4 indent

        s/ -> / &rarr; /g;              # right arrow

        s/''(.+)''/@ $1 @/g;            # monospace

        s/====== (.+) ======/h2. $1/g;  # headings

        s/\*\* (.+) \*\*/**$1**/g;      # bold: * ... * --> *...*

        s/%%(.+)%%/<notextile>$1<\/notextile>/g;        # nowiki

        s|<del>(.+)</del>|-$1-|g;       # strike-through

        s|<code>|<pre>|g;
        s|</code>|</pre>|g;

        print;

}

