sub merge_sort {
    my (@list) = @_;
    return @list if @list < 2;
    my $middle = int(@list / 2);
    my @left = merge_sort(@list[0 .. $middle - 1]);
    my @right = merge_sort(@list[$middle .. $#list]);
    return merge(\@left, \@right);
}

sub merge {
    my ($left, $right) = @_;
    my @merged;
    while (@$left && @$right) {
        push @merged, (($left->[0] < $right->[0]) ? shift(@$left) : shift(@$right));
    }
    push @merged, @$left, @$right;
    return @merged;
}

my @list = (4, 65, 2, -31, 0, 99, 2, 83, 782, 1);
my @sorted = merge_sort(@list);
print "@sorted\n";
