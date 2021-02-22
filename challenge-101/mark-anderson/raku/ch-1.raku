#!/usr/bin/env raku

use Test;
plan 7;

is-deeply pack-a-spiral(1..4),     [[4,3], [1,2]];
is-deeply pack-a-spiral(1..6),     [[6,5,4], [1,2,3]];
is-deeply pack-a-spiral(1..12),    [[9,8,7,6], [10,11,12,5], [1,2,3,4]];
is-deeply pack-a-spiral(1..17),    [[1..17],];
is-deeply pack-a-spiral("A".."Z"), [["Z"..."N"], ["A".."M"]];
is-deeply pack-a-spiral(1..143),
[
[35,  34,  33,  32,  31,  30,  29,  28,  27,  26,  25,  24,  23], 
[36,  73,  72,  71,  70,  69,  68,  67,  66,  65,  64,  63,  22], 
[37,  74, 103, 102, 101, 100,  99,  98,  97,  96,  95,  62,  21], 
[38,  75, 104, 125, 124, 123, 122, 121, 120, 119,  94,  61,  20], 
[39,  76, 105, 126, 139, 138, 137, 136, 135, 118,  93,  60,  19], 
[40,  77, 106, 127, 140, 141, 142, 143, 134, 117,  92,  59,  18], 
[41,  78, 107, 128, 129, 130, 131, 132, 133, 116,  91,  58,  17], 
[42,  79, 108, 109, 110, 111, 112, 113, 114, 115,  90,  57,  16], 
[43,  80,  81,  82,  83,  84,  85,  86,  87,  88,  89,  56,  15], 
[44,  45,  46,  47,  48,  49,  50,  51,  52,  53,  54,  55,  14], 
[ 1,   2,   3,   4,   5,   6,   7,   8,   9,  10,  11,  12,  13]
];
is-deeply pack-a-spiral(1..144),
[
[34,  33,  32,  31,  30,  29,  28,  27,  26,  25,  24,  23], 
[35,  72,  71,  70,  69,  68,  67,  66,  65,  64,  63,  22], 
[36,  73, 102, 101, 100,  99,  98,  97,  96,  95,  62,  21], 
[37,  74, 103, 124, 123, 122, 121, 120, 119,  94,  61,  20], 
[38,  75, 104, 125, 138, 137, 136, 135, 118,  93,  60,  19], 
[39,  76, 105, 126, 139, 144, 143, 134, 117,  92,  59,  18], 
[40,  77, 106, 127, 140, 141, 142, 133, 116,  91,  58,  17], 
[41,  78, 107, 128, 129, 130, 131, 132, 115,  90,  57,  16], 
[42,  79, 108, 109, 110, 111, 112, 113, 114,  89,  56,  15], 
[43,  80,  81,  82,  83,  84,  85,  86,  87,  88,  55,  14], 
[44,  45,  46,  47,  48,  49,  50,  51,  52,  53,  54,  13], 
[ 1,   2,   3,   4,   5,   6,   7,   8,   9,  10,  11,  12]
];

sub pack-a-spiral(@A is copy)
{
    my $f = tightest-factor(+@A);
    my @k = @A.keys.rotor($f);
    @k = spiral(@k.map(*.Array).Array);
    @A[@k] = @A;
    @A.rotor($f).map(*.Array).reverse.Array;
}

sub tightest-factor($n)
{
    return $n if $n.is-prime;
    my $s = sqrt($n);
    return $s if $s.narrow ~~ UInt;
    my @f = grep { $n %% $_ }, 2..$n div 2;
    return @f[+@f div 2];
}

#
# code from challenge 88
#
sub spiral(@m) 
{
    my @r;

    while @m 
    {
        @r.append: |@m.shift; 
        try { @r.push: .pop } for @m;
        try @r.append: $_ given @m.pop.reverse; 
        try -> $i { @r.push: .[$i].shift } for .end...0 given @m; 
    }

    @r;
} 
