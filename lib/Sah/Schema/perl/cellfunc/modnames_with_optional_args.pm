package Sah::Schema::perl::cellfunc::modnames_with_optional_args;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [array => {
    summary => 'Array of Perl CellFunc::* module names without the prefix, with optional args, e.g. ["File::stat_row,follow_symlink,0", "File::Media::attr_row"]',
    description => <<'MARKDOWN',

Array of Perl CellFunc::* module names without the prefix and with optional
args. Each element is of `perl::cellfunc::modname` schema, e.g.
`File::stat_row`, `File::Media::attr_row`.

Contains coercion rule that expands wildcard, so you can specify:

    File::*

and it will be expanded to e.g.:

    ["File::attr_row", "File::exists"]

The wildcard syntax supports jokers (`?`, `*`, `**`), brackets (`[abc]`), and
braces (`{one,two}`). See <pm:Module::List::Wildcard> for more details.

MARKDOWN
    of => ["perl::cellfunc::modname_with_optional_args", {req=>1}],

    'x.perl.coerce_rules' => [
        ['From_str_or_array::expand_perl_modname_wildcard', {ns_prefix=>'CellFunc'}],
    ],

    # provide a default completion which is from list of installed perl modules
    'x.element_completion' => ['perl_cellfunc_modname_with_optional_args'],

}];

1;
# ABSTRACT:
