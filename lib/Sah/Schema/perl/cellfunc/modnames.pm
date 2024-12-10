package Sah::Schema::perl::cellfunc::modnames;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [array => {
    summary => 'Array of Perl CellFunc::* module names without the prefix, e.g. ["File::stat_row", "File::Media::attr_row"]',
    description => <<'MARKDOWN',

Array of Perl CellFunc::* module names, where each element is of
`perl::cellfunc::modname` schema, e.g. `File::stat_row`,
`File::Media::attr_row`.

Contains coercion rule that expands wildcard, so you can specify:

    File::*

and it will be expanded to e.g.:

    ["File::stat_row", "File::exists"]

The wildcard syntax supports jokers (`?`, `*`, `**`), brackets (`[abc]`), and
braces (`{one,two}`). See <pm:Module::List::Wildcard> for more details.

MARKDOWN
    of => ["perl::cellfunc::modname", {req=>1}],

    'x.perl.coerce_rules' => [
        ['From_str_or_array::expand_perl_modname_wildcard', {ns_prefix=>'CellFunc'}],
    ],

    # provide a default completion which is from list of installed perl modules
    'x.element_completion' => ['perl_modname', {ns_prefix=>'CellFunc'}],

}];

1;
# ABSTRACT:
