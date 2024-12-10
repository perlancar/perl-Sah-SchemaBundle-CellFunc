package Sah::Schema::perl::cellfunc::modname_with_optional_args;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'Perl CellFunc::* module name without the prefix (e.g. File::stat_row) with optional arguments (e.g. File::stat_row,follow_symlink,1)',
    description => <<'MARKDOWN',

Perl CellFunc::* module name without the prefix, with optional arguments which
will be used as import arguments, just like the `-MMODULE=ARGS` shortcut that
`perl` provides. Examples:

    File::stat_row
    File::stat_row,follow_symlink,0
    File::stat_row=follow_symlink,0

See also: `perl::cellfunc::modname`.

MARKDOWN
    match => '\A[A-Za-z_][A-Za-z_0-9]*(::[A-Za-z_0-9]+)*(?:=.*)?\z',

    'prefilters' => [
        'Perl::normalize_perl_modname',
    ],

    # XXX also provide completion for arguments
    'x.completion' => ['perl_cellfunc_modname_with_optional_args'],

    examples => [
        {value=>'', valid=>0},
        {value=>'Foo/Bar', valid=>1, validated_value=>'Foo::Bar'},
        {value=>'Foo/Bar=a,1,b,2', valid=>1, validated_value=>'Foo::Bar=a,1,b,2'},
        {value=>'Foo bar', valid=>0},
    ],

}];

1;
# ABSTRACT:
